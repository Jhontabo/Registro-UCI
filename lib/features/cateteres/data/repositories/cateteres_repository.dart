import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/cateter.dart';
import '../../data/dto/update_cateter_dto.dart';

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

  /// 🔥 **Obtener catéteres en tiempo real**
  Stream<List<Cateter>> obtenerCateteres(String idIngreso) {
    return _firestore
        .collection('ingresos')
        .doc(idIngreso)
        .collection('cateteres')
        .snapshots() // ✅ Ahora escucha cambios en Firestore
        .map((querySnapshot) {
      return querySnapshot.docs
          .map((doc) => Cateter.fromFirestore(doc))
          .toList();
    });
  }

  /// 🔥 **Actualizar un catéter**
  Future<void> actualizarCateter(
      String idIngreso, String idCateter, UpdateCateterDto dto) async {
    try {
      await _firestore
          .collection('ingresos')
          .doc(idIngreso)
          .collection('cateteres')
          .doc(idCateter)
          .update(dto.toJson());
    } catch (e) {
      throw Exception("❌ Error al actualizar el catéter: $e");
    }
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

// ✅ Ahora el provider de catéteres usa Streams para tiempo real
final cateteresByIngresoProvider =
    StreamProvider.family<List<Cateter>, String>((ref, idIngreso) {
  final repository = ref.watch(cateteresRepositoryProvider);
  return repository.obtenerCateteres(idIngreso);
});

/// 🔹 **Actualizar un catéter y refrescar la UI**
final actualizarCateterProvider = FutureProvider.family<
    void,
    ({
      String idIngreso,
      String idCateter,
      UpdateCateterDto dto
    })>((ref, params) async {
  final repository = ref.read(cateteresRepositoryProvider);
  await repository.actualizarCateter(
      params.idIngreso, params.idCateter, params.dto);

  ref.invalidate(
      cateteresByIngresoProvider); // 🔥 Forzar actualización en tiempo real
});
