// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dia_tratamiento.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DiaTratamiento {
  String get idDiaTratamiento => throw _privateConstructorUsedError;
  int get dia => throw _privateConstructorUsedError;
  DateTime get inicio => throw _privateConstructorUsedError;
  DateTime get fin => throw _privateConstructorUsedError;
  bool get valido => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DiaTratamientoCopyWith<DiaTratamiento> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiaTratamientoCopyWith<$Res> {
  factory $DiaTratamientoCopyWith(
          DiaTratamiento value, $Res Function(DiaTratamiento) then) =
      _$DiaTratamientoCopyWithImpl<$Res, DiaTratamiento>;
  @useResult
  $Res call(
      {String idDiaTratamiento,
      int dia,
      DateTime inicio,
      DateTime fin,
      bool valido});
}

/// @nodoc
class _$DiaTratamientoCopyWithImpl<$Res, $Val extends DiaTratamiento>
    implements $DiaTratamientoCopyWith<$Res> {
  _$DiaTratamientoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idDiaTratamiento = null,
    Object? dia = null,
    Object? inicio = null,
    Object? fin = null,
    Object? valido = null,
  }) {
    return _then(_value.copyWith(
      idDiaTratamiento: null == idDiaTratamiento
          ? _value.idDiaTratamiento
          : idDiaTratamiento // ignore: cast_nullable_to_non_nullable
              as String,
      dia: null == dia
          ? _value.dia
          : dia // ignore: cast_nullable_to_non_nullable
              as int,
      inicio: null == inicio
          ? _value.inicio
          : inicio // ignore: cast_nullable_to_non_nullable
              as DateTime,
      fin: null == fin
          ? _value.fin
          : fin // ignore: cast_nullable_to_non_nullable
              as DateTime,
      valido: null == valido
          ? _value.valido
          : valido // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DiaTratamientoImplCopyWith<$Res>
    implements $DiaTratamientoCopyWith<$Res> {
  factory _$$DiaTratamientoImplCopyWith(_$DiaTratamientoImpl value,
          $Res Function(_$DiaTratamientoImpl) then) =
      __$$DiaTratamientoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String idDiaTratamiento,
      int dia,
      DateTime inicio,
      DateTime fin,
      bool valido});
}

/// @nodoc
class __$$DiaTratamientoImplCopyWithImpl<$Res>
    extends _$DiaTratamientoCopyWithImpl<$Res, _$DiaTratamientoImpl>
    implements _$$DiaTratamientoImplCopyWith<$Res> {
  __$$DiaTratamientoImplCopyWithImpl(
      _$DiaTratamientoImpl _value, $Res Function(_$DiaTratamientoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idDiaTratamiento = null,
    Object? dia = null,
    Object? inicio = null,
    Object? fin = null,
    Object? valido = null,
  }) {
    return _then(_$DiaTratamientoImpl(
      idDiaTratamiento: null == idDiaTratamiento
          ? _value.idDiaTratamiento
          : idDiaTratamiento // ignore: cast_nullable_to_non_nullable
              as String,
      dia: null == dia
          ? _value.dia
          : dia // ignore: cast_nullable_to_non_nullable
              as int,
      inicio: null == inicio
          ? _value.inicio
          : inicio // ignore: cast_nullable_to_non_nullable
              as DateTime,
      fin: null == fin
          ? _value.fin
          : fin // ignore: cast_nullable_to_non_nullable
              as DateTime,
      valido: null == valido
          ? _value.valido
          : valido // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$DiaTratamientoImpl implements _DiaTratamiento {
  const _$DiaTratamientoImpl(
      {required this.idDiaTratamiento,
      required this.dia,
      required this.inicio,
      required this.fin,
      this.valido = false});

  @override
  final String idDiaTratamiento;
  @override
  final int dia;
  @override
  final DateTime inicio;
  @override
  final DateTime fin;
  @override
  @JsonKey()
  final bool valido;

  @override
  String toString() {
    return 'DiaTratamiento(idDiaTratamiento: $idDiaTratamiento, dia: $dia, inicio: $inicio, fin: $fin, valido: $valido)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiaTratamientoImpl &&
            (identical(other.idDiaTratamiento, idDiaTratamiento) ||
                other.idDiaTratamiento == idDiaTratamiento) &&
            (identical(other.dia, dia) || other.dia == dia) &&
            (identical(other.inicio, inicio) || other.inicio == inicio) &&
            (identical(other.fin, fin) || other.fin == fin) &&
            (identical(other.valido, valido) || other.valido == valido));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, idDiaTratamiento, dia, inicio, fin, valido);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DiaTratamientoImplCopyWith<_$DiaTratamientoImpl> get copyWith =>
      __$$DiaTratamientoImplCopyWithImpl<_$DiaTratamientoImpl>(
          this, _$identity);
}

abstract class _DiaTratamiento implements DiaTratamiento {
  const factory _DiaTratamiento(
      {required final String idDiaTratamiento,
      required final int dia,
      required final DateTime inicio,
      required final DateTime fin,
      final bool valido}) = _$DiaTratamientoImpl;

  @override
  String get idDiaTratamiento;
  @override
  int get dia;
  @override
  DateTime get inicio;
  @override
  DateTime get fin;
  @override
  bool get valido;
  @override
  @JsonKey(ignore: true)
  _$$DiaTratamientoImplCopyWith<_$DiaTratamientoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
