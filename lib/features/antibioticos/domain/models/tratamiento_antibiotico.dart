import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'tratamiento_antibiotico.freezed.dart';

@freezed
class TratamientoAntibiotico with _$TratamientoAntibiotico {
  const factory TratamientoAntibiotico({
    required String idTratamientoAntibiotico,
    required String antibiotico,
    required int cantidad,
    required int frecuenciaEn24h,
    required DateTime fechaInicio,
    DateTime? fechaFin,
  }) = _TratamientoAntibiotico;

  factory TratamientoAntibiotico.fromJson(Map<String, dynamic> json,
      {required String id}) {
    return TratamientoAntibiotico(
      idTratamientoAntibiotico: id,
      antibiotico: json['antibiotico'] as String,
      cantidad: json['cantidad'] as int,
      frecuenciaEn24h: json['frecuenciaEn24h'] as int,
      fechaInicio: (json['fechaInicio'] as Timestamp).toDate(),
      fechaFin: json['fechaFin'] != null
          ? (json['fechaFin'] as Timestamp).toDate()
          : null,
    );
  }
}
