import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_procedimiento_dto.freezed.dart';
part 'update_procedimiento_dto.g.dart';

@freezed
class UpdateProcedimientoDto with _$UpdateProcedimientoDto {
  const factory UpdateProcedimientoDto({
    required String estado, // Solo permitimos actualizar el estado
  }) = _UpdateProcedimientoDto;

  factory UpdateProcedimientoDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateProcedimientoDtoFromJson(json);
}
