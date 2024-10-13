import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:registro_uci/features/antibioticos/data/abstract_repositories/dosis_tratamiento_repository.dart';
import 'package:registro_uci/features/antibioticos/data/dto/create_dosis_tratamiento_dto.dart';
import 'package:registro_uci/features/antibioticos/domain/models/dosis_tratamiento.dart';

class FirebaseDosisTratamientoRepository implements DosisTratamientoRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<DosisTratamiento>> getDosisTratamiento(
    String idIngreso,
    String idTratamientoAntibiotico,
    String idDiaTratamiento,
  ) async {
    try {
      final dosisSnapshot = await _firestore
          .collection('ingresos')
          .doc(idIngreso)
          .collection('tratamientosAntibioticos')
          .doc(idTratamientoAntibiotico)
          .collection('diasTratamiento')
          .doc(idDiaTratamiento)
          .collection('dosis')
          .get();

      return dosisSnapshot.docs.map((doc) {
        return DosisTratamiento.fromJson(doc.data(), id: doc.id);
      }).toList();
    } catch (e) {
      throw Exception('Failed to get dosis tratamiento: $e');
    }
  }

  @override
  Future<void> createDosisTratamiento(
    String idIngreso,
    String idTratamientoAntibiotico,
    String idDiaTratamiento,
    CreateDosisTratamientoDto dto,
  ) async {
    try {
      final dosisCollection = _firestore
          .collection('ingresos')
          .doc(idIngreso)
          .collection('tratamientosAntibioticos')
          .doc(idTratamientoAntibiotico)
          .collection('diasTratamiento')
          .doc(idDiaTratamiento)
          .collection('dosis');

      await dosisCollection.add(dto);
    } catch (e) {
      throw Exception('Failed to create dosis tratamiento: $e');
    }
  }
}
