import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:registro_uci/features/resultados/data/abstract_repositories/resultados_repository.dart';
import 'package:registro_uci/features/resultados/domain/models/indicador.dart';
import 'package:registro_uci/features/resultados/domain/models/resultado.dart';

class FirebaseResultadosRepository implements ResultadosRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<Resultado>> getResultadosDeIntervencion(
      String idIntervencion) async {
    try {
      final querySnapshot = await _firestore
          .collection('intervenciones')
          .doc(idIntervencion)
          .collection('resultados')
          .get();

      return querySnapshot.docs
          .map((doc) => Resultado.fromJson(doc.data(), id: doc.id))
          .toList();
    } catch (e) {
      log('Error al obtener los resultados de la intervención: $e');
      throw Exception('Error al obtener los resultados de la intervención');
    }
  }

  @override
  Future<List<Indicador>> getIndicadoresDeResultado(
      String idIntervencion, String idResultado) async {
    try {
      final querySnapshot = await _firestore
          .collection('intervenciones')
          .doc(idIntervencion)
          .collection('resultados')
          .doc(idResultado)
          .collection('indicadores')
          .get();

      return querySnapshot.docs
          .map((doc) => Indicador.fromJson(doc.data(), id: doc.id))
          .toList();
    } catch (e) {
      log('Error al obtener los indicadores del resultado: $e');
      throw Exception('Error al obtener los indicadores del resultado');
    }
  }
}
