import "dart:collection";

class CreateTratamientoDto extends MapView<String, dynamic> {
  final String medicamento;
  final int cantidad;
  final String unidad;
  final int frecuencia;
  final DateTime fechaInicio;

  CreateTratamientoDto({
    required this.medicamento,
    required this.cantidad,
    required this.unidad,
    required this.frecuencia,
    required this.fechaInicio,
  }) : super({
          'medicamento': medicamento,
          'cantidad': cantidad,
          'unidad': unidad,
          'frecuencia': frecuencia,
          'fechaInicio': fechaInicio,
        });
}
