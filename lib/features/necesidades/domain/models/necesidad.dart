import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:registro_uci/features/necesidades/data/constants/strings.dart';
part 'necesidad.freezed.dart';

@freezed
class Necesidad with _$Necesidad {
  const factory Necesidad({
    required String idNecesidad,
    required String nombreNecesidad,
  }) = _Necesidad;

  factory Necesidad.fromJson(Map<String, dynamic> json, {required String id}) {
    return Necesidad(
      idNecesidad: id,
      nombreNecesidad: json[Strings.nombreNecesidad] as String,
    );
  }
}
