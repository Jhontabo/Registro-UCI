// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cateter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Cateter _$CateterFromJson(Map<String, dynamic> json) {
  return _Cateter.fromJson(json);
}

/// @nodoc
mixin _$Cateter {
  String get id => throw _privateConstructorUsedError;
  String get tipo => throw _privateConstructorUsedError;
  String get sitio => throw _privateConstructorUsedError;
  DateTime get fechaInsercion =>
      throw _privateConstructorUsedError; // ✅ Ahora es DateTime
  DateTime? get fechaRetiro =>
      throw _privateConstructorUsedError; // ✅ Ahora es DateTime opcional
  String get lugarProcedencia => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CateterCopyWith<Cateter> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CateterCopyWith<$Res> {
  factory $CateterCopyWith(Cateter value, $Res Function(Cateter) then) =
      _$CateterCopyWithImpl<$Res, Cateter>;
  @useResult
  $Res call(
      {String id,
      String tipo,
      String sitio,
      DateTime fechaInsercion,
      DateTime? fechaRetiro,
      String lugarProcedencia});
}

/// @nodoc
class _$CateterCopyWithImpl<$Res, $Val extends Cateter>
    implements $CateterCopyWith<$Res> {
  _$CateterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tipo = null,
    Object? sitio = null,
    Object? fechaInsercion = null,
    Object? fechaRetiro = freezed,
    Object? lugarProcedencia = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      tipo: null == tipo
          ? _value.tipo
          : tipo // ignore: cast_nullable_to_non_nullable
              as String,
      sitio: null == sitio
          ? _value.sitio
          : sitio // ignore: cast_nullable_to_non_nullable
              as String,
      fechaInsercion: null == fechaInsercion
          ? _value.fechaInsercion
          : fechaInsercion // ignore: cast_nullable_to_non_nullable
              as DateTime,
      fechaRetiro: freezed == fechaRetiro
          ? _value.fechaRetiro
          : fechaRetiro // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lugarProcedencia: null == lugarProcedencia
          ? _value.lugarProcedencia
          : lugarProcedencia // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CateterImplCopyWith<$Res> implements $CateterCopyWith<$Res> {
  factory _$$CateterImplCopyWith(
          _$CateterImpl value, $Res Function(_$CateterImpl) then) =
      __$$CateterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String tipo,
      String sitio,
      DateTime fechaInsercion,
      DateTime? fechaRetiro,
      String lugarProcedencia});
}

/// @nodoc
class __$$CateterImplCopyWithImpl<$Res>
    extends _$CateterCopyWithImpl<$Res, _$CateterImpl>
    implements _$$CateterImplCopyWith<$Res> {
  __$$CateterImplCopyWithImpl(
      _$CateterImpl _value, $Res Function(_$CateterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tipo = null,
    Object? sitio = null,
    Object? fechaInsercion = null,
    Object? fechaRetiro = freezed,
    Object? lugarProcedencia = null,
  }) {
    return _then(_$CateterImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      tipo: null == tipo
          ? _value.tipo
          : tipo // ignore: cast_nullable_to_non_nullable
              as String,
      sitio: null == sitio
          ? _value.sitio
          : sitio // ignore: cast_nullable_to_non_nullable
              as String,
      fechaInsercion: null == fechaInsercion
          ? _value.fechaInsercion
          : fechaInsercion // ignore: cast_nullable_to_non_nullable
              as DateTime,
      fechaRetiro: freezed == fechaRetiro
          ? _value.fechaRetiro
          : fechaRetiro // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lugarProcedencia: null == lugarProcedencia
          ? _value.lugarProcedencia
          : lugarProcedencia // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CateterImpl implements _Cateter {
  const _$CateterImpl(
      {required this.id,
      required this.tipo,
      required this.sitio,
      required this.fechaInsercion,
      this.fechaRetiro,
      required this.lugarProcedencia});

  factory _$CateterImpl.fromJson(Map<String, dynamic> json) =>
      _$$CateterImplFromJson(json);

  @override
  final String id;
  @override
  final String tipo;
  @override
  final String sitio;
  @override
  final DateTime fechaInsercion;
// ✅ Ahora es DateTime
  @override
  final DateTime? fechaRetiro;
// ✅ Ahora es DateTime opcional
  @override
  final String lugarProcedencia;

  @override
  String toString() {
    return 'Cateter(id: $id, tipo: $tipo, sitio: $sitio, fechaInsercion: $fechaInsercion, fechaRetiro: $fechaRetiro, lugarProcedencia: $lugarProcedencia)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CateterImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tipo, tipo) || other.tipo == tipo) &&
            (identical(other.sitio, sitio) || other.sitio == sitio) &&
            (identical(other.fechaInsercion, fechaInsercion) ||
                other.fechaInsercion == fechaInsercion) &&
            (identical(other.fechaRetiro, fechaRetiro) ||
                other.fechaRetiro == fechaRetiro) &&
            (identical(other.lugarProcedencia, lugarProcedencia) ||
                other.lugarProcedencia == lugarProcedencia));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, tipo, sitio, fechaInsercion,
      fechaRetiro, lugarProcedencia);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CateterImplCopyWith<_$CateterImpl> get copyWith =>
      __$$CateterImplCopyWithImpl<_$CateterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CateterImplToJson(
      this,
    );
  }
}

abstract class _Cateter implements Cateter {
  const factory _Cateter(
      {required final String id,
      required final String tipo,
      required final String sitio,
      required final DateTime fechaInsercion,
      final DateTime? fechaRetiro,
      required final String lugarProcedencia}) = _$CateterImpl;

  factory _Cateter.fromJson(Map<String, dynamic> json) = _$CateterImpl.fromJson;

  @override
  String get id;
  @override
  String get tipo;
  @override
  String get sitio;
  @override
  DateTime get fechaInsercion;
  @override // ✅ Ahora es DateTime
  DateTime? get fechaRetiro;
  @override // ✅ Ahora es DateTime opcional
  String get lugarProcedencia;
  @override
  @JsonKey(ignore: true)
  _$$CateterImplCopyWith<_$CateterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
