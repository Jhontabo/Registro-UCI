import "dart:collection";

class UpdateTratamientoAntibioticoDto extends MapView<String, dynamic> {
  final String? antibiotico;
  final String? dosis;
  final int? cantidad;
  final int? frecuenciaEn24h;
  final DateTime? fechaInicio;
  final DateTime? fechaFin;

  UpdateTratamientoAntibioticoDto({
    this.antibiotico,
    this.dosis,
    this.cantidad,
    this.frecuenciaEn24h,
    this.fechaInicio,
    this.fechaFin,
  }) : super({
          if (antibiotico != null) 'antibiotico': antibiotico,
          if (dosis != null) 'dosis': dosis,
          if (cantidad != null) 'cantidad': cantidad,
          if (frecuenciaEn24h != null) 'frecuenciaEn24h': frecuenciaEn24h,
          if (fechaInicio != null) 'fechaInicio': fechaInicio,
          if (fechaFin != null) 'fechaFin': fechaFin,
        });
}
