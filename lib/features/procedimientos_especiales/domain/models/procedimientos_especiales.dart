import 'package:freezed_annotation/freezed_annotation.dart';

part 'procedimientos_especiales.freezed.dart';
part 'procedimientos_especiales.g.dart';

@freezed
class ProcedimientoEspecial with _$ProcedimientoEspecial {
  const factory ProcedimientoEspecial({
    required String idProcedimiento,
    required String nombreProcedimiento,
    required String estado, // "Pendiente", "Realizado", "Reportado"
  }) = _ProcedimientoEspecial;

  factory ProcedimientoEspecial.fromJson(Map<String, dynamic> json) =>
      _$ProcedimientoEspecialFromJson(json);
}
