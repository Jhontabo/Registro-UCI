import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'liquido_administrado.freezed.dart';

@freezed
class LiquidoAdministrado with _$LiquidoAdministrado {
  const factory LiquidoAdministrado({
    required String idLiquidoAdministrado,
    required String medicamento,
    required int cantidad,
    String? comentario,
    String? dosis,
    required DateTime hora,
    required bool esTratamiento,
  }) = _LiquidoAdministrado;

  factory LiquidoAdministrado.fromJson(Map<String, dynamic> json,
      {required String id}) {
    return LiquidoAdministrado(
      idLiquidoAdministrado: id,
      medicamento: json['medicamento'] as String,
      cantidad: json['cantidad'] as int,
      comentario: json['comentario'] as String?,
      dosis: json['dosis'] as String?,
      hora: (json['hora'] as Timestamp).toDate(),
      esTratamiento: json['esTratamiento'] as bool,
    );
  }
}
