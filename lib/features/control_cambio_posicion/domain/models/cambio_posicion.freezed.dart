// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cambio_posicion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CambioDePosicion _$CambioDePosicionFromJson(Map<String, dynamic> json) {
  return _CambioDePosicion.fromJson(json);
}

/// @nodoc
mixin _$CambioDePosicion {
  String get idCambioDePosicion =>
      throw _privateConstructorUsedError; // Identificador único para cada cambio de posición
  int get hora =>
      throw _privateConstructorUsedError; // Hora del cambio (de 8 AM a 7 AM)
  String get posicion =>
      throw _privateConstructorUsedError; // La posición del paciente
  int get orden => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CambioDePosicionCopyWith<CambioDePosicion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CambioDePosicionCopyWith<$Res> {
  factory $CambioDePosicionCopyWith(
          CambioDePosicion value, $Res Function(CambioDePosicion) then) =
      _$CambioDePosicionCopyWithImpl<$Res, CambioDePosicion>;
  @useResult
  $Res call({String idCambioDePosicion, int hora, String posicion, int orden});
}

/// @nodoc
class _$CambioDePosicionCopyWithImpl<$Res, $Val extends CambioDePosicion>
    implements $CambioDePosicionCopyWith<$Res> {
  _$CambioDePosicionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idCambioDePosicion = null,
    Object? hora = null,
    Object? posicion = null,
    Object? orden = null,
  }) {
    return _then(_value.copyWith(
      idCambioDePosicion: null == idCambioDePosicion
          ? _value.idCambioDePosicion
          : idCambioDePosicion // ignore: cast_nullable_to_non_nullable
              as String,
      hora: null == hora
          ? _value.hora
          : hora // ignore: cast_nullable_to_non_nullable
              as int,
      posicion: null == posicion
          ? _value.posicion
          : posicion // ignore: cast_nullable_to_non_nullable
              as String,
      orden: null == orden
          ? _value.orden
          : orden // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CambioDePosicionImplCopyWith<$Res>
    implements $CambioDePosicionCopyWith<$Res> {
  factory _$$CambioDePosicionImplCopyWith(_$CambioDePosicionImpl value,
          $Res Function(_$CambioDePosicionImpl) then) =
      __$$CambioDePosicionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String idCambioDePosicion, int hora, String posicion, int orden});
}

/// @nodoc
class __$$CambioDePosicionImplCopyWithImpl<$Res>
    extends _$CambioDePosicionCopyWithImpl<$Res, _$CambioDePosicionImpl>
    implements _$$CambioDePosicionImplCopyWith<$Res> {
  __$$CambioDePosicionImplCopyWithImpl(_$CambioDePosicionImpl _value,
      $Res Function(_$CambioDePosicionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idCambioDePosicion = null,
    Object? hora = null,
    Object? posicion = null,
    Object? orden = null,
  }) {
    return _then(_$CambioDePosicionImpl(
      idCambioDePosicion: null == idCambioDePosicion
          ? _value.idCambioDePosicion
          : idCambioDePosicion // ignore: cast_nullable_to_non_nullable
              as String,
      hora: null == hora
          ? _value.hora
          : hora // ignore: cast_nullable_to_non_nullable
              as int,
      posicion: null == posicion
          ? _value.posicion
          : posicion // ignore: cast_nullable_to_non_nullable
              as String,
      orden: null == orden
          ? _value.orden
          : orden // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CambioDePosicionImpl implements _CambioDePosicion {
  const _$CambioDePosicionImpl(
      {required this.idCambioDePosicion,
      required this.hora,
      required this.posicion,
      required this.orden});

  factory _$CambioDePosicionImpl.fromJson(Map<String, dynamic> json) =>
      _$$CambioDePosicionImplFromJson(json);

  @override
  final String idCambioDePosicion;
// Identificador único para cada cambio de posición
  @override
  final int hora;
// Hora del cambio (de 8 AM a 7 AM)
  @override
  final String posicion;
// La posición del paciente
  @override
  final int orden;

  @override
  String toString() {
    return 'CambioDePosicion(idCambioDePosicion: $idCambioDePosicion, hora: $hora, posicion: $posicion, orden: $orden)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CambioDePosicionImpl &&
            (identical(other.idCambioDePosicion, idCambioDePosicion) ||
                other.idCambioDePosicion == idCambioDePosicion) &&
            (identical(other.hora, hora) || other.hora == hora) &&
            (identical(other.posicion, posicion) ||
                other.posicion == posicion) &&
            (identical(other.orden, orden) || other.orden == orden));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, idCambioDePosicion, hora, posicion, orden);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CambioDePosicionImplCopyWith<_$CambioDePosicionImpl> get copyWith =>
      __$$CambioDePosicionImplCopyWithImpl<_$CambioDePosicionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CambioDePosicionImplToJson(
      this,
    );
  }
}

abstract class _CambioDePosicion implements CambioDePosicion {
  const factory _CambioDePosicion(
      {required final String idCambioDePosicion,
      required final int hora,
      required final String posicion,
      required final int orden}) = _$CambioDePosicionImpl;

  factory _CambioDePosicion.fromJson(Map<String, dynamic> json) =
      _$CambioDePosicionImpl.fromJson;

  @override
  String get idCambioDePosicion;
  @override // Identificador único para cada cambio de posición
  int get hora;
  @override // Hora del cambio (de 8 AM a 7 AM)
  String get posicion;
  @override // La posición del paciente
  int get orden;
  @override
  @JsonKey(ignore: true)
  _$$CambioDePosicionImplCopyWith<_$CambioDePosicionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
