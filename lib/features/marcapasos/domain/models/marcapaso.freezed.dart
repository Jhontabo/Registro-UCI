// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'marcapaso.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Marcapaso _$MarcapasoFromJson(Map<String, dynamic> json) {
  return _Marcapaso.fromJson(json);
}

/// @nodoc
mixin _$Marcapaso {
  String get id => throw _privateConstructorUsedError;
  String get fechaColocacion => throw _privateConstructorUsedError;
  String get modo => throw _privateConstructorUsedError;
  String get via => throw _privateConstructorUsedError;
  int get frecuencia => throw _privateConstructorUsedError;
  int get sensibilidadSalida => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MarcapasoCopyWith<Marcapaso> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarcapasoCopyWith<$Res> {
  factory $MarcapasoCopyWith(Marcapaso value, $Res Function(Marcapaso) then) =
      _$MarcapasoCopyWithImpl<$Res, Marcapaso>;
  @useResult
  $Res call(
      {String id,
      String fechaColocacion,
      String modo,
      String via,
      int frecuencia,
      int sensibilidadSalida});
}

/// @nodoc
class _$MarcapasoCopyWithImpl<$Res, $Val extends Marcapaso>
    implements $MarcapasoCopyWith<$Res> {
  _$MarcapasoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fechaColocacion = null,
    Object? modo = null,
    Object? via = null,
    Object? frecuencia = null,
    Object? sensibilidadSalida = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fechaColocacion: null == fechaColocacion
          ? _value.fechaColocacion
          : fechaColocacion // ignore: cast_nullable_to_non_nullable
              as String,
      modo: null == modo
          ? _value.modo
          : modo // ignore: cast_nullable_to_non_nullable
              as String,
      via: null == via
          ? _value.via
          : via // ignore: cast_nullable_to_non_nullable
              as String,
      frecuencia: null == frecuencia
          ? _value.frecuencia
          : frecuencia // ignore: cast_nullable_to_non_nullable
              as int,
      sensibilidadSalida: null == sensibilidadSalida
          ? _value.sensibilidadSalida
          : sensibilidadSalida // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MarcapasoImplCopyWith<$Res>
    implements $MarcapasoCopyWith<$Res> {
  factory _$$MarcapasoImplCopyWith(
          _$MarcapasoImpl value, $Res Function(_$MarcapasoImpl) then) =
      __$$MarcapasoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String fechaColocacion,
      String modo,
      String via,
      int frecuencia,
      int sensibilidadSalida});
}

/// @nodoc
class __$$MarcapasoImplCopyWithImpl<$Res>
    extends _$MarcapasoCopyWithImpl<$Res, _$MarcapasoImpl>
    implements _$$MarcapasoImplCopyWith<$Res> {
  __$$MarcapasoImplCopyWithImpl(
      _$MarcapasoImpl _value, $Res Function(_$MarcapasoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fechaColocacion = null,
    Object? modo = null,
    Object? via = null,
    Object? frecuencia = null,
    Object? sensibilidadSalida = null,
  }) {
    return _then(_$MarcapasoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fechaColocacion: null == fechaColocacion
          ? _value.fechaColocacion
          : fechaColocacion // ignore: cast_nullable_to_non_nullable
              as String,
      modo: null == modo
          ? _value.modo
          : modo // ignore: cast_nullable_to_non_nullable
              as String,
      via: null == via
          ? _value.via
          : via // ignore: cast_nullable_to_non_nullable
              as String,
      frecuencia: null == frecuencia
          ? _value.frecuencia
          : frecuencia // ignore: cast_nullable_to_non_nullable
              as int,
      sensibilidadSalida: null == sensibilidadSalida
          ? _value.sensibilidadSalida
          : sensibilidadSalida // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MarcapasoImpl implements _Marcapaso {
  _$MarcapasoImpl(
      {required this.id,
      required this.fechaColocacion,
      required this.modo,
      required this.via,
      required this.frecuencia,
      required this.sensibilidadSalida});

  factory _$MarcapasoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MarcapasoImplFromJson(json);

  @override
  final String id;
  @override
  final String fechaColocacion;
  @override
  final String modo;
  @override
  final String via;
  @override
  final int frecuencia;
  @override
  final int sensibilidadSalida;

  @override
  String toString() {
    return 'Marcapaso(id: $id, fechaColocacion: $fechaColocacion, modo: $modo, via: $via, frecuencia: $frecuencia, sensibilidadSalida: $sensibilidadSalida)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarcapasoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fechaColocacion, fechaColocacion) ||
                other.fechaColocacion == fechaColocacion) &&
            (identical(other.modo, modo) || other.modo == modo) &&
            (identical(other.via, via) || other.via == via) &&
            (identical(other.frecuencia, frecuencia) ||
                other.frecuencia == frecuencia) &&
            (identical(other.sensibilidadSalida, sensibilidadSalida) ||
                other.sensibilidadSalida == sensibilidadSalida));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, fechaColocacion, modo, via,
      frecuencia, sensibilidadSalida);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MarcapasoImplCopyWith<_$MarcapasoImpl> get copyWith =>
      __$$MarcapasoImplCopyWithImpl<_$MarcapasoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MarcapasoImplToJson(
      this,
    );
  }
}

abstract class _Marcapaso implements Marcapaso {
  factory _Marcapaso(
      {required final String id,
      required final String fechaColocacion,
      required final String modo,
      required final String via,
      required final int frecuencia,
      required final int sensibilidadSalida}) = _$MarcapasoImpl;

  factory _Marcapaso.fromJson(Map<String, dynamic> json) =
      _$MarcapasoImpl.fromJson;

  @override
  String get id;
  @override
  String get fechaColocacion;
  @override
  String get modo;
  @override
  String get via;
  @override
  int get frecuencia;
  @override
  int get sensibilidadSalida;
  @override
  @JsonKey(ignore: true)
  _$$MarcapasoImplCopyWith<_$MarcapasoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
