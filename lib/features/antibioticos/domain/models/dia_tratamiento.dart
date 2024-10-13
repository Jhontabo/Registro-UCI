import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'dia_tratamiento.freezed.dart';

@freezed
class DiaTratamiento with _$DiaTratamiento {
  const factory DiaTratamiento({
    required String idDiaTratamiento,
    required int dia,
    required DateTime inicio,
    required DateTime fin,
    @Default(false) bool valido, // Default value for 'valido' is false
  }) = _DiaTratamiento;

  factory DiaTratamiento.fromJson(Map<String, dynamic> json,
      {required String id}) {
    return DiaTratamiento(
      idDiaTratamiento: id,
      dia: json['dia'] as int,
      inicio: (json['inicio'] as Timestamp).toDate(),
      fin: (json['fin'] as Timestamp).toDate(),
      valido:
          json['valido'] as bool? ?? false, // Handle default value for 'valido'
    );
  }
}
