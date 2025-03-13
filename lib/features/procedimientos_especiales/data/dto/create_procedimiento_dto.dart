import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_procedimiento_dto.freezed.dart';
part 'create_procedimiento_dto.g.dart';

@freezed
class CreateProcedimientoDto with _$CreateProcedimientoDto {
  const factory CreateProcedimientoDto({
    required String nombreProcedimiento,
    required String estado, // "Pendiente", "Realizado", "Reportado"
  }) = _CreateProcedimientoDto;

  factory CreateProcedimientoDto.fromJson(Map<String, dynamic> json) =>
      _$CreateProcedimientoDtoFromJson(json);
}
