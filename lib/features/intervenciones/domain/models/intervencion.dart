import 'package:freezed_annotation/freezed_annotation.dart';
part 'intervencion.freezed.dart';

@freezed
class Intervencion with _$Intervencion {
  const factory Intervencion({
    required String idIntervencion,
    required String idNIC,
    required String nombre,
  }) = _Intervencion;

  factory Intervencion.fromJson(Map<String, dynamic> json,
      {required String id}) {
    return Intervencion(
      idIntervencion: id,
      idNIC: json['idNIC'] as String,
      nombre: json['nombre'] as String,
    );
  }
}
