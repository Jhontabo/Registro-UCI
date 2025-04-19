import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cambio_posicion.freezed.dart';

@freezed
class CambioDePosicion with _$CambioDePosicion {
  const factory CambioDePosicion({
    required String idCambioDePosicion,
    required int hora,
    required String posicion,
    required int orden,
  }) = _CambioDePosicion;

  // Método personalizado para incluir el ID
  factory CambioDePosicion.fromJson(Map<String, dynamic> json,
      {required String id}) {
    return CambioDePosicion(
      idCambioDePosicion: id, // Asignamos el ID recibido
      hora: json['hora'] as int,
      posicion: json['posicion'] as String,
      orden: json['orden'] as int,
    );
  }
}
