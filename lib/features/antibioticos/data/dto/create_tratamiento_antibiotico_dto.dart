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
}
