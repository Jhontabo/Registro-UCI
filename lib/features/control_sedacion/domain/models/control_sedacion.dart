import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'control_sedacion.freezed.dart';

@freezed
class ControlSedacion with _$ControlSedacion {
  const factory ControlSedacion({
    required String id,
    required int hora,
    required String observacion,
    required int orden,
    required int rass,
  }) = _ControlSedacion;

  // Método personalizado para incluir el ID
  factory ControlSedacion.fromJson(Map<String, dynamic> json,
      {required String id}) {
    return ControlSedacion(
      id: id, // Asignamos el ID recibido
      hora: json['hora'] as int,
      observacion: json['observacion'] as String,
      orden: json['orden'] as int,
      rass: json['rass'] as int,
    );
  }
}
