// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tratamiento.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Tratamiento {
  String get idTratamiento => throw _privateConstructorUsedError;
  String get medicamento => throw _privateConstructorUsedError;
  int get cantidad => throw _privateConstructorUsedError;
  String get unidad => throw _privateConstructorUsedError;
  int get frecuencia => throw _privateConstructorUsedError;
  DateTime get fechaInicio => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TratamientoCopyWith<Tratamiento> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TratamientoCopyWith<$Res> {
  factory $TratamientoCopyWith(
          Tratamiento value, $Res Function(Tratamiento) then) =
      _$TratamientoCopyWithImpl<$Res, Tratamiento>;
  @useResult
  $Res call(
      {String idTratamiento,
      String medicamento,
      int cantidad,
      String unidad,
      int frecuencia,
      DateTime fechaInicio});
}

/// @nodoc
class _$TratamientoCopyWithImpl<$Res, $Val extends Tratamiento>
    implements $TratamientoCopyWith<$Res> {
  _$TratamientoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idTratamiento = null,
    Object? medicamento = null,
    Object? cantidad = null,
    Object? unidad = null,
    Object? frecuencia = null,
    Object? fechaInicio = null,
  }) {
    return _then(_value.copyWith(
      idTratamiento: null == idTratamiento
          ? _value.idTratamiento
          : idTratamiento // ignore: cast_nullable_to_non_nullable
              as String,
      medicamento: null == medicamento
          ? _value.medicamento
          : medicamento // ignore: cast_nullable_to_non_nullable
              as String,
      cantidad: null == cantidad
          ? _value.cantidad
          : cantidad // ignore: cast_nullable_to_non_nullable
              as int,
      unidad: null == unidad
          ? _value.unidad
          : unidad // ignore: cast_nullable_to_non_nullable
              as String,
      frecuencia: null == frecuencia
          ? _value.frecuencia
          : frecuencia // ignore: cast_nullable_to_non_nullable
              as int,
      fechaInicio: null == fechaInicio
          ? _value.fechaInicio
          : fechaInicio // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TratamientoImplCopyWith<$Res>
    implements $TratamientoCopyWith<$Res> {
  factory _$$TratamientoImplCopyWith(
          _$TratamientoImpl value, $Res Function(_$TratamientoImpl) then) =
      __$$TratamientoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String idTratamiento,
      String medicamento,
      int cantidad,
      String unidad,
      int frecuencia,
      DateTime fechaInicio});
}

/// @nodoc
class __$$TratamientoImplCopyWithImpl<$Res>
    extends _$TratamientoCopyWithImpl<$Res, _$TratamientoImpl>
    implements _$$TratamientoImplCopyWith<$Res> {
  __$$TratamientoImplCopyWithImpl(
      _$TratamientoImpl _value, $Res Function(_$TratamientoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idTratamiento = null,
    Object? medicamento = null,
    Object? cantidad = null,
    Object? unidad = null,
    Object? frecuencia = null,
    Object? fechaInicio = null,
  }) {
    return _then(_$TratamientoImpl(
      idTratamiento: null == idTratamiento
          ? _value.idTratamiento
          : idTratamiento // ignore: cast_nullable_to_non_nullable
              as String,
      medicamento: null == medicamento
          ? _value.medicamento
          : medicamento // ignore: cast_nullable_to_non_nullable
              as String,
      cantidad: null == cantidad
          ? _value.cantidad
          : cantidad // ignore: cast_nullable_to_non_nullable
              as int,
      unidad: null == unidad
          ? _value.unidad
          : unidad // ignore: cast_nullable_to_non_nullable
              as String,
      frecuencia: null == frecuencia
          ? _value.frecuencia
          : frecuencia // ignore: cast_nullable_to_non_nullable
              as int,
      fechaInicio: null == fechaInicio
          ? _value.fechaInicio
          : fechaInicio // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$TratamientoImpl implements _Tratamiento {
  const _$TratamientoImpl(
      {required this.idTratamiento,
      required this.medicamento,
      required this.cantidad,
      required this.unidad,
      required this.frecuencia,
      required this.fechaInicio});

  @override
  final String idTratamiento;
  @override
  final String medicamento;
  @override
  final int cantidad;
  @override
  final String unidad;
  @override
  final int frecuencia;
  @override
  final DateTime fechaInicio;

  @override
  String toString() {
    return 'Tratamiento(idTratamiento: $idTratamiento, medicamento: $medicamento, cantidad: $cantidad, unidad: $unidad, frecuencia: $frecuencia, fechaInicio: $fechaInicio)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TratamientoImpl &&
            (identical(other.idTratamiento, idTratamiento) ||
                other.idTratamiento == idTratamiento) &&
            (identical(other.medicamento, medicamento) ||
                other.medicamento == medicamento) &&
            (identical(other.cantidad, cantidad) ||
                other.cantidad == cantidad) &&
            (identical(other.unidad, unidad) || other.unidad == unidad) &&
            (identical(other.frecuencia, frecuencia) ||
                other.frecuencia == frecuencia) &&
            (identical(other.fechaInicio, fechaInicio) ||
                other.fechaInicio == fechaInicio));
  }

  @override
  int get hashCode => Object.hash(runtimeType, idTratamiento, medicamento,
      cantidad, unidad, frecuencia, fechaInicio);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TratamientoImplCopyWith<_$TratamientoImpl> get copyWith =>
      __$$TratamientoImplCopyWithImpl<_$TratamientoImpl>(this, _$identity);
}

abstract class _Tratamiento implements Tratamiento {
  const factory _Tratamiento(
      {required final String idTratamiento,
      required final String medicamento,
      required final int cantidad,
      required final String unidad,
      required final int frecuencia,
      required final DateTime fechaInicio}) = _$TratamientoImpl;

  @override
  String get idTratamiento;
  @override
  String get medicamento;
  @override
  int get cantidad;
  @override
  String get unidad;
  @override
  int get frecuencia;
  @override
  DateTime get fechaInicio;
  @override
  @JsonKey(ignore: true)
  _$$TratamientoImplCopyWith<_$TratamientoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
