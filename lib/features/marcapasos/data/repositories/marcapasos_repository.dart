import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:registro_uci/features/marcapasos/data/dto/create_marcapaso_dto.dart';
import 'package:registro_uci/features/marcapasos/data/dto/update_marcapso_dto.dart';
import 'package:registro_uci/features/marcapasos/domain/models/marcapaso.dart';

class MarcapasosRepository {
  final FirebaseFirestore firestore;

  MarcapasosRepository({FirebaseFirestore? firestore})
      : firestore = firestore ?? FirebaseFirestore.instance;

  /// 🔥 **Registrar un marcapaso vinculado a un paciente**
  Future<void> registrarMarcapaso(CreateMarcapasoDto dto) async {
    await firestore
        .collection('pacientes') // 🔥 Se asegura de asociarlo con el paciente
        .doc(dto.idIngreso) // 🔥 Busca al paciente por su ID
        .collection(
            'marcapasos') // 🔥 Guarda dentro de la subcolección del paciente
        .add(dto.toJson());
  }

  /// 🔥 **Obtener todos los marcapasos de un paciente**
  Future<List<Marcapaso>> getMarcapasosByPaciente(String idIngreso) async {
    final querySnapshot = await firestore
        .collection('pacientes')
        .doc(idIngreso)
        .collection('marcapasos')
        .get();

    return querySnapshot.docs
        .map((doc) => Marcapaso.fromJson(doc.data()..addAll({'id': doc.id})))
        .toList();
  }

  /// 🔥 **Obtener un marcapaso específico de un paciente**
  Future<Marcapaso?> getMarcapaso(String idIngreso, String idMarcapaso) async {
    final docSnapshot = await firestore
        .collection('pacientes')
        .doc(idIngreso)
        .collection('marcapasos')
        .doc(idMarcapaso)
        .get();

    if (docSnapshot.exists) {
      return Marcapaso.fromJson(
          docSnapshot.data()!..addAll({'id': docSnapshot.id}));
    } else {
      return null;
    }
  }

  /// 🔥 **Actualizar datos de un marcapaso**
  Future<void> updateMarcapaso(
      String idIngreso, String idMarcapaso, UpdateMarcapasoDto dto) async {
    await firestore
        .collection('pacientes')
        .doc(idIngreso)
        .collection('marcapasos')
        .doc(idMarcapaso)
        .update(dto.toJson());
  }

  /// 🔥 **Eliminar un marcapaso**
  Future<void> deleteMarcapaso(String idIngreso, String idMarcapaso) async {
    await firestore
        .collection('pacientes')
        .doc(idIngreso)
        .collection('marcapasos')
        .doc(idMarcapaso)
        .delete();
  }
}
