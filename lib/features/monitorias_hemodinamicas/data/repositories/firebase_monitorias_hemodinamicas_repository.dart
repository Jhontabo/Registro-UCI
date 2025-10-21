import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:registro_uci/common/constants/firebase_collection_names.dart';
import 'package:registro_uci/features/monitorias_hemodinamicas/domain/models/monitoria_hemodinamica.dart';
import 'package:registro_uci/features/monitorias_hemodinamicas/data/abstract_repositories/monitorias_hemodinamicas_repository.dart';

class FirebaseMonitoriaHemodinamicaRepository
    implements MonitoriaHemodinamicaRepository {
  final FirebaseFirestore _firestore;

  FirebaseMonitoriaHemodinamicaRepository({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  // Método helper para obtener referencia a la colección
  CollectionReference<Map<String, dynamic>> _obtenerColeccion(
      {required String idIngreso, required String idRegistroDiario}) {
    return _firestore
        .collection(FirebaseCollectionNames.ingresos)
        .doc(idIngreso)
        .collection(FirebaseCollectionNames.registrosDiarios)
        .doc(idRegistroDiario)
        .collection(FirebaseCollectionNames.monitoriasHemodinamicas);
  }

  @override
  Future<List<MonitoriaHemodinamica>> obtenerTodasLasMonitorias({
    required String idIngreso,
    required String idRegistroDiario,
  }) async {
    try {
      final query = await _obtenerColeccion(
        idIngreso: idIngreso,
        idRegistroDiario: idRegistroDiario,
      ).orderBy('orden', descending: false).get();

      return query.docs.map((doc) {
        return MonitoriaHemodinamica.fromJson(doc.data(), id: doc.id);
      }).toList();
    } catch (e) {
      throw Exception('Error obteniendo monitorías hemodinámicas: $e');
    }
  }

  @override
  Future<MonitoriaHemodinamica?> obtenerMonitoriaPorId({
    required String idIngreso,
    required String idRegistroDiario,
    required String idMonitoria,
  }) async {
    try {
      final doc = await _obtenerColeccion(
        idIngreso: idIngreso,
        idRegistroDiario: idRegistroDiario,
      ).doc(idMonitoria).get();

      return doc.exists
          ? MonitoriaHemodinamica.fromJson(doc.data()!, id: doc.id)
          : null;
    } catch (e) {
      throw Exception('Error obteniendo monitoría por ID: $e');
    }
  }

  @override
  Future<void> crearMonitoria({
    required String idIngreso,
    required String idRegistroDiario,
    required int hora,
    int? pas,
    int? pad,
    int? pam,
    int? fc,
    int? fr,
    double? t,
    int? pvc,
    int? rvc,
    int? fio2,
    int? pia,
    int? ppa,
    int? pic,
    int? ppc,
    int? glucometria,
    int? insulina,
    int? saturacion,
  }) async {
    try {
      final coleccion = _obtenerColeccion(
        idIngreso: idIngreso,
        idRegistroDiario: idRegistroDiario,
      );

      // Calcular PAM si no está definida
      final pamCalculada = pam ?? _calcularPAM(pas, pad);

      // Obtener siguiente orden
      final ultimoQuery =
          await coleccion.orderBy('orden', descending: true).limit(1).get();
      final nuevoOrden = ultimoQuery.docs.isEmpty
          ? 1
          : (ultimoQuery.docs.first.data()['orden'] as int) + 1;

      await coleccion.add({
        'hora': hora,
        'orden': nuevoOrden,
        'pas': pas,
        'pad': pad,
        'pam': pamCalculada,
        'fc': fc,
        'fr': fr,
        't': t,
        'pvc': pvc,
        'rvc': rvc,
        'fio2': fio2,
        'pia': pia,
        'ppa': ppa,
        'pic': pic,
        'ppc': ppc,
        'glucometria': glucometria,
        'insulina': insulina,
        'saturacion': saturacion,
      });
    } catch (e) {
      throw Exception('Error creando monitoría hemodinámica: $e');
    }
  }

  @override
  Future<void> actualizarMonitoria({
    required String idIngreso,
    required String idRegistroDiario,
    required String idMonitoria,
    required int hora,
    int? pas,
    int? pad,
    int? pam,
    int? fc,
    int? fr,
    double? t,
    int? pvc,
    int? rvc,
    int? fio2,
    int? pia,
    int? ppa,
    int? pic,
    int? ppc,
    int? glucometria,
    int? insulina,
    int? saturacion,
    int? orden,
  }) async {
    try {
      final datosActualizacion = {
        'hora': hora,
        'pas': pas,
        'pad': pad,
        'pam': pam ?? _calcularPAM(pas, pad),
        'fc': fc,
        'fr': fr,
        't': t,
        'pvc': pvc,
        'rvc': rvc,
        'fio2': fio2,
        'pia': pia,
        'ppa': ppa,
        'pic': pic,
        'ppc': ppc,
        'glucometria': glucometria,
        'insulina': insulina,
        'saturacion': saturacion,
      };

      if (orden != null) {
        datosActualizacion['orden'] = orden;
      }

      await _obtenerColeccion(
        idIngreso: idIngreso,
        idRegistroDiario: idRegistroDiario,
      ).doc(idMonitoria).update(datosActualizacion);
    } catch (e) {
      throw Exception('Error actualizando monitoría: $e');
    }
  }

  @override
  Future<void> eliminarMonitoria({
    required String idIngreso,
    required String idRegistroDiario,
    required String idMonitoria,
  }) async {
    try {
      await _obtenerColeccion(
        idIngreso: idIngreso,
        idRegistroDiario: idRegistroDiario,
      ).doc(idMonitoria).delete();
    } catch (e) {
      throw Exception('Error eliminando monitoría: $e');
    }
  }

  @override
  Future<void> reordenarMonitorias({
    required String idIngreso,
    required String idRegistroDiario,
    required List<String> idsEnOrden,
  }) async {
    try {
      final lote = _firestore.batch();
      final coleccion = _obtenerColeccion(
        idIngreso: idIngreso,
        idRegistroDiario: idRegistroDiario,
      );

      for (int i = 0; i < idsEnOrden.length; i++) {
        lote.update(coleccion.doc(idsEnOrden[i]), {'orden': i + 1});
      }

      await lote.commit();
    } catch (e) {
      throw Exception('Error reordenando monitorías: $e');
    }
  }

  // Método privado para calcular PAM
  int? _calcularPAM(int? pas, int? pad) {
    if (pas == null || pad == null) return null;
    return ((2 * pad + pas) / 3).round();
  }
}
