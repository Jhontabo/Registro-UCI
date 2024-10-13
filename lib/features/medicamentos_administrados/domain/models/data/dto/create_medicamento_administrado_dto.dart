import "dart:collection";

class CreateMedicamentoAdministradoDto extends MapView<String, dynamic> {
  final String medicamento;
  final int cantidad;
  final String unidad;
  final bool esTratamiento;

  CreateMedicamentoAdministradoDto({
    required this.medicamento,
    required this.cantidad,
    required this.unidad,
    required this.esTratamiento,
  }) : super({
          'medicamento': medicamento,
          'cantidad': cantidad,
          'unidad': unidad,
          'esTratamiento': esTratamiento,
        });
}
