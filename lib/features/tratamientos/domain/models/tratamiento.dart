import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'tratamiento.freezed.dart';

@freezed
class Tratamiento with _$Tratamiento {
  const factory Tratamiento({
    required String idTratamiento,
    required String medicamento,
    required int cantidad,
    required String unidad,
    required int frecuencia,
    required DateTime fechaInicio,
  }) = _Tratamiento;

  factory Tratamiento.fromJson(Map<String, dynamic> json,
      {required String id}) {
    return Tratamiento(
      idTratamiento: id,
      medicamento: json['medicamento'] as String,
      cantidad: json['cantidad'] as int,
      unidad: json['unidad'] as String,
      frecuencia: json['frecuencia'] as int,
      fechaInicio: (json['fechaInicio'] as Timestamp).toDate(),
    );
  }
}
