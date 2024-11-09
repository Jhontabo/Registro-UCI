import "dart:collection";

class CreateTratamientoAntibioticoDto extends MapView<String, dynamic> {
  final String antibiotico;
  final int cantidad;
  final int frecuenciaEn24h;
  final DateTime fechaInicio;
  final String dosis;

  CreateTratamientoAntibioticoDto({
    required this.antibiotico,
    required this.cantidad,
    required this.frecuenciaEn24h,
    required this.fechaInicio,
    required this.dosis,
  }) : super({
          'antibiotico': antibiotico,
          'cantidad': cantidad,
          'frecuenciaEn24h': frecuenciaEn24h,
          'fechaInicio': fechaInicio,
          'dosis': dosis,
        });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CreateTratamientoAntibioticoDto &&
        other.antibiotico == antibiotico &&
        other.cantidad == cantidad &&
        other.frecuenciaEn24h == frecuenciaEn24h &&
        other.fechaInicio == fechaInicio &&
        other.dosis == dosis;
  }

  @override
  int get hashCode {
    return antibiotico.hashCode ^
        cantidad.hashCode ^
        frecuenciaEn24h.hashCode ^
        fechaInicio.hashCode ^
        dosis.hashCode;
  }
}
