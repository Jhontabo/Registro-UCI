import 'package:freezed_annotation/freezed_annotation.dart';

part 'cambio_posicion.freezed.dart';
part 'cambio_posicion.g.dart';

@freezed
class CambioDePosicion with _$CambioDePosicion {
  const factory CambioDePosicion({
    required String
        idCambioDePosicion, // Identificador único para cada cambio de posición
    required int hora, // Hora del cambio (de 8 AM a 7 AM)
    required String posicion, // La posición del paciente
    required int orden, // Orden de los cambios en el día
  }) = _CambioDePosicion;

  factory CambioDePosicion.fromJson(Map<String, dynamic> json) =>
      _$CambioDePosicionFromJson(json);
}
