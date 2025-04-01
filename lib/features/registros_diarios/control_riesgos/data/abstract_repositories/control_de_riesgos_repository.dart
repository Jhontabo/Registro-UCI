import 'package:registro_uci/features/registros_diarios/control_riesgos/domain/models/control_de_riesgos.dart';

abstract class ControlDeRiesgosRepository {
  // Método para obtener la lista de controles de riesgos de un ingreso y registro diario
  Stream<List<ControlDeRiesgos>> getControlDeRiesgos(
    String idIngreso,
    String idRegistroDiario,
  );

  // Método para agregar un nuevo control de riesgos
  Future<void> addControlDeRiesgos(
    String idIngreso,
    String idRegistroDiario,
    ControlDeRiesgos controlDeRiesgos,
  );

  // Método para actualizar un control de riesgos existente
  Future<void> updateControlDeRiesgos(
    String idIngreso,
    String idRegistroDiario,
    String idControlDeRiesgos,
    ControlDeRiesgos controlDeRiesgos,
  );

  // Método para eliminar un control de riesgos
  Future<void> deleteControlDeRiesgos(
    String idIngreso,
    String idRegistroDiario,
    String idControlDeRiesgos,
  );
}
