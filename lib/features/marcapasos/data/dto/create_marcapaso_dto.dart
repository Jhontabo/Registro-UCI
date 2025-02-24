class CreateMarcapasoDto {
  final String fechaColocacion;
  final String modo;
  final String via;
  final int frecuencia;
  final double sensibilidad;
  final double salida;
  final String cedulaPaciente; // Se usa la cédula en lugar del userId

  CreateMarcapasoDto({
    required this.fechaColocacion,
    required this.modo,
    required this.via,
    required this.frecuencia,
    required this.sensibilidad,
    required this.salida,
    required this.cedulaPaciente,
  });

  Map<String, dynamic> toJson() {
    return {
      "fechaColocacion": fechaColocacion,
      "modo": modo,
      "via": via,
      "frecuencia": frecuencia,
      "sensibilidad": sensibilidad,
      "salida": salida,
      "cedulaPaciente": cedulaPaciente, // Se guarda la cédula del paciente
    };
  }
}
