// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'liquido_administrado.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LiquidoAdministrado {
  String get idLiquidoAdministrado => throw _privateConstructorUsedError;
  String get medicamento => throw _privateConstructorUsedError;
  int get cantidad => throw _privateConstructorUsedError;
  String? get comentario => throw _privateConstructorUsedError;
  String? get dosis => throw _privateConstructorUsedError;
  DateTime get hora => throw _privateConstructorUsedError;
  bool get esTratamiento => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LiquidoAdministradoCopyWith<LiquidoAdministrado> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiquidoAdministradoCopyWith<$Res> {
  factory $LiquidoAdministradoCopyWith(
          LiquidoAdministrado value, $Res Function(LiquidoAdministrado) then) =
      _$LiquidoAdministradoCopyWithImpl<$Res, LiquidoAdministrado>;
  @useResult
  $Res call(
      {String idLiquidoAdministrado,
      String medicamento,
      int cantidad,
      String? comentario,
      String? dosis,
      DateTime hora,
      bool esTratamiento});
}

/// @nodoc
class _$LiquidoAdministradoCopyWithImpl<$Res, $Val extends LiquidoAdministrado>
    implements $LiquidoAdministradoCopyWith<$Res> {
  _$LiquidoAdministradoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idLiquidoAdministrado = null,
    Object? medicamento = null,
    Object? cantidad = null,
    Object? comentario = freezed,
    Object? dosis = freezed,
    Object? hora = null,
    Object? esTratamiento = null,
  }) {
    return _then(_value.copyWith(
      idLiquidoAdministrado: null == idLiquidoAdministrado
          ? _value.idLiquidoAdministrado
          : idLiquidoAdministrado // ignore: cast_nullable_to_non_nullable
              as String,
      medicamento: null == medicamento
          ? _value.medicamento
          : medicamento // ignore: cast_nullable_to_non_nullable
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
      esTratamiento: null == esTratamiento
          ? _value.esTratamiento
          : esTratamiento // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LiquidoAdministradoImplCopyWith<$Res>
    implements $LiquidoAdministradoCopyWith<$Res> {
  factory _$$LiquidoAdministradoImplCopyWith(_$LiquidoAdministradoImpl value,
          $Res Function(_$LiquidoAdministradoImpl) then) =
      __$$LiquidoAdministradoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String idLiquidoAdministrado,
      String medicamento,
      int cantidad,
      String? comentario,
      String? dosis,
      DateTime hora,
      bool esTratamiento});
}

/// @nodoc
class __$$LiquidoAdministradoImplCopyWithImpl<$Res>
    extends _$LiquidoAdministradoCopyWithImpl<$Res, _$LiquidoAdministradoImpl>
    implements _$$LiquidoAdministradoImplCopyWith<$Res> {
  __$$LiquidoAdministradoImplCopyWithImpl(_$LiquidoAdministradoImpl _value,
      $Res Function(_$LiquidoAdministradoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idLiquidoAdministrado = null,
    Object? medicamento = null,
    Object? cantidad = null,
    Object? comentario = freezed,
    Object? dosis = freezed,
    Object? hora = null,
    Object? esTratamiento = null,
  }) {
    return _then(_$LiquidoAdministradoImpl(
      idLiquidoAdministrado: null == idLiquidoAdministrado
          ? _value.idLiquidoAdministrado
          : idLiquidoAdministrado // ignore: cast_nullable_to_non_nullable
              as String,
      medicamento: null == medicamento
          ? _value.medicamento
          : medicamento // ignore: cast_nullable_to_non_nullable
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
      esTratamiento: null == esTratamiento
          ? _value.esTratamiento
          : esTratamiento // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LiquidoAdministradoImpl implements _LiquidoAdministrado {
  const _$LiquidoAdministradoImpl(
      {required this.idLiquidoAdministrado,
      required this.medicamento,
      required this.cantidad,
      this.comentario,
      this.dosis,
      required this.hora,
      required this.esTratamiento});

  @override
  final String idLiquidoAdministrado;
  @override
  final String medicamento;
  @override
  final int cantidad;
  @override
  final String? comentario;
  @override
  final String? dosis;
  @override
  final DateTime hora;
  @override
  final bool esTratamiento;

  @override
  String toString() {
    return 'LiquidoAdministrado(idLiquidoAdministrado: $idLiquidoAdministrado, medicamento: $medicamento, cantidad: $cantidad, comentario: $comentario, dosis: $dosis, hora: $hora, esTratamiento: $esTratamiento)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiquidoAdministradoImpl &&
            (identical(other.idLiquidoAdministrado, idLiquidoAdministrado) ||
                other.idLiquidoAdministrado == idLiquidoAdministrado) &&
            (identical(other.medicamento, medicamento) ||
                other.medicamento == medicamento) &&
            (identical(other.cantidad, cantidad) ||
                other.cantidad == cantidad) &&
            (identical(other.comentario, comentario) ||
                other.comentario == comentario) &&
            (identical(other.dosis, dosis) || other.dosis == dosis) &&
            (identical(other.hora, hora) || other.hora == hora) &&
            (identical(other.esTratamiento, esTratamiento) ||
                other.esTratamiento == esTratamiento));
  }

  @override
  int get hashCode => Object.hash(runtimeType, idLiquidoAdministrado,
      medicamento, cantidad, comentario, dosis, hora, esTratamiento);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LiquidoAdministradoImplCopyWith<_$LiquidoAdministradoImpl> get copyWith =>
      __$$LiquidoAdministradoImplCopyWithImpl<_$LiquidoAdministradoImpl>(
          this, _$identity);
}

abstract class _LiquidoAdministrado implements LiquidoAdministrado {
  const factory _LiquidoAdministrado(
      {required final String idLiquidoAdministrado,
      required final String medicamento,
      required final int cantidad,
      final String? comentario,
      final String? dosis,
      required final DateTime hora,
      required final bool esTratamiento}) = _$LiquidoAdministradoImpl;

  @override
  String get idLiquidoAdministrado;
  @override
  String get medicamento;
  @override
  int get cantidad;
  @override
  String? get comentario;
  @override
  String? get dosis;
  @override
  DateTime get hora;
  @override
  bool get esTratamiento;
  @override
  @JsonKey(ignore: true)
  _$$LiquidoAdministradoImplCopyWith<_$LiquidoAdministradoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
