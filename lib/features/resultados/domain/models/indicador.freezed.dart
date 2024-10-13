// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'indicador.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Indicador {
  String get idIndicador => throw _privateConstructorUsedError;
  String get descripcion => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IndicadorCopyWith<Indicador> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IndicadorCopyWith<$Res> {
  factory $IndicadorCopyWith(Indicador value, $Res Function(Indicador) then) =
      _$IndicadorCopyWithImpl<$Res, Indicador>;
  @useResult
  $Res call({String idIndicador, String descripcion});
}

/// @nodoc
class _$IndicadorCopyWithImpl<$Res, $Val extends Indicador>
    implements $IndicadorCopyWith<$Res> {
  _$IndicadorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idIndicador = null,
    Object? descripcion = null,
  }) {
    return _then(_value.copyWith(
      idIndicador: null == idIndicador
          ? _value.idIndicador
          : idIndicador // ignore: cast_nullable_to_non_nullable
              as String,
      descripcion: null == descripcion
          ? _value.descripcion
          : descripcion // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IndicadorImplCopyWith<$Res>
    implements $IndicadorCopyWith<$Res> {
  factory _$$IndicadorImplCopyWith(
          _$IndicadorImpl value, $Res Function(_$IndicadorImpl) then) =
      __$$IndicadorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String idIndicador, String descripcion});
}

/// @nodoc
class __$$IndicadorImplCopyWithImpl<$Res>
    extends _$IndicadorCopyWithImpl<$Res, _$IndicadorImpl>
    implements _$$IndicadorImplCopyWith<$Res> {
  __$$IndicadorImplCopyWithImpl(
      _$IndicadorImpl _value, $Res Function(_$IndicadorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idIndicador = null,
    Object? descripcion = null,
  }) {
    return _then(_$IndicadorImpl(
      idIndicador: null == idIndicador
          ? _value.idIndicador
          : idIndicador // ignore: cast_nullable_to_non_nullable
              as String,
      descripcion: null == descripcion
          ? _value.descripcion
          : descripcion // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$IndicadorImpl implements _Indicador {
  const _$IndicadorImpl({required this.idIndicador, required this.descripcion});

  @override
  final String idIndicador;
  @override
  final String descripcion;

  @override
  String toString() {
    return 'Indicador(idIndicador: $idIndicador, descripcion: $descripcion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IndicadorImpl &&
            (identical(other.idIndicador, idIndicador) ||
                other.idIndicador == idIndicador) &&
            (identical(other.descripcion, descripcion) ||
                other.descripcion == descripcion));
  }

  @override
  int get hashCode => Object.hash(runtimeType, idIndicador, descripcion);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IndicadorImplCopyWith<_$IndicadorImpl> get copyWith =>
      __$$IndicadorImplCopyWithImpl<_$IndicadorImpl>(this, _$identity);
}

abstract class _Indicador implements Indicador {
  const factory _Indicador(
      {required final String idIndicador,
      required final String descripcion}) = _$IndicadorImpl;

  @override
  String get idIndicador;
  @override
  String get descripcion;
  @override
  @JsonKey(ignore: true)
  _$$IndicadorImplCopyWith<_$IndicadorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
