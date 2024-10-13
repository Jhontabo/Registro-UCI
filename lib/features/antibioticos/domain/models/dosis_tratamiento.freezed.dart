// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dosis_tratamiento.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DosisTratamiento {
  String get idDosisTratamiento => throw _privateConstructorUsedError;
  int get cantidad => throw _privateConstructorUsedError;
  String? get comentario => throw _privateConstructorUsedError;
  String? get dosis => throw _privateConstructorUsedError;
  DateTime get hora => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DosisTratamientoCopyWith<DosisTratamiento> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DosisTratamientoCopyWith<$Res> {
  factory $DosisTratamientoCopyWith(
          DosisTratamiento value, $Res Function(DosisTratamiento) then) =
      _$DosisTratamientoCopyWithImpl<$Res, DosisTratamiento>;
  @useResult
  $Res call(
      {String idDosisTratamiento,
      int cantidad,
      String? comentario,
      String? dosis,
      DateTime hora});
}

/// @nodoc
class _$DosisTratamientoCopyWithImpl<$Res, $Val extends DosisTratamiento>
    implements $DosisTratamientoCopyWith<$Res> {
  _$DosisTratamientoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idDosisTratamiento = null,
    Object? cantidad = null,
    Object? comentario = freezed,
    Object? dosis = freezed,
    Object? hora = null,
  }) {
    return _then(_value.copyWith(
      idDosisTratamiento: null == idDosisTratamiento
          ? _value.idDosisTratamiento
          : idDosisTratamiento // ignore: cast_nullable_to_non_nullable
              as String,
      cantidad: null == cantidad
          ? _value.cantidad
          : cantidad // ignore: cast_nullable_to_non_nullable
              as int,
      comentario: freezed == comentario
          ? _value.comentario
          : comentario // ignore: cast_nullable_to_non_nullable
              as String?,
      dosis: freezed == dosis
          ? _value.dosis
          : dosis // ignore: cast_nullable_to_non_nullable
              as String?,
      hora: null == hora
          ? _value.hora
          : hora // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DosisTratamientoImplCopyWith<$Res>
    implements $DosisTratamientoCopyWith<$Res> {
  factory _$$DosisTratamientoImplCopyWith(_$DosisTratamientoImpl value,
          $Res Function(_$DosisTratamientoImpl) then) =
      __$$DosisTratamientoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String idDosisTratamiento,
      int cantidad,
      String? comentario,
      String? dosis,
      DateTime hora});
}

/// @nodoc
class __$$DosisTratamientoImplCopyWithImpl<$Res>
    extends _$DosisTratamientoCopyWithImpl<$Res, _$DosisTratamientoImpl>
    implements _$$DosisTratamientoImplCopyWith<$Res> {
  __$$DosisTratamientoImplCopyWithImpl(_$DosisTratamientoImpl _value,
      $Res Function(_$DosisTratamientoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idDosisTratamiento = null,
    Object? cantidad = null,
    Object? comentario = freezed,
    Object? dosis = freezed,
    Object? hora = null,
  }) {
    return _then(_$DosisTratamientoImpl(
      idDosisTratamiento: null == idDosisTratamiento
          ? _value.idDosisTratamiento
          : idDosisTratamiento // ignore: cast_nullable_to_non_nullable
              as String,
      cantidad: null == cantidad
          ? _value.cantidad
          : cantidad // ignore: cast_nullable_to_non_nullable
              as int,
      comentario: freezed == comentario
          ? _value.comentario
          : comentario // ignore: cast_nullable_to_non_nullable
              as String?,
      dosis: freezed == dosis
          ? _value.dosis
          : dosis // ignore: cast_nullable_to_non_nullable
              as String?,
      hora: null == hora
          ? _value.hora
          : hora // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$DosisTratamientoImpl implements _DosisTratamiento {
  const _$DosisTratamientoImpl(
      {required this.idDosisTratamiento,
      required this.cantidad,
      this.comentario,
      this.dosis,
      required this.hora});

  @override
  final String idDosisTratamiento;
  @override
  final int cantidad;
  @override
  final String? comentario;
  @override
  final String? dosis;
  @override
  final DateTime hora;

  @override
  String toString() {
    return 'DosisTratamiento(idDosisTratamiento: $idDosisTratamiento, cantidad: $cantidad, comentario: $comentario, dosis: $dosis, hora: $hora)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DosisTratamientoImpl &&
            (identical(other.idDosisTratamiento, idDosisTratamiento) ||
                other.idDosisTratamiento == idDosisTratamiento) &&
            (identical(other.cantidad, cantidad) ||
                other.cantidad == cantidad) &&
            (identical(other.comentario, comentario) ||
                other.comentario == comentario) &&
            (identical(other.dosis, dosis) || other.dosis == dosis) &&
            (identical(other.hora, hora) || other.hora == hora));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, idDosisTratamiento, cantidad, comentario, dosis, hora);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DosisTratamientoImplCopyWith<_$DosisTratamientoImpl> get copyWith =>
      __$$DosisTratamientoImplCopyWithImpl<_$DosisTratamientoImpl>(
          this, _$identity);
}

abstract class _DosisTratamiento implements DosisTratamiento {
  const factory _DosisTratamiento(
      {required final String idDosisTratamiento,
      required final int cantidad,
      final String? comentario,
      final String? dosis,
      required final DateTime hora}) = _$DosisTratamientoImpl;

  @override
  String get idDosisTratamiento;
  @override
  int get cantidad;
  @override
  String? get comentario;
  @override
  String? get dosis;
  @override
  DateTime get hora;
  @override
  @JsonKey(ignore: true)
  _$$DosisTratamientoImplCopyWith<_$DosisTratamientoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
