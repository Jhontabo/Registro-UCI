import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../data/dto/update_sonda_dto.dart';
import '../../data/providers/sonda_provider.dart';
import '../../domain/models/sonda.dart';

final updateSondaControllerProvider =
    StateNotifierProvider<UpdateSondaController, AsyncValue<void>>(
  (ref) => UpdateSondaController(ref),
);

class UpdateSondaController extends StateNotifier<AsyncValue<void>> {
  final Ref ref;
  UpdateSondaController(this.ref) : super(const AsyncValue.data(null));

  Future<void> updateSonda(
      String id, String idIngreso, UpdateSondaDto dto) async {
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(sondaRepositoryProvider);

      // ✅ Buscar la sonda directamente en Firebase en lugar de obtener todas
      final sondaSnapshot = await repository.getSondaById(id, idIngreso);
      if (sondaSnapshot == null) {
        throw Exception(
            'Error: La sonda con ID $id no fue encontrada en el ingreso $idIngreso.');
      }

      // ✅ Aplicamos los cambios
      final updatedSonda = sondaSnapshot.copyWith(
        tipo: dto.tipo ?? sondaSnapshot.tipo,
        regionAnatomica: dto.regionAnatomica ?? sondaSnapshot.regionAnatomica,
        fechaColocacion: dto.fechaColocacion ?? sondaSnapshot.fechaColocacion,
      );

      // ✅ Ahora pasamos `idIngreso` también al actualizar en Firebase
      await repository.updateSonda(updatedSonda, idIngreso);

      state = const AsyncValue.data(null);
    } catch (error, stackTrace) {
      print(
          "Error en UpdateSondaController: $error"); // ✅ Log de error para depuración
      state = AsyncValue.error(error, stackTrace);
      rethrow; // ✅ Para manejar el error en la vista
    }
  }
}
