// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'actividad.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Actividad {
  String get idActividad => throw _privateConstructorUsedError;
  String get descripcion => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ActividadCopyWith<Actividad> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActividadCopyWith<$Res> {
  factory $ActividadCopyWith(Actividad value, $Res Function(Actividad) then) =
      _$ActividadCopyWithImpl<$Res, Actividad>;
  @useResult
  $Res call({String idActividad, String descripcion});
}

/// @nodoc
class _$ActividadCopyWithImpl<$Res, $Val extends Actividad>
    implements $ActividadCopyWith<$Res> {
  _$ActividadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idActividad = null,
    Object? descripcion = null,
  }) {
    return _then(_value.copyWith(
      idActividad: null == idActividad
          ? _value.idActividad
          : idActividad // ignore: cast_nullable_to_non_nullable
              as String,
      descripcion: null == descripcion
          ? _value.descripcion
          : descripcion // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActividadImplCopyWith<$Res>
    implements $ActividadCopyWith<$Res> {
  factory _$$ActividadImplCopyWith(
          _$ActividadImpl value, $Res Function(_$ActividadImpl) then) =
      __$$ActividadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String idActividad, String descripcion});
}

/// @nodoc
class __$$ActividadImplCopyWithImpl<$Res>
    extends _$ActividadCopyWithImpl<$Res, _$ActividadImpl>
    implements _$$ActividadImplCopyWith<$Res> {
  __$$ActividadImplCopyWithImpl(
      _$ActividadImpl _value, $Res Function(_$ActividadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idActividad = null,
    Object? descripcion = null,
  }) {
    return _then(_$ActividadImpl(
      idActividad: null == idActividad
          ? _value.idActividad
          : idActividad // ignore: cast_nullable_to_non_nullable
              as String,
      descripcion: null == descripcion
          ? _value.descripcion
          : descripcion // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ActividadImpl implements _Actividad {
  const _$ActividadImpl({required this.idActividad, required this.descripcion});

  @override
  final String idActividad;
  @override
  final String descripcion;

  @override
  String toString() {
    return 'Actividad(idActividad: $idActividad, descripcion: $descripcion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActividadImpl &&
            (identical(other.idActividad, idActividad) ||
                other.idActividad == idActividad) &&
            (identical(other.descripcion, descripcion) ||
                other.descripcion == descripcion));
  }

  @override
  int get hashCode => Object.hash(runtimeType, idActividad, descripcion);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ActividadImplCopyWith<_$ActividadImpl> get copyWith =>
      __$$ActividadImplCopyWithImpl<_$ActividadImpl>(this, _$identity);
}

abstract class _Actividad implements Actividad {
  const factory _Actividad(
      {required final String idActividad,
      required final String descripcion}) = _$ActividadImpl;

  @override
  String get idActividad;
  @override
  String get descripcion;
  @override
  @JsonKey(ignore: true)
  _$$ActividadImplCopyWith<_$ActividadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
