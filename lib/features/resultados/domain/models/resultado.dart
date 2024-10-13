import 'package:freezed_annotation/freezed_annotation.dart';
part 'resultado.freezed.dart';

@freezed
class Resultado with _$Resultado {
  const factory Resultado({
    required String idResultado,
    required String idNOC,
    required String nombre,
  }) = _Resultado;

  factory Resultado.fromJson(Map<String, dynamic> json, {required String id}) {
    return Resultado(
      idResultado: id,
      idNOC: json['idNOC'] as String,
      nombre: json['nombre'] as String,
    );
  }
}
