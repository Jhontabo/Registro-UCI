import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../repositories/firabase_cateter_repository.dart';
import '../abstract_repositories/cateteres_repository.dart';
import 'package:registro_uci/features/cateteres/domain/models/cateter.dart';
import 'package:registro_uci/features/cateteres/data/dto/create_cateter_dto.dart';
import 'package:registro_uci/features/cateteres/data/dto/update_cateter_dto.dart';

/// 🔹 **Provee la instancia del repositorio de catéteres**
final cateteresRepositoryProvider = Provider<CateteresRepository>((ref) {
  return FirebaseCateterRepository();
});

/// 🔹 **Obtener todos los catéteres en tiempo real**
final allCateteresProvider = StreamProvider<List<Cateter>>((ref) {
  return ref.watch(cateteresRepositoryProvider).getAllCateteres();
});

/// 🔹 **Obtener los catéteres de un ingreso específico en tiempo real**
final cateteresByIngresoProvider =
    StreamProvider.family<List<Cateter>, String>((ref, idIngreso) {
  return ref
      .watch(cateteresRepositoryProvider)
      .getCateteresByIngreso(idIngreso);
});

/// 🔹 **Obtener un catéter específico de un ingreso**
final cateterByIdProvider =
    FutureProvider.family<Cateter?, ({String idIngreso, String idCateter})>(
        (ref, params) async {
  final repository = ref.read(cateteresRepositoryProvider);
  return await repository.getCateterById(params.idIngreso, params.idCateter);
});

/// 🔹 **Registrar un catéter**
final registrarCateterProvider =
    FutureProvider.family<void, CreateCateterDto>((ref, dto) async {
  final repository = ref.read(cateteresRepositoryProvider);
  await repository.createCateter(dto);
  ref.invalidate(allCateteresProvider); // 🔥 Actualizar todos los catéteres
  ref.invalidate(
      cateteresByIngresoProvider); // 🔥 Actualizar ingreso específico
});

final actualizarCateterProvider = FutureProvider.family<
    void,
    ({
      String idIngreso,
      String idCateter,
      UpdateCateterDto dto
    })>((ref, params) async {
  final repository = ref.read(cateteresRepositoryProvider);

  try {
    await repository.updateCateter(
        params.idIngreso, params.idCateter, params.dto);
    ref.invalidate(allCateteresProvider);
    ref.refresh(cateteresByIngresoProvider(params.idIngreso));
  } catch (e) {
    throw Exception("⚠️ Error al actualizar el catéter: $e");
  }
});

/// 🔹 **Eliminar un catéter**
final eliminarCateterProvider =
    FutureProvider.family<void, ({String idIngreso, String idCateter})>(
        (ref, params) async {
  final repository = ref.read(cateteresRepositoryProvider);
  await repository.deleteCateter(params.idIngreso, params.idCateter);
  ref.invalidate(allCateteresProvider);
  ref.invalidate(cateteresByIngresoProvider);
});
