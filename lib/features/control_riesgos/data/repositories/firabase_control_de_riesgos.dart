import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:registro_uci/features/control_riesgos/domain/models/control_de_riesgos.dart';
import 'package:registro_uci/features/control_riesgos/data/abstract_repositories/control_de_riesgos_repository.dart';

class FirebaseControlDeRiesgosRepository implements ControlDeRiesgosRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> addControlDeRiesgos(
    String idIngreso,
    String idRegistroDiario,
    ControlDeRiesgos controlDeRiesgos,
  ) async {
    final controlDeRiesgosRef = _firestore
        .collection('ingresos')
        .doc(idIngreso)
        .collection('registrosDiarios')
        .doc(idRegistroDiario)
        .collection('controlDeRiesgos');

    // Convertir el ControlDeRiesgos a un mapa antes de guardarlo
    final controlDeRiesgosMap = controlDeRiesgos.toJson();

    // Guardar en Firestore (en este caso estamos usando add para crear un nuevo documento)
    await controlDeRiesgosRef.add(controlDeRiesgosMap);
  }

  @override
  Stream<List<ControlDeRiesgos>> getControlDeRiesgos(
    String idIngreso,
    String idRegistroDiario,
  ) {
    final controlDeRiesgosRef = _firestore
        .collection('ingresos')
        .doc(idIngreso)
        .collection('registrosDiarios')
        .doc(idRegistroDiario)
        .collection('controlDeRiesgos');

    return controlDeRiesgosRef.snapshots().map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        return ControlDeRiesgos.fromJson(doc.data(), id: doc.id);
      }).toList();
    });
  }

  @override
  Future<void> updateControlDeRiesgos(
    String idIngreso,
    String idRegistroDiario,
    String
        idControlDeRiesgos, // Este parámetro es necesario para ubicar el documento
    ControlDeRiesgos controlDeRiesgos,
  ) async {
    final controlDeRiesgosRef = _firestore
        .collection('ingresos')
        .doc(idIngreso)
        .collection('registrosDiarios')
        .doc(idRegistroDiario)
        .collection('controlDeRiesgos')
        .doc(
            idControlDeRiesgos); // Se usa el ID aquí para actualizar el documento

    await controlDeRiesgosRef.update(controlDeRiesgos.toJson());
  }

  Future<ControlDeRiesgos> getControlDeRiesgosById(
    String idIngreso,
    String idRegistroDiario,
    String idControlDeRiesgos,
  ) async {
    final controlDeRiesgosRef = _firestore
        .collection('ingresos')
        .doc(idIngreso)
        .collection('registrosDiarios')
        .doc(idRegistroDiario)
        .collection('controlDeRiesgos')
        .doc(idControlDeRiesgos); // Usamos el ID para buscar el documento

    final doc = await controlDeRiesgosRef.get();
    if (doc.exists) {
      return ControlDeRiesgos.fromJson(doc.data()!, id: doc.id);
    } else {
      throw Exception('Control de riesgos no encontrado');
    }
  }

  @override
  Future<void> deleteControlDeRiesgos(
    String idIngreso,
    String idRegistroDiario,
    String idControlDeRiesgos,
  ) async {
    final controlDeRiesgosRef = _firestore
        .collection('ingresos')
        .doc(idIngreso)
        .collection('registrosDiarios')
        .doc(idRegistroDiario)
        .collection('controlDeRiesgos')
        .doc(idControlDeRiesgos);

    await controlDeRiesgosRef.delete();
  }
}
