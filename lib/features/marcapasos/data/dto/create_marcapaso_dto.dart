class CreateMarcapasoDto {
  final String fechaColocacion;
  final String modo;
  final String via;
  final int frecuencia;
  final int sensibilidadSalida;

  CreateMarcapasoDto({
    required this.fechaColocacion,
    required this.modo,
    required this.via,
    required this.frecuencia,
    required this.sensibilidadSalida,
  });

  Map<String, dynamic> toJson() {
    return {
      "fechaColocacion": fechaColocacion,
      "modo": modo,
      "via": via,
      "frecuencia": frecuencia,
      "sensibilidadSalida": sensibilidadSalida,
    };
  }
}
