import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/features/cateteres/data/dto/create_cateter_dto.dart';
import 'package:registro_uci/features/cateteres/data/providers/cateter_provider.dart';
import '../../../cateteres/data/abstract_repositories/cateteres_repository.dart';

final createCateterControllerProvider =
    StateNotifierProvider<CreateCateterController, AsyncValue<void>>(
  (ref) => CreateCateterController(ref.watch(cateteresRepositoryProvider)),
);

class CreateCateterController extends StateNotifier<AsyncValue<void>> {
  final CateteresRepository _repository;

  CreateCateterController(this._repository)
      : super(const AsyncValue.data(null));

  Future<void> createCateter(CreateCateterDto dto) async {
    state = const AsyncValue.loading();
    try {
      await _repository.createCateter(dto); // 🔥 Método corregido
      state = const AsyncValue.data(null);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}
