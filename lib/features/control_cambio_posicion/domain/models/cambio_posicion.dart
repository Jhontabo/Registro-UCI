// cambio_posicion.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cambio_posicion.freezed.dart';
part 'cambio_posicion.g.dart';

@freezed
class CambioDePosicion with _$CambioDePosicion {
  const factory CambioDePosicion({
    required String idCambioDePosicion,
    required int hora,
    required String posicion,
    required int orden,
  }) = _CambioDePosicion;

  factory CambioDePosicion.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;
    return CambioDePosicion(
      idCambioDePosicion: snapshot.id,
      hora: data['hora'] as int,
      posicion: data['posicion'] as String,
      orden: data['orden'] as int,
    );
  }

  factory CambioDePosicion.fromJson(Map<String, dynamic> json) =>
      _$CambioDePosicionFromJson(json);
}
