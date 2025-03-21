import 'package:freezed_annotation/freezed_annotation.dart';

part 'procedimientos_especiales.freezed.dart';

@freezed
class ProcedimientoEspecial with _$ProcedimientoEspecial {
  const factory ProcedimientoEspecial({
    required String idProcedimiento,
    required String nombreProcedimiento,
    required String estado, // "Pendiente", "Realizado", "Reportado"
  }) = _ProcedimientoEspecial;

  factory ProcedimientoEspecial.fromJson(Map<String, dynamic> json,
      {required String id}) {
    return ProcedimientoEspecial(
      idProcedimiento: id, // Asigna el ID manualmente
      nombreProcedimiento: json['nombreProcedimiento'] as String,
      estado: json['estado'] as String,
    );
  }
}
