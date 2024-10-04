// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'registro_diario.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RegistroDiario {
  String get idRegistroDiario => throw _privateConstructorUsedError;
  DateTime get fechaRegistro => throw _privateConstructorUsedError;
  Firma? get firmaNecesidades => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegistroDiarioCopyWith<RegistroDiario> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegistroDiarioCopyWith<$Res> {
  factory $RegistroDiarioCopyWith(
          RegistroDiario value, $Res Function(RegistroDiario) then) =
      _$RegistroDiarioCopyWithImpl<$Res, RegistroDiario>;
  @useResult
  $Res call(
      {String idRegistroDiario,
      DateTime fechaRegistro,
      Firma? firmaNecesidades});

  $FirmaCopyWith<$Res>? get firmaNecesidades;
}

/// @nodoc
class _$RegistroDiarioCopyWithImpl<$Res, $Val extends RegistroDiario>
    implements $RegistroDiarioCopyWith<$Res> {
  _$RegistroDiarioCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idRegistroDiario = null,
    Object? fechaRegistro = null,
    Object? firmaNecesidades = freezed,
  }) {
    return _then(_value.copyWith(
      idRegistroDiario: null == idRegistroDiario
          ? _value.idRegistroDiario
          : idRegistroDiario // ignore: cast_nullable_to_non_nullable
              as String,
      fechaRegistro: null == fechaRegistro
          ? _value.fechaRegistro
          : fechaRegistro // ignore: cast_nullable_to_non_nullable
              as DateTime,
      firmaNecesidades: freezed == firmaNecesidades
          ? _value.firmaNecesidades
          : firmaNecesidades // ignore: cast_nullable_to_non_nullable
              as Firma?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FirmaCopyWith<$Res>? get firmaNecesidades {
    if (_value.firmaNecesidades == null) {
      return null;
    }

    return $FirmaCopyWith<$Res>(_value.firmaNecesidades!, (value) {
      return _then(_value.copyWith(firmaNecesidades: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RegistroDiarioImplCopyWith<$Res>
    implements $RegistroDiarioCopyWith<$Res> {
  factory _$$RegistroDiarioImplCopyWith(_$RegistroDiarioImpl value,
          $Res Function(_$RegistroDiarioImpl) then) =
      __$$RegistroDiarioImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String idRegistroDiario,
      DateTime fechaRegistro,
      Firma? firmaNecesidades});

  @override
  $FirmaCopyWith<$Res>? get firmaNecesidades;
}

/// @nodoc
class __$$RegistroDiarioImplCopyWithImpl<$Res>
    extends _$RegistroDiarioCopyWithImpl<$Res, _$RegistroDiarioImpl>
    implements _$$RegistroDiarioImplCopyWith<$Res> {
  __$$RegistroDiarioImplCopyWithImpl(
      _$RegistroDiarioImpl _value, $Res Function(_$RegistroDiarioImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idRegistroDiario = null,
    Object? fechaRegistro = null,
    Object? firmaNecesidades = freezed,
  }) {
    return _then(_$RegistroDiarioImpl(
      idRegistroDiario: null == idRegistroDiario
          ? _value.idRegistroDiario
          : idRegistroDiario // ignore: cast_nullable_to_non_nullable
              as String,
      fechaRegistro: null == fechaRegistro
          ? _value.fechaRegistro
          : fechaRegistro // ignore: cast_nullable_to_non_nullable
              as DateTime,
      firmaNecesidades: freezed == firmaNecesidades
          ? _value.firmaNecesidades
          : firmaNecesidades // ignore: cast_nullable_to_non_nullable
              as Firma?,
    ));
  }
}

/// @nodoc

class _$RegistroDiarioImpl implements _RegistroDiario {
  const _$RegistroDiarioImpl(
      {required this.idRegistroDiario,
      required this.fechaRegistro,
      this.firmaNecesidades});

  @override
  final String idRegistroDiario;
  @override
  final DateTime fechaRegistro;
  @override
  final Firma? firmaNecesidades;

  @override
  String toString() {
    return 'RegistroDiario(idRegistroDiario: $idRegistroDiario, fechaRegistro: $fechaRegistro, firmaNecesidades: $firmaNecesidades)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegistroDiarioImpl &&
            (identical(other.idRegistroDiario, idRegistroDiario) ||
                other.idRegistroDiario == idRegistroDiario) &&
            (identical(other.fechaRegistro, fechaRegistro) ||
                other.fechaRegistro == fechaRegistro) &&
            (identical(other.firmaNecesidades, firmaNecesidades) ||
                other.firmaNecesidades == firmaNecesidades));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, idRegistroDiario, fechaRegistro, firmaNecesidades);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegistroDiarioImplCopyWith<_$RegistroDiarioImpl> get copyWith =>
      __$$RegistroDiarioImplCopyWithImpl<_$RegistroDiarioImpl>(
          this, _$identity);
}

abstract class _RegistroDiario implements RegistroDiario {
  const factory _RegistroDiario(
      {required final String idRegistroDiario,
      required final DateTime fechaRegistro,
      final Firma? firmaNecesidades}) = _$RegistroDiarioImpl;

  @override
  String get idRegistroDiario;
  @override
  DateTime get fechaRegistro;
  @override
  Firma? get firmaNecesidades;
  @override
  @JsonKey(ignore: true)
  _$$RegistroDiarioImplCopyWith<_$RegistroDiarioImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
