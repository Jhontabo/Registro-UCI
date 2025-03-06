import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/features/cateteres/data/dto/update_cateter_dto.dart';
import 'package:registro_uci/features/cateteres/data/providers/cateteres_providers.dart';
import 'package:registro_uci/features/cateteres/data/abstract_repositories/cateteres_repository.dart';

final updateCateterControllerProvider =
    StateNotifierProvider<UpdateCateterController, AsyncValue<void>>(
  (ref) => UpdateCateterController(ref.watch(cateteresRepositoryProvider), ref),
);

class UpdateCateterController extends StateNotifier<AsyncValue<void>> {
  final CateteresRepository _repository;
  final Ref _ref; // ✅ Se añade referencia a Riverpod para invalidar providers

  UpdateCateterController(this._repository, this._ref)
      : super(const AsyncValue.data(null));

  Future<void> updateCateter(
      String idIngreso, String idCateter, UpdateCateterDto dto) async {
    state = const AsyncValue.loading();
    try {
      await _repository.updateCateter(idIngreso, idCateter, dto);

      _ref.invalidate(
          cateteresByIngresoProvider); // 🔥 Forzar actualización en tiempo real

      state = const AsyncValue.data(null);
      print("✅ Catéter $idCateter actualizado exitosamente.");
    } catch (e, stackTrace) {
      print("❌ Error al actualizar catéter $idCateter: $e");
      state = AsyncValue.error(e, stackTrace);
    }
  }
}
