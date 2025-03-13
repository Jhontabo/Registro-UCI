// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_procedimiento_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UpdateProcedimientoDto _$UpdateProcedimientoDtoFromJson(
    Map<String, dynamic> json) {
  return _UpdateProcedimientoDto.fromJson(json);
}

/// @nodoc
mixin _$UpdateProcedimientoDto {
  String get estado => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateProcedimientoDtoCopyWith<UpdateProcedimientoDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateProcedimientoDtoCopyWith<$Res> {
  factory $UpdateProcedimientoDtoCopyWith(UpdateProcedimientoDto value,
          $Res Function(UpdateProcedimientoDto) then) =
      _$UpdateProcedimientoDtoCopyWithImpl<$Res, UpdateProcedimientoDto>;
  @useResult
  $Res call({String estado});
}

/// @nodoc
class _$UpdateProcedimientoDtoCopyWithImpl<$Res,
        $Val extends UpdateProcedimientoDto>
    implements $UpdateProcedimientoDtoCopyWith<$Res> {
  _$UpdateProcedimientoDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? estado = null,
  }) {
    return _then(_value.copyWith(
      estado: null == estado
          ? _value.estado
          : estado // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateProcedimientoDtoImplCopyWith<$Res>
    implements $UpdateProcedimientoDtoCopyWith<$Res> {
  factory _$$UpdateProcedimientoDtoImplCopyWith(
          _$UpdateProcedimientoDtoImpl value,
          $Res Function(_$UpdateProcedimientoDtoImpl) then) =
      __$$UpdateProcedimientoDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String estado});
}

/// @nodoc
class __$$UpdateProcedimientoDtoImplCopyWithImpl<$Res>
    extends _$UpdateProcedimientoDtoCopyWithImpl<$Res,
        _$UpdateProcedimientoDtoImpl>
    implements _$$UpdateProcedimientoDtoImplCopyWith<$Res> {
  __$$UpdateProcedimientoDtoImplCopyWithImpl(
      _$UpdateProcedimientoDtoImpl _value,
      $Res Function(_$UpdateProcedimientoDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? estado = null,
  }) {
    return _then(_$UpdateProcedimientoDtoImpl(
      estado: null == estado
          ? _value.estado
          : estado // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateProcedimientoDtoImpl implements _UpdateProcedimientoDto {
  const _$UpdateProcedimientoDtoImpl({required this.estado});

  factory _$UpdateProcedimientoDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateProcedimientoDtoImplFromJson(json);

  @override
  final String estado;

  @override
  String toString() {
    return 'UpdateProcedimientoDto(estado: $estado)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateProcedimientoDtoImpl &&
            (identical(other.estado, estado) || other.estado == estado));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, estado);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateProcedimientoDtoImplCopyWith<_$UpdateProcedimientoDtoImpl>
      get copyWith => __$$UpdateProcedimientoDtoImplCopyWithImpl<
          _$UpdateProcedimientoDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateProcedimientoDtoImplToJson(
      this,
    );
  }
}

abstract class _UpdateProcedimientoDto implements UpdateProcedimientoDto {
  const factory _UpdateProcedimientoDto({required final String estado}) =
      _$UpdateProcedimientoDtoImpl;

  factory _UpdateProcedimientoDto.fromJson(Map<String, dynamic> json) =
      _$UpdateProcedimientoDtoImpl.fromJson;

  @override
  String get estado;
  @override
  @JsonKey(ignore: true)
  _$$UpdateProcedimientoDtoImplCopyWith<_$UpdateProcedimientoDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
