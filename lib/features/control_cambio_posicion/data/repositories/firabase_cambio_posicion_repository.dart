import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/models/cambio_posicion.dart';

class FirebaseCambioDePosicionRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<CambioDePosicion>> getCambiosDePosicion(
    String idIngreso,
    String idRegistroDiario,
  ) async {
    try {
      final cambiosDePosicionRef = _firestore
          .collection('ingresos')
          .doc(idIngreso)
          .collection('registrosDiarios')
          .doc(idRegistroDiario)
          .collection('cambiosPosicion');

      final querySnapshot =
          await cambiosDePosicionRef.orderBy('hora', descending: false).get();

      return querySnapshot.docs.map((doc) {
        // Pasa el id directamente a la instancia de CambioDePosicion
        return CambioDePosicion.fromJson(doc.data())
            .copyWith(idCambioDePosicion: doc.id); // Usamos copyWith
      }).toList();
    } catch (e) {
      throw Exception('Error al obtener cambios de posición: $e');
    }
  }
}
