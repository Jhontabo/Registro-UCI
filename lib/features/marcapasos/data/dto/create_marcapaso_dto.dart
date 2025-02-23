class CreateMarcapasoDto {
  final String fechaColocacion;
  final String modo;
  final String via;
  final int frecuencia;
  final double sensibilidad;
  final double salida;

  CreateMarcapasoDto({
    required this.fechaColocacion,
    required this.modo,
    required this.via,
    required this.frecuencia,
    required this.sensibilidad,
    required this.salida,
  });

  Map<String, dynamic> toJson() {
    return {
      "fechaColocacion": fechaColocacion,
      "modo": modo,
      "via": via,
      "frecuencia": frecuencia,
      "sensibilidad": sensibilidad,
      "salida": salida,
    };
  }
}
