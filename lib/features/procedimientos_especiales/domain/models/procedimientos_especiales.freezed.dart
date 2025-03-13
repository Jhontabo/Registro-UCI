// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'procedimientos_especiales.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProcedimientoEspecial _$ProcedimientoEspecialFromJson(
    Map<String, dynamic> json) {
  return _ProcedimientoEspecial.fromJson(json);
}

/// @nodoc
mixin _$ProcedimientoEspecial {
  String get idProcedimiento => throw _privateConstructorUsedError;
  String get nombreProcedimiento => throw _privateConstructorUsedError;
  String get estado => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProcedimientoEspecialCopyWith<ProcedimientoEspecial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProcedimientoEspecialCopyWith<$Res> {
  factory $ProcedimientoEspecialCopyWith(ProcedimientoEspecial value,
          $Res Function(ProcedimientoEspecial) then) =
      _$ProcedimientoEspecialCopyWithImpl<$Res, ProcedimientoEspecial>;
  @useResult
  $Res call(
      {String idProcedimiento, String nombreProcedimiento, String estado});
}

/// @nodoc
class _$ProcedimientoEspecialCopyWithImpl<$Res,
        $Val extends ProcedimientoEspecial>
    implements $ProcedimientoEspecialCopyWith<$Res> {
  _$ProcedimientoEspecialCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idProcedimiento = null,
    Object? nombreProcedimiento = null,
    Object? estado = null,
  }) {
    return _then(_value.copyWith(
      idProcedimiento: null == idProcedimiento
          ? _value.idProcedimiento
          : idProcedimiento // ignore: cast_nullable_to_non_nullable
              as String,
      nombreProcedimiento: null == nombreProcedimiento
          ? _value.nombreProcedimiento
          : nombreProcedimiento // ignore: cast_nullable_to_non_nullable
              as String,
      estado: null == estado
          ? _value.estado
          : estado // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProcedimientoEspecialImplCopyWith<$Res>
    implements $ProcedimientoEspecialCopyWith<$Res> {
  factory _$$ProcedimientoEspecialImplCopyWith(
          _$ProcedimientoEspecialImpl value,
          $Res Function(_$ProcedimientoEspecialImpl) then) =
      __$$ProcedimientoEspecialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String idProcedimiento, String nombreProcedimiento, String estado});
}

/// @nodoc
class __$$ProcedimientoEspecialImplCopyWithImpl<$Res>
    extends _$ProcedimientoEspecialCopyWithImpl<$Res,
        _$ProcedimientoEspecialImpl>
    implements _$$ProcedimientoEspecialImplCopyWith<$Res> {
  __$$ProcedimientoEspecialImplCopyWithImpl(_$ProcedimientoEspecialImpl _value,
      $Res Function(_$ProcedimientoEspecialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idProcedimiento = null,
    Object? nombreProcedimiento = null,
    Object? estado = null,
  }) {
    return _then(_$ProcedimientoEspecialImpl(
      idProcedimiento: null == idProcedimiento
          ? _value.idProcedimiento
          : idProcedimiento // ignore: cast_nullable_to_non_nullable
              as String,
      nombreProcedimiento: null == nombreProcedimiento
          ? _value.nombreProcedimiento
          : nombreProcedimiento // ignore: cast_nullable_to_non_nullable
              as String,
      estado: null == estado
          ? _value.estado
          : estado // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProcedimientoEspecialImpl implements _ProcedimientoEspecial {
  const _$ProcedimientoEspecialImpl(
      {required this.idProcedimiento,
      required this.nombreProcedimiento,
      required this.estado});

  factory _$ProcedimientoEspecialImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProcedimientoEspecialImplFromJson(json);

  @override
  final String idProcedimiento;
  @override
  final String nombreProcedimiento;
  @override
  final String estado;

  @override
  String toString() {
    return 'ProcedimientoEspecial(idProcedimiento: $idProcedimiento, nombreProcedimiento: $nombreProcedimiento, estado: $estado)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProcedimientoEspecialImpl &&
            (identical(other.idProcedimiento, idProcedimiento) ||
                other.idProcedimiento == idProcedimiento) &&
            (identical(other.nombreProcedimiento, nombreProcedimiento) ||
                other.nombreProcedimiento == nombreProcedimiento) &&
            (identical(other.estado, estado) || other.estado == estado));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, idProcedimiento, nombreProcedimiento, estado);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProcedimientoEspecialImplCopyWith<_$ProcedimientoEspecialImpl>
      get copyWith => __$$ProcedimientoEspecialImplCopyWithImpl<
          _$ProcedimientoEspecialImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProcedimientoEspecialImplToJson(
      this,
    );
  }
}

abstract class _ProcedimientoEspecial implements ProcedimientoEspecial {
  const factory _ProcedimientoEspecial(
      {required final String idProcedimiento,
      required final String nombreProcedimiento,
      required final String estado}) = _$ProcedimientoEspecialImpl;

  factory _ProcedimientoEspecial.fromJson(Map<String, dynamic> json) =
      _$ProcedimientoEspecialImpl.fromJson;

  @override
  String get idProcedimiento;
  @override
  String get nombreProcedimiento;
  @override
  String get estado;
  @override
  @JsonKey(ignore: true)
  _$$ProcedimientoEspecialImplCopyWith<_$ProcedimientoEspecialImpl>
      get copyWith => throw _privateConstructorUsedError;
}
