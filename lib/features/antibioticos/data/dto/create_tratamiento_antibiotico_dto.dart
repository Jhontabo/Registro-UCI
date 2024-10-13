import "dart:collection";

class CreateTratamientoAntibioticoDto extends MapView<String, dynamic> {
  final String antibiotico;
  final int cantidad;
  final int frecuenciaEn24h;
  final DateTime fechaInicio;

  CreateTratamientoAntibioticoDto({
    required this.antibiotico,
    required this.cantidad,
    required this.frecuenciaEn24h,
    required this.fechaInicio,
  }) : super({
          'antibiotico': antibiotico,
          'cantidad': cantidad,
          'frecuenciaEn24h': frecuenciaEn24h,
          'fechaInicio': fechaInicio,
        });
}
