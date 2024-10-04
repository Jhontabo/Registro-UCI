// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'necesidad.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Necesidad {
  String get idNecesidad => throw _privateConstructorUsedError;
  String get nombreNecesidad => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NecesidadCopyWith<Necesidad> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NecesidadCopyWith<$Res> {
  factory $NecesidadCopyWith(Necesidad value, $Res Function(Necesidad) then) =
      _$NecesidadCopyWithImpl<$Res, Necesidad>;
  @useResult
  $Res call({String idNecesidad, String nombreNecesidad});
}

/// @nodoc
class _$NecesidadCopyWithImpl<$Res, $Val extends Necesidad>
    implements $NecesidadCopyWith<$Res> {
  _$NecesidadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idNecesidad = null,
    Object? nombreNecesidad = null,
  }) {
    return _then(_value.copyWith(
      idNecesidad: null == idNecesidad
          ? _value.idNecesidad
          : idNecesidad // ignore: cast_nullable_to_non_nullable
              as String,
      nombreNecesidad: null == nombreNecesidad
          ? _value.nombreNecesidad
          : nombreNecesidad // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NecesidadImplCopyWith<$Res>
    implements $NecesidadCopyWith<$Res> {
  factory _$$NecesidadImplCopyWith(
          _$NecesidadImpl value, $Res Function(_$NecesidadImpl) then) =
      __$$NecesidadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String idNecesidad, String nombreNecesidad});
}

/// @nodoc
class __$$NecesidadImplCopyWithImpl<$Res>
    extends _$NecesidadCopyWithImpl<$Res, _$NecesidadImpl>
    implements _$$NecesidadImplCopyWith<$Res> {
  __$$NecesidadImplCopyWithImpl(
      _$NecesidadImpl _value, $Res Function(_$NecesidadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idNecesidad = null,
    Object? nombreNecesidad = null,
  }) {
    return _then(_$NecesidadImpl(
      idNecesidad: null == idNecesidad
          ? _value.idNecesidad
          : idNecesidad // ignore: cast_nullable_to_non_nullable
              as String,
      nombreNecesidad: null == nombreNecesidad
          ? _value.nombreNecesidad
          : nombreNecesidad // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NecesidadImpl implements _Necesidad {
  const _$NecesidadImpl(
      {required this.idNecesidad, required this.nombreNecesidad});

  @override
  final String idNecesidad;
  @override
  final String nombreNecesidad;

  @override
  String toString() {
    return 'Necesidad(idNecesidad: $idNecesidad, nombreNecesidad: $nombreNecesidad)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NecesidadImpl &&
            (identical(other.idNecesidad, idNecesidad) ||
                other.idNecesidad == idNecesidad) &&
            (identical(other.nombreNecesidad, nombreNecesidad) ||
                other.nombreNecesidad == nombreNecesidad));
  }

  @override
  int get hashCode => Object.hash(runtimeType, idNecesidad, nombreNecesidad);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NecesidadImplCopyWith<_$NecesidadImpl> get copyWith =>
      __$$NecesidadImplCopyWithImpl<_$NecesidadImpl>(this, _$identity);
}

abstract class _Necesidad implements Necesidad {
  const factory _Necesidad(
      {required final String idNecesidad,
      required final String nombreNecesidad}) = _$NecesidadImpl;

  @override
  String get idNecesidad;
  @override
  String get nombreNecesidad;
  @override
  @JsonKey(ignore: true)
  _$$NecesidadImplCopyWith<_$NecesidadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
