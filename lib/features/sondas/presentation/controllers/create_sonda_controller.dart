import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../data/dto/create_sonda_dto.dart';
import '../../data/providers/sonda_provider.dart';
// ← Importar el modelo correctamente

final createSondaControllerProvider =
    StateNotifierProvider<CreateSondaController, AsyncValue<void>>(
  (ref) => CreateSondaController(ref),
);

class CreateSondaController extends StateNotifier<AsyncValue<void>> {
  final Ref ref;
  CreateSondaController(this.ref) : super(const AsyncValue.data(null));

  Future<void> createSonda(CreateSondaDto dto) async {
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(sondaRepositoryProvider);
      await repository.createSonda(dto.toSonda(), dto.idIngreso);
      state = const AsyncValue.data(null);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
      rethrow; // ✅ Propaga el error para manejarlo en la vista
    }
  }
}
