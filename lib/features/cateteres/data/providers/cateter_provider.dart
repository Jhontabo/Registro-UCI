import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../repositories/firabase_cateter_repository.dart';
import '../abstract_repositories/cateteres_repository.dart';
import 'package:registro_uci/features/cateteres/domain/models/cateter.dart';
import 'package:registro_uci/features/cateteres/data/dto/create_cateter_dto.dart';
import 'package:registro_uci/features/cateteres/data/dto/update_cateter_dto.dart';

/// 🔹 **Provee la instancia del repositorio de catéteres**
final cateteresRepositoryProvider = Provider<CateteresRepository>((ref) {
  return FirebaseCateterRepository(); // 🔥 Usa la implementación real
});

/// 🔹 **Registrar un catéter**
final registrarCateterProvider =
    FutureProvider.family<void, CreateCateterDto>((ref, dto) async {
  final repository = ref.read(cateteresRepositoryProvider);
  await repository.createCateter(dto); // 🔥 Método corregido
});

/// 🔹 **Obtener todos los catéteres de la base de datos**
final allCateteresProvider = StreamProvider<List<Cateter>>((ref) {
  return ref.watch(cateteresRepositoryProvider).getAllCateteres();
});

final cateteresByIngresoProvider =
    StreamProvider.family<List<Cateter>, String>((ref, idIngreso) {
  return ref.read(cateteresRepositoryProvider).getCateteresByIngreso(idIngreso);
});

/// 🔹 **Obtener un catéter específico de un ingreso**
final cateterByIdProvider =
    FutureProvider.family<Cateter?, ({String idIngreso, String idCateter})>(
        (ref, params) async {
  final repository = ref.read(cateteresRepositoryProvider);
  return await repository.getCateterById(params.idIngreso, params.idCateter);
});

/// 🔹 **Actualizar un catéter**
final actualizarCateterProvider = FutureProvider.family<
    void,
    ({
      String idIngreso,
      String idCateter,
      UpdateCateterDto dto
    })>((ref, params) async {
  final repository = ref.read(cateteresRepositoryProvider);
  await repository.updateCateter(
      params.idIngreso, params.idCateter, params.dto);
});

/// 🔹 **Eliminar un catéter**
final eliminarCateterProvider =
    FutureProvider.family<void, ({String idIngreso, String idCateter})>(
        (ref, params) async {
  final repository = ref.read(cateteresRepositoryProvider);
  await repository.deleteCateter(params.idIngreso, params.idCateter);
});
