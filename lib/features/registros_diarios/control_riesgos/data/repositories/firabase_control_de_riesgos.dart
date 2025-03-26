import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:registro_uci/features/registros_diarios/control_riesgos/domain/models/control_de_riesgos.dart';
import 'package:registro_uci/features/registros_diarios/control_riesgos/data/abstract_repositories/control_de_riesgos_repository.dart';
import '../dto/create_control_riegos_dto.dart';

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

    // Guardar en Firestore
    await controlDeRiesgosRef.add(controlDeRiesgosMap);
  }

  @override
  Future<List<ControlDeRiesgos>> getControlDeRiesgos(
    String idIngreso,
    String idRegistroDiario,
  ) async {
    final controlDeRiesgosRef = _firestore
        .collection('ingresos')
        .doc(idIngreso)
        .collection('registrosDiarios')
        .doc(idRegistroDiario)
        .collection('controlDeRiesgos');

    final querySnapshot = await controlDeRiesgosRef.get();
    return querySnapshot.docs.map((doc) {
      return ControlDeRiesgos.fromJson(doc.data(), id: doc.id);
    }).toList();
  }

  @override
  Future<void> updateControlDeRiesgos(
    String idIngreso,
    String idRegistroDiario,
    String idControlDeRiesgos,
    ControlDeRiesgos controlDeRiesgos,
  ) async {
    final controlDeRiesgosRef = _firestore
        .collection('ingresos')
        .doc(idIngreso)
        .collection('registrosDiarios')
        .doc(idRegistroDiario)
        .collection('controlDeRiesgos')
        .doc(idControlDeRiesgos);

    await controlDeRiesgosRef.update(controlDeRiesgos.toJson());
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
