import 'dart:collection';

class UpdateLiquidoAdministradoDto extends MapView<String, dynamic> {
  final String? medicamento;
  final int? cantidad;
  final String? comentario;
  final String? dosis;
  final DateTime? hora;
  final bool? esTratamiento;

  UpdateLiquidoAdministradoDto({
    this.medicamento,
    this.cantidad,
    this.comentario,
    this.dosis,
    this.hora,
    this.esTratamiento,
  }) : super({
          if (medicamento != null) 'medicamento': medicamento,
          if (cantidad != null) 'cantidad': cantidad,
          if (comentario != null) 'comentario': comentario,
          if (dosis != null) 'dosis': dosis,
          if (hora != null) 'hora': hora,
          if (esTratamiento != null) 'esTratamiento': esTratamiento,
        });
}
