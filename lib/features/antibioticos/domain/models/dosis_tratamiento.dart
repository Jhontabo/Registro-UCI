import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'dosis_tratamiento.freezed.dart';

@freezed
class DosisTratamiento with _$DosisTratamiento {
  const factory DosisTratamiento({
    required String idDosisTratamiento,
    required int cantidad,
    String? comentario,
    String? dosis,
    required DateTime hora,
  }) = _DosisTratamiento;

  factory DosisTratamiento.fromJson(Map<String, dynamic> json,
      {required String id}) {
    return DosisTratamiento(
      idDosisTratamiento: id,
      cantidad: json['cantidad'] as int,
      comentario: json['comentario'] as String?,
      dosis: json['dosis'] as String?,
      hora: (json['hora'] as Timestamp).toDate(),
    );
  }
}
