// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resultado.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Resultado {
  String get idResultado => throw _privateConstructorUsedError;
  String get idNOC => throw _privateConstructorUsedError;
  String get nombre => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ResultadoCopyWith<Resultado> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultadoCopyWith<$Res> {
  factory $ResultadoCopyWith(Resultado value, $Res Function(Resultado) then) =
      _$ResultadoCopyWithImpl<$Res, Resultado>;
  @useResult
  $Res call({String idResultado, String idNOC, String nombre});
}

/// @nodoc
class _$ResultadoCopyWithImpl<$Res, $Val extends Resultado>
    implements $ResultadoCopyWith<$Res> {
  _$ResultadoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idResultado = null,
    Object? idNOC = null,
    Object? nombre = null,
  }) {
    return _then(_value.copyWith(
      idResultado: null == idResultado
          ? _value.idResultado
          : idResultado // ignore: cast_nullable_to_non_nullable
              as String,
      idNOC: null == idNOC
          ? _value.idNOC
          : idNOC // ignore: cast_nullable_to_non_nullable
              as String,
      nombre: null == nombre
          ? _value.nombre
          : nombre // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResultadoImplCopyWith<$Res>
    implements $ResultadoCopyWith<$Res> {
  factory _$$ResultadoImplCopyWith(
          _$ResultadoImpl value, $Res Function(_$ResultadoImpl) then) =
      __$$ResultadoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String idResultado, String idNOC, String nombre});
}

/// @nodoc
class __$$ResultadoImplCopyWithImpl<$Res>
    extends _$ResultadoCopyWithImpl<$Res, _$ResultadoImpl>
    implements _$$ResultadoImplCopyWith<$Res> {
  __$$ResultadoImplCopyWithImpl(
      _$ResultadoImpl _value, $Res Function(_$ResultadoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idResultado = null,
    Object? idNOC = null,
    Object? nombre = null,
  }) {
    return _then(_$ResultadoImpl(
      idResultado: null == idResultado
          ? _value.idResultado
          : idResultado // ignore: cast_nullable_to_non_nullable
              as String,
      idNOC: null == idNOC
          ? _value.idNOC
          : idNOC // ignore: cast_nullable_to_non_nullable
              as String,
      nombre: null == nombre
          ? _value.nombre
          : nombre // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ResultadoImpl implements _Resultado {
  const _$ResultadoImpl(
      {required this.idResultado, required this.idNOC, required this.nombre});

  @override
  final String idResultado;
  @override
  final String idNOC;
  @override
  final String nombre;

  @override
  String toString() {
    return 'Resultado(idResultado: $idResultado, idNOC: $idNOC, nombre: $nombre)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultadoImpl &&
            (identical(other.idResultado, idResultado) ||
                other.idResultado == idResultado) &&
            (identical(other.idNOC, idNOC) || other.idNOC == idNOC) &&
            (identical(other.nombre, nombre) || other.nombre == nombre));
  }

  @override
  int get hashCode => Object.hash(runtimeType, idResultado, idNOC, nombre);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultadoImplCopyWith<_$ResultadoImpl> get copyWith =>
      __$$ResultadoImplCopyWithImpl<_$ResultadoImpl>(this, _$identity);
}

abstract class _Resultado implements Resultado {
  const factory _Resultado(
      {required final String idResultado,
      required final String idNOC,
      required final String nombre}) = _$ResultadoImpl;

  @override
  String get idResultado;
  @override
  String get idNOC;
  @override
  String get nombre;
  @override
  @JsonKey(ignore: true)
  _$$ResultadoImplCopyWith<_$ResultadoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
