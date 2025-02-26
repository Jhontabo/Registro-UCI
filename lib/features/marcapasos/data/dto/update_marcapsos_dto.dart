class UpdateMarcapasoDto {
  final String? fechaColocacion;
  final String? modo;
  final String? via;
  final int? frecuencia;
  final double? sensibilidad;
  final double? salida;

  UpdateMarcapasoDto({
    this.fechaColocacion,
    this.modo,
    this.via,
    this.frecuencia,
    this.sensibilidad,
    this.salida,
  });

  Map<String, dynamic> toJson() {
    return {
      if (fechaColocacion != null) "fechaColocacion": fechaColocacion,
      if (modo != null) "modo": modo,
      if (via != null) "via": via,
      if (frecuencia != null) "frecuencia": frecuencia,
      if (sensibilidad != null) "sensibilidad": sensibilidad,
      if (salida != null) "salida": salida,
    };
  }
}
