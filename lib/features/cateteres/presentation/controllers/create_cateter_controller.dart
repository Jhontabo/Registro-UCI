import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/features/cateteres/data/dto/create_cateter_dto.dart';
import 'package:registro_uci/features/cateteres/data/providers/cateteres_providers.dart';
import '../../../cateteres/data/abstract_repositories/cateteres_repository.dart';

final createCateterControllerProvider =
    StateNotifierProvider<CreateCateterController, AsyncValue<void>>(
  (ref) => CreateCateterController(ref.watch(cateteresRepositoryProvider), ref),
);

class CreateCateterController extends StateNotifier<AsyncValue<void>> {
  final CateteresRepository _repository;
  final Ref _ref; // ✅ Se añade referencia a Riverpod para invalidar providers

  CreateCateterController(this._repository, this._ref)
      : super(const AsyncValue.data(null));

  Future<void> createCateter(CreateCateterDto dto) async {
    state = const AsyncValue.loading();
    try {
      await _repository.createCateter(dto); // 🔥 Crear catéter en Firestore

      _ref.invalidate(
          cateteresByIngresoProvider); // 🔥 Forzar actualización en tiempo real

      state = const AsyncValue.data(null);
      print("✅ Catéter creado exitosamente.");
    } catch (e, stackTrace) {
      print("❌ Error al crear catéter: $e");
      state = AsyncValue.error(e, stackTrace);
    }
  }
}
