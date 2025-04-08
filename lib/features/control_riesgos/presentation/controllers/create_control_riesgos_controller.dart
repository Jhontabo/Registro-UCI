import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/features/control_riesgos/domain/models/control_de_riesgos.dart';
import 'package:registro_uci/features/control_riesgos/data/abstract_repositories/control_de_riesgos_repository.dart';
import '../../data/providers/control_de_riesgos_provider.dart'; // Asegúrate de importar el provider del repositorio

final createControlRiesgosControllerProvider = StateNotifierProvider<
    CreateControlRiesgosController, AsyncValue<List<ControlDeRiesgos>>>(
  (ref) => CreateControlRiesgosController(
      ref.watch(controlDeRiesgosRepositoryProvider)),
);

class CreateControlRiesgosController
    extends StateNotifier<AsyncValue<List<ControlDeRiesgos>>> {
  final ControlDeRiesgosRepository _repository;

  CreateControlRiesgosController(this._repository)
      : super(const AsyncValue.loading());

  void fetchControlDeRiesgos(String idIngreso, String idRegistroDiario) {
    state = const AsyncValue.loading();
    _repository.getControlDeRiesgos(idIngreso, idRegistroDiario).listen(
      (result) {
        state = AsyncValue.data(
            result); // Esto se llama cada vez que se emite un nuevo valor
      },
      onError: (e, stack) {
        state = AsyncValue.error(
            'Error al obtener los controles de riesgos', stack);
      },
    );
  }

  // Agregar un nuevo control de riesgos
  Future<void> addControlDeRiesgos(String idIngreso, String idRegistroDiario,
      ControlDeRiesgos controlDeRiesgos) async {
    try {
      await _repository.addControlDeRiesgos(
          idIngreso, idRegistroDiario, controlDeRiesgos);
      fetchControlDeRiesgos(idIngreso, idRegistroDiario); // Refrescar la lista
    } catch (e, stack) {
      state = AsyncValue.error('Error al agregar el control de riesgos',
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
