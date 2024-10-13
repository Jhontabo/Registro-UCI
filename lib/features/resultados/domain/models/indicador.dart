import 'package:freezed_annotation/freezed_annotation.dart';
part 'indicador.freezed.dart';

@freezed
class Indicador with _$Indicador {
  const factory Indicador({
    required String idIndicador,
    required String descripcion,
  }) = _Indicador;

  factory Indicador.fromJson(Map<String, dynamic> json, {required String id}) {
    return Indicador(
      idIndicador: id,
      descripcion: json['descripcion'] as String,
    );
  }
}
