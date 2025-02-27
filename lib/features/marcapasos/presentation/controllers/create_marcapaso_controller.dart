import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/features/marcapasos/data/dto/create_marcapaso_dto.dart';
import 'package:registro_uci/features/marcapasos/data/providers/marcapasos_provider.dart';
import '../../../marcapasos/data/abstract_repositories/marcapasos_repository.dart';

final createMarcapasoControllerProvider =
    StateNotifierProvider<CreateMarcapasoController, AsyncValue<void>>(
  (ref) => CreateMarcapasoController(ref.watch(marcapasosRepositoryProvider)),
);

class CreateMarcapasoController extends StateNotifier<AsyncValue<void>> {
  final MarcapasosRepository _repository;

  CreateMarcapasoController(this._repository)
      : super(const AsyncValue.data(null));

  Future<void> createMarcapaso(CreateMarcapasoDto dto) async {
    state = const AsyncValue.loading();
    try {
      await _repository.createMarcapaso(dto); // 🔥 Método corregido
      state = const AsyncValue.data(null);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}
