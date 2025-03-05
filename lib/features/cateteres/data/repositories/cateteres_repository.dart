import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/cateter.dart';

// ✅ Definir el proveedor del repositorio
final cateteresRepositoryProvider = Provider<CateterRepository>((ref) {
  return CateterRepository();
});

class CateterRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> agregarCateter(String idIngreso, Cateter cateter) async {
    await _firestore
        .collection('ingresos')
        .doc(idIngreso)
        .collection('cateteres')
        .add(cateter.toJson());
  }

  Future<List<Cateter>> obtenerCateteres(String idIngreso) async {
    final querySnapshot = await _firestore
        .collection('ingresos')
        .doc(idIngreso)
        .collection('cateteres')
        .get();

    return querySnapshot.docs
        .map((doc) => Cateter.fromFirestore(
            doc)) // ✅ Convertir Firestore docs a objetos Cateter
        .toList();
  }

  Future<void> eliminarCateter(String idIngreso, String idCateter) async {
    await _firestore
        .collection('ingresos')
        .doc(idIngreso)
        .collection('cateteres')
        .doc(idCateter)
        .delete();
  }
}

// ✅ Ahora el provider de catéteres está correctamente definido
final cateteresByIngresoProvider =
    FutureProvider.family<List<Cateter>, String>((ref, idIngreso) async {
  final repository = ref.read(cateteresRepositoryProvider);
  return repository
      .obtenerCateteres(idIngreso); // 🔥 Corregido: Llamar al método correcto
});
