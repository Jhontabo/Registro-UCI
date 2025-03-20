import 'dart:collection';

class CreateLiquidoAdministradoDto extends MapView<String, dynamic> {
  final String medicamento;
  final int cantidad;
  final String? comentario;
  final String? dosis;
  final DateTime hora;
  final bool esTratamiento;

  CreateLiquidoAdministradoDto({
    required this.medicamento,
    required this.cantidad,
    this.comentario,
    this.dosis,
    required this.hora,
    required this.esTratamiento,
  }) : super({
          'medicamento': medicamento,
          'cantidad': cantidad,
          if (comentario != null) 'comentario': comentario,
          if (dosis != null) 'dosis': dosis,
          'hora': hora,
          'esTratamiento': esTratamiento,
        });
}
