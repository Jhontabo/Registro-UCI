import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/features/marcapasos/data/dto/update_marcapaso_dto.dart';
import 'package:registro_uci/features/marcapasos/data/providers/marcapasos_provider.dart';
import 'package:registro_uci/features/marcapasos/data/abstract_repositories/marcapasos_repository.dart';

final updateMarcapasoControllerProvider =
    StateNotifierProvider<UpdateMarcapasoController, AsyncValue<void>>(
  (ref) => UpdateMarcapasoController(ref.watch(marcapasosRepositoryProvider)),
);

class UpdateMarcapasoController extends StateNotifier<AsyncValue<void>> {
  final MarcapasosRepository _repository;

  UpdateMarcapasoController(this._repository)
      : super(const AsyncValue.data(null));

  Future<void> updateMarcapaso(
      String idIngreso, String idMarcapaso, UpdateMarcapasoDto dto) async {
    state = const AsyncValue.loading();
    try {
      await _repository.updateMarcapaso(idIngreso, idMarcapaso, dto);
      state = const AsyncValue.data(null);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}
