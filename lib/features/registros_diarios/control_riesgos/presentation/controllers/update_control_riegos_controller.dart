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
  void fetchControlDeRiesgos(String idIngreso, String idRegistroDiario) {
    state = const AsyncValue.loading(); // Mostrar el estado de carga

    _repository.getControlDeRiesgos(idIngreso, idRegistroDiario).listen(
      (result) {
        // Cuando se reciben los datos, actualizamos el estado con los resultados
        state = AsyncValue.data(result);
      },
      onError: (e, stack) {
        // Si ocurre un error, mostramos el error y la traza del stack
        state = AsyncValue.error(
          'Error al obtener los controles de riesgos',
          stack,
        );
      },
    );
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
