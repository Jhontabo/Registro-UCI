// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'control_sedacion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ControlSedacion {
  String get id => throw _privateConstructorUsedError;
  int get hora => throw _privateConstructorUsedError;
  String get observacion => throw _privateConstructorUsedError;
  int get orden => throw _privateConstructorUsedError;
  int get rass => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ControlSedacionCopyWith<ControlSedacion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ControlSedacionCopyWith<$Res> {
  factory $ControlSedacionCopyWith(
          ControlSedacion value, $Res Function(ControlSedacion) then) =
      _$ControlSedacionCopyWithImpl<$Res, ControlSedacion>;
  @useResult
  $Res call({String id, int hora, String observacion, int orden, int rass});
}

/// @nodoc
class _$ControlSedacionCopyWithImpl<$Res, $Val extends ControlSedacion>
    implements $ControlSedacionCopyWith<$Res> {
  _$ControlSedacionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? hora = null,
    Object? observacion = null,
    Object? orden = null,
    Object? rass = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      hora: null == hora
          ? _value.hora
          : hora // ignore: cast_nullable_to_non_nullable
              as int,
      observacion: null == observacion
          ? _value.observacion
          : observacion // ignore: cast_nullable_to_non_nullable
              as String,
      orden: null == orden
          ? _value.orden
          : orden // ignore: cast_nullable_to_non_nullable
              as int,
      rass: null == rass
          ? _value.rass
          : rass // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ControlSedacionImplCopyWith<$Res>
    implements $ControlSedacionCopyWith<$Res> {
  factory _$$ControlSedacionImplCopyWith(_$ControlSedacionImpl value,
          $Res Function(_$ControlSedacionImpl) then) =
      __$$ControlSedacionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, int hora, String observacion, int orden, int rass});
}

/// @nodoc
class __$$ControlSedacionImplCopyWithImpl<$Res>
    extends _$ControlSedacionCopyWithImpl<$Res, _$ControlSedacionImpl>
    implements _$$ControlSedacionImplCopyWith<$Res> {
  __$$ControlSedacionImplCopyWithImpl(
      _$ControlSedacionImpl _value, $Res Function(_$ControlSedacionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? hora = null,
    Object? observacion = null,
    Object? orden = null,
    Object? rass = null,
  }) {
    return _then(_$ControlSedacionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      hora: null == hora
          ? _value.hora
          : hora // ignore: cast_nullable_to_non_nullable
              as int,
      observacion: null == observacion
          ? _value.observacion
          : observacion // ignore: cast_nullable_to_non_nullable
              as String,
      orden: null == orden
          ? _value.orden
          : orden // ignore: cast_nullable_to_non_nullable
              as int,
      rass: null == rass
          ? _value.rass
          : rass // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ControlSedacionImpl implements _ControlSedacion {
  const _$ControlSedacionImpl(
      {required this.id,
      required this.hora,
      required this.observacion,
      required this.orden,
      required this.rass});

  @override
  final String id;
  @override
  final int hora;
  @override
  final String observacion;
  @override
  final int orden;
  @override
  final int rass;

  @override
  String toString() {
    return 'ControlSedacion(id: $id, hora: $hora, observacion: $observacion, orden: $orden, rass: $rass)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ControlSedacionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.hora, hora) || other.hora == hora) &&
            (identical(other.observacion, observacion) ||
                other.observacion == observacion) &&
            (identical(other.orden, orden) || other.orden == orden) &&
            (identical(other.rass, rass) || other.rass == rass));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, hora, observacion, orden, rass);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ControlSedacionImplCopyWith<_$ControlSedacionImpl> get copyWith =>
      __$$ControlSedacionImplCopyWithImpl<_$ControlSedacionImpl>(
          this, _$identity);
}

abstract class _ControlSedacion implements ControlSedacion {
  const factory _ControlSedacion(
      {required final String id,
      required final int hora,
      required final String observacion,
      required final int orden,
      required final int rass}) = _$ControlSedacionImpl;

  @override
  String get id;
  @override
  int get hora;
  @override
  String get observacion;
  @override
  int get orden;
  @override
  int get rass;
  @override
  @JsonKey(ignore: true)
  _$$ControlSedacionImplCopyWith<_$ControlSedacionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
