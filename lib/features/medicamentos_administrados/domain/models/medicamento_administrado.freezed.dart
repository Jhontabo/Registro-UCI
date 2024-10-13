// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'medicamento_administrado.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MedicamentoAdministrado {
  String get idMedicamentoAdministrado => throw _privateConstructorUsedError;
  String get medicamento => throw _privateConstructorUsedError;
  int get cantidad => throw _privateConstructorUsedError;
  String get unidad => throw _privateConstructorUsedError;
  bool get esTratamiento => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MedicamentoAdministradoCopyWith<MedicamentoAdministrado> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedicamentoAdministradoCopyWith<$Res> {
  factory $MedicamentoAdministradoCopyWith(MedicamentoAdministrado value,
          $Res Function(MedicamentoAdministrado) then) =
      _$MedicamentoAdministradoCopyWithImpl<$Res, MedicamentoAdministrado>;
  @useResult
  $Res call(
      {String idMedicamentoAdministrado,
      String medicamento,
      int cantidad,
      String unidad,
      bool esTratamiento});
}

/// @nodoc
class _$MedicamentoAdministradoCopyWithImpl<$Res,
        $Val extends MedicamentoAdministrado>
    implements $MedicamentoAdministradoCopyWith<$Res> {
  _$MedicamentoAdministradoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idMedicamentoAdministrado = null,
    Object? medicamento = null,
    Object? cantidad = null,
    Object? unidad = null,
    Object? esTratamiento = null,
  }) {
    return _then(_value.copyWith(
      idMedicamentoAdministrado: null == idMedicamentoAdministrado
          ? _value.idMedicamentoAdministrado
          : idMedicamentoAdministrado // ignore: cast_nullable_to_non_nullable
              as String,
      medicamento: null == medicamento
          ? _value.medicamento
          : medicamento // ignore: cast_nullable_to_non_nullable
              as String,
      cantidad: null == cantidad
          ? _value.cantidad
          : cantidad // ignore: cast_nullable_to_non_nullable
              as int,
      unidad: null == unidad
          ? _value.unidad
          : unidad // ignore: cast_nullable_to_non_nullable
              as String,
      esTratamiento: null == esTratamiento
          ? _value.esTratamiento
          : esTratamiento // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MedicamentoAdministradoImplCopyWith<$Res>
    implements $MedicamentoAdministradoCopyWith<$Res> {
  factory _$$MedicamentoAdministradoImplCopyWith(
          _$MedicamentoAdministradoImpl value,
          $Res Function(_$MedicamentoAdministradoImpl) then) =
      __$$MedicamentoAdministradoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String idMedicamentoAdministrado,
      String medicamento,
      int cantidad,
      String unidad,
      bool esTratamiento});
}

/// @nodoc
class __$$MedicamentoAdministradoImplCopyWithImpl<$Res>
    extends _$MedicamentoAdministradoCopyWithImpl<$Res,
        _$MedicamentoAdministradoImpl>
    implements _$$MedicamentoAdministradoImplCopyWith<$Res> {
  __$$MedicamentoAdministradoImplCopyWithImpl(
      _$MedicamentoAdministradoImpl _value,
      $Res Function(_$MedicamentoAdministradoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idMedicamentoAdministrado = null,
    Object? medicamento = null,
    Object? cantidad = null,
    Object? unidad = null,
    Object? esTratamiento = null,
  }) {
    return _then(_$MedicamentoAdministradoImpl(
      idMedicamentoAdministrado: null == idMedicamentoAdministrado
          ? _value.idMedicamentoAdministrado
          : idMedicamentoAdministrado // ignore: cast_nullable_to_non_nullable
              as String,
      medicamento: null == medicamento
          ? _value.medicamento
          : medicamento // ignore: cast_nullable_to_non_nullable
              as String,
      cantidad: null == cantidad
          ? _value.cantidad
          : cantidad // ignore: cast_nullable_to_non_nullable
              as int,
      unidad: null == unidad
          ? _value.unidad
          : unidad // ignore: cast_nullable_to_non_nullable
              as String,
      esTratamiento: null == esTratamiento
          ? _value.esTratamiento
          : esTratamiento // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$MedicamentoAdministradoImpl implements _MedicamentoAdministrado {
  const _$MedicamentoAdministradoImpl(
      {required this.idMedicamentoAdministrado,
      required this.medicamento,
      required this.cantidad,
      required this.unidad,
      required this.esTratamiento});

  @override
  final String idMedicamentoAdministrado;
  @override
  final String medicamento;
  @override
  final int cantidad;
  @override
  final String unidad;
  @override
  final bool esTratamiento;

  @override
  String toString() {
    return 'MedicamentoAdministrado(idMedicamentoAdministrado: $idMedicamentoAdministrado, medicamento: $medicamento, cantidad: $cantidad, unidad: $unidad, esTratamiento: $esTratamiento)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MedicamentoAdministradoImpl &&
            (identical(other.idMedicamentoAdministrado,
                    idMedicamentoAdministrado) ||
                other.idMedicamentoAdministrado == idMedicamentoAdministrado) &&
            (identical(other.medicamento, medicamento) ||
                other.medicamento == medicamento) &&
            (identical(other.cantidad, cantidad) ||
                other.cantidad == cantidad) &&
            (identical(other.unidad, unidad) || other.unidad == unidad) &&
            (identical(other.esTratamiento, esTratamiento) ||
                other.esTratamiento == esTratamiento));
  }

  @override
  int get hashCode => Object.hash(runtimeType, idMedicamentoAdministrado,
      medicamento, cantidad, unidad, esTratamiento);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MedicamentoAdministradoImplCopyWith<_$MedicamentoAdministradoImpl>
      get copyWith => __$$MedicamentoAdministradoImplCopyWithImpl<
          _$MedicamentoAdministradoImpl>(this, _$identity);
}

abstract class _MedicamentoAdministrado implements MedicamentoAdministrado {
  const factory _MedicamentoAdministrado(
      {required final String idMedicamentoAdministrado,
      required final String medicamento,
      required final int cantidad,
      required final String unidad,
      required final bool esTratamiento}) = _$MedicamentoAdministradoImpl;

  @override
  String get idMedicamentoAdministrado;
  @override
  String get medicamento;
  @override
  int get cantidad;
  @override
  String get unidad;
  @override
  bool get esTratamiento;
  @override
  @JsonKey(ignore: true)
  _$$MedicamentoAdministradoImplCopyWith<_$MedicamentoAdministradoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
