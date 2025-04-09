import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/models/cambio_posicion.dart';

class CambioDePosicionRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<CambioDePosicion>> getCambiosDePosicion(
      String idIngreso, String idRegistroDiario) async {
    try {
      final querySnapshot = await _firestore
          .collection('ingresos')
          .doc(idIngreso)
          .collection('registrosDiarios')
          .doc(idRegistroDiario)
          .collection('cambiosDePosicion')
          .get();

      return querySnapshot.docs.map((doc) {
        // Aquí estamos pasando el ID como parte del JSON
        var cambioDePosicion = CambioDePosicion.fromJson(doc.data());
        // Asignar el id del documento de Firestore al objeto
        return cambioDePosicion.copyWith(idCambioDePosicion: doc.id);
      }).toList();
    } catch (e) {
      throw Exception('Error al obtener cambios de posición: $e');
    }
  }
}
