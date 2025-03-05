import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/features/cateteres/data/dto/update_cateter_dto.dart';
import 'package:registro_uci/features/cateteres/data/providers/cateter_provider.dart';
import 'package:registro_uci/features/cateteres/data/abstract_repositories/cateteres_repository.dart';

final updateCateterControllerProvider =
    StateNotifierProvider<UpdateCateterController, AsyncValue<void>>(
  (ref) => UpdateCateterController(ref.watch(cateteresRepositoryProvider)),
);

class UpdateCateterController extends StateNotifier<AsyncValue<void>> {
  final CateteresRepository _repository;

  UpdateCateterController(this._repository)
      : super(const AsyncValue.data(null));

  Future<void> updateCateter(
      String idIngreso, String idCateter, UpdateCateterDto dto) async {
    state = const AsyncValue.loading();
    try {
      await _repository.updateCateter(idIngreso, idCateter, dto);
      state = const AsyncValue.data(null);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}
