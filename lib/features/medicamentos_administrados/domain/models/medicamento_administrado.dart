import 'package:freezed_annotation/freezed_annotation.dart';
part 'medicamento_administrado.freezed.dart';

@freezed
class MedicamentoAdministrado with _$MedicamentoAdministrado {
  const factory MedicamentoAdministrado({
    required String idMedicamentoAdministrado,
    required String medicamento,
    required int cantidad,
    required String unidad,
    required bool esTratamiento,
  }) = _MedicamentoAdministrado;

  factory MedicamentoAdministrado.fromJson(Map<String, dynamic> json,
      {required String id}) {
    return MedicamentoAdministrado(
      idMedicamentoAdministrado: id,
      medicamento: json['medicamento'] as String,
      cantidad: json['cantidad'] as int,
      unidad: json['unidad'] as String,
      esTratamiento: json['esTratamiento'] as bool,
    );
  }
}
