import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/features/registros_diarios/control_riesgos/domain/models/control_de_riesgos.dart';
import 'package:registro_uci/features/registros_diarios/control_riesgos/data/abstract_repositories/control_de_riesgos_repository.dart';
import '../../data/providers/control_de_riesgos_provider.dart'; // Asegúrate de importar el provider del repositorio

final updateControlRiesgosControllerProvider = StateNotifierProvider<
    UpdateControlRiesgosController, AsyncValue<List<ControlDeRiesgos>>>(
  (ref) => UpdateControlRiesgosController(
      ref.watch(controlDeRiesgosRepositoryProvider)),
);

class UpdateControlRiesgosController
    extends StateNotifier<AsyncValue<List<ControlDeRiesgos>>> {
  final ControlDeRiesgosRepository _repository;

  UpdateControlRiesgosController(this._repository)
      : super(const AsyncValue.loading());

  // Obtener la lista de controles de riesgos
  Future<void> fetchControlDeRiesgos(
      String idIngreso, String idRegistroDiario) async {
    try {
      state = const AsyncValue.loading();
      final result =
          await _repository.getControlDeRiesgos(idIngreso, idRegistroDiario);
      state = AsyncValue.data(result);
    } catch (e, stack) {
      state = AsyncValue.error('Error al obtener los controles de riesgos',
          stack); // Añadido stackTrace
    }
  }

  // Actualizar un control de riesgos existente
  Future<void> updateControlDeRiesgos(String idIngreso, String idRegistroDiario,
      String idControlDeRiesgos, ControlDeRiesgos controlDeRiesgos) async {
    try {
      await _repository.updateControlDeRiesgos(
          idIngreso, idRegistroDiario, idControlDeRiesgos, controlDeRiesgos);
      fetchControlDeRiesgos(idIngreso, idRegistroDiario); // Refrescar la lista
    } catch (e, stack) {
      state = AsyncValue.error('Error al actualizar el control de riesgos',
          stack); // Añadido stackTrace
    }
  }

  // Eliminar un control de riesgos
  Future<void> deleteControlDeRiesgos(String idIngreso, String idRegistroDiario,
      String idControlDeRiesgos) async {
    try {
      await _repository.deleteControlDeRiesgos(
          idIngreso, idRegistroDiario, idControlDeRiesgos);
      fetchControlDeRiesgos(idIngreso, idRegistroDiario); // Refrescar la lista
    } catch (e, stack) {
      state = AsyncValue.error('Error al eliminar el control de riesgos',
          stack); // Añadido stackTrace
    }
  }
}
