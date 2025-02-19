import 'package:freezed_annotation/freezed_annotation.dart';

part 'marcapaso.freezed.dart';
part 'marcapaso.g.dart';

@freezed
class Marcapaso with _$Marcapaso {
  factory Marcapaso({
    required String id,
    required String fechaColocacion,
    required String modo,
    required String via,
    required int frecuencia,
    required int sensibilidadSalida,
  }) = _Marcapaso;

  factory Marcapaso.fromJson(Map<String, dynamic> json) =>
      _$MarcapasoFromJson(json);
}
