import 'package:freezed_annotation/freezed_annotation.dart';
part 'actividad.freezed.dart';

@freezed
class Actividad with _$Actividad {
  const factory Actividad({
    required String idActividad,
    required String descripcion,
  }) = _Actividad;

  factory Actividad.fromJson(Map<String, dynamic> json, {required String id}) {
    return Actividad(
      idActividad: id,
      descripcion: json['descripcion'] as String,
    );
  }
}
