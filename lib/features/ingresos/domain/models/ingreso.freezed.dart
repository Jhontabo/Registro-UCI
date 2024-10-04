// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ingreso.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Ingreso {
  String get idIngreso => throw _privateConstructorUsedError;
  String get nombrePaciente => throw _privateConstructorUsedError;
  DateTime? get fechaNacimientoPaciente => throw _privateConstructorUsedError;
  String get epsOArl => throw _privateConstructorUsedError;
  String get identificacionPaciente => throw _privateConstructorUsedError;
  String get carpeta => throw _privateConstructorUsedError;
  DateTime get fechaIngreso => throw _privateConstructorUsedError;
  String get nombreFamiliar => throw _privateConstructorUsedError;
  String get parentescoFamiliar => throw _privateConstructorUsedError;
  String get telefonoFamiliar => throw _privateConstructorUsedError;
  String get diagnosticoIngreso => throw _privateConstructorUsedError;
  String get diagnosticoActual => throw _privateConstructorUsedError;
  double get peso => throw _privateConstructorUsedError;
  int get talla => throw _privateConstructorUsedError;
  String get cama => throw _privateConstructorUsedError;
  String? get alergias => throw _privateConstructorUsedError;
  DateTime? get fechaFin => throw _privateConstructorUsedError;
  Sala get sala => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IngresoCopyWith<Ingreso> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IngresoCopyWith<$Res> {
  factory $IngresoCopyWith(Ingreso value, $Res Function(Ingreso) then) =
      _$IngresoCopyWithImpl<$Res, Ingreso>;
  @useResult
  $Res call(
      {String idIngreso,
      String nombrePaciente,
      DateTime? fechaNacimientoPaciente,
      String epsOArl,
      String identificacionPaciente,
      String carpeta,
      DateTime fechaIngreso,
      String nombreFamiliar,
      String parentescoFamiliar,
      String telefonoFamiliar,
      String diagnosticoIngreso,
      String diagnosticoActual,
      double peso,
      int talla,
      String cama,
      String? alergias,
      DateTime? fechaFin,
      Sala sala});
}

/// @nodoc
class _$IngresoCopyWithImpl<$Res, $Val extends Ingreso>
    implements $IngresoCopyWith<$Res> {
  _$IngresoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idIngreso = null,
    Object? nombrePaciente = null,
    Object? fechaNacimientoPaciente = freezed,
    Object? epsOArl = null,
    Object? identificacionPaciente = null,
    Object? carpeta = null,
    Object? fechaIngreso = null,
    Object? nombreFamiliar = null,
    Object? parentescoFamiliar = null,
    Object? telefonoFamiliar = null,
    Object? diagnosticoIngreso = null,
    Object? diagnosticoActual = null,
    Object? peso = null,
    Object? talla = null,
    Object? cama = null,
    Object? alergias = freezed,
    Object? fechaFin = freezed,
    Object? sala = null,
  }) {
    return _then(_value.copyWith(
      idIngreso: null == idIngreso
          ? _value.idIngreso
          : idIngreso // ignore: cast_nullable_to_non_nullable
              as String,
      nombrePaciente: null == nombrePaciente
          ? _value.nombrePaciente
          : nombrePaciente // ignore: cast_nullable_to_non_nullable
              as String,
      fechaNacimientoPaciente: freezed == fechaNacimientoPaciente
          ? _value.fechaNacimientoPaciente
          : fechaNacimientoPaciente // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      epsOArl: null == epsOArl
          ? _value.epsOArl
          : epsOArl // ignore: cast_nullable_to_non_nullable
              as String,
      identificacionPaciente: null == identificacionPaciente
          ? _value.identificacionPaciente
          : identificacionPaciente // ignore: cast_nullable_to_non_nullable
              as String,
      carpeta: null == carpeta
          ? _value.carpeta
          : carpeta // ignore: cast_nullable_to_non_nullable
              as String,
      fechaIngreso: null == fechaIngreso
          ? _value.fechaIngreso
          : fechaIngreso // ignore: cast_nullable_to_non_nullable
              as DateTime,
      nombreFamiliar: null == nombreFamiliar
          ? _value.nombreFamiliar
          : nombreFamiliar // ignore: cast_nullable_to_non_nullable
              as String,
      parentescoFamiliar: null == parentescoFamiliar
          ? _value.parentescoFamiliar
          : parentescoFamiliar // ignore: cast_nullable_to_non_nullable
              as String,
      telefonoFamiliar: null == telefonoFamiliar
          ? _value.telefonoFamiliar
          : telefonoFamiliar // ignore: cast_nullable_to_non_nullable
              as String,
      diagnosticoIngreso: null == diagnosticoIngreso
          ? _value.diagnosticoIngreso
          : diagnosticoIngreso // ignore: cast_nullable_to_non_nullable
              as String,
      diagnosticoActual: null == diagnosticoActual
          ? _value.diagnosticoActual
          : diagnosticoActual // ignore: cast_nullable_to_non_nullable
              as String,
      peso: null == peso
          ? _value.peso
          : peso // ignore: cast_nullable_to_non_nullable
              as double,
      talla: null == talla
          ? _value.talla
          : talla // ignore: cast_nullable_to_non_nullable
              as int,
      cama: null == cama
          ? _value.cama
          : cama // ignore: cast_nullable_to_non_nullable
              as String,
      alergias: freezed == alergias
          ? _value.alergias
          : alergias // ignore: cast_nullable_to_non_nullable
              as String?,
      fechaFin: freezed == fechaFin
          ? _value.fechaFin
          : fechaFin // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      sala: null == sala
          ? _value.sala
          : sala // ignore: cast_nullable_to_non_nullable
              as Sala,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IngresoImplCopyWith<$Res> implements $IngresoCopyWith<$Res> {
  factory _$$IngresoImplCopyWith(
          _$IngresoImpl value, $Res Function(_$IngresoImpl) then) =
      __$$IngresoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String idIngreso,
      String nombrePaciente,
      DateTime? fechaNacimientoPaciente,
      String epsOArl,
      String identificacionPaciente,
      String carpeta,
      DateTime fechaIngreso,
      String nombreFamiliar,
      String parentescoFamiliar,
      String telefonoFamiliar,
      String diagnosticoIngreso,
      String diagnosticoActual,
      double peso,
      int talla,
      String cama,
      String? alergias,
      DateTime? fechaFin,
      Sala sala});
}

/// @nodoc
class __$$IngresoImplCopyWithImpl<$Res>
    extends _$IngresoCopyWithImpl<$Res, _$IngresoImpl>
    implements _$$IngresoImplCopyWith<$Res> {
  __$$IngresoImplCopyWithImpl(
      _$IngresoImpl _value, $Res Function(_$IngresoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idIngreso = null,
    Object? nombrePaciente = null,
    Object? fechaNacimientoPaciente = freezed,
    Object? epsOArl = null,
    Object? identificacionPaciente = null,
    Object? carpeta = null,
    Object? fechaIngreso = null,
    Object? nombreFamiliar = null,
    Object? parentescoFamiliar = null,
    Object? telefonoFamiliar = null,
    Object? diagnosticoIngreso = null,
    Object? diagnosticoActual = null,
    Object? peso = null,
    Object? talla = null,
    Object? cama = null,
    Object? alergias = freezed,
    Object? fechaFin = freezed,
    Object? sala = null,
  }) {
    return _then(_$IngresoImpl(
      idIngreso: null == idIngreso
          ? _value.idIngreso
          : idIngreso // ignore: cast_nullable_to_non_nullable
              as String,
      nombrePaciente: null == nombrePaciente
          ? _value.nombrePaciente
          : nombrePaciente // ignore: cast_nullable_to_non_nullable
              as String,
      fechaNacimientoPaciente: freezed == fechaNacimientoPaciente
          ? _value.fechaNacimientoPaciente
          : fechaNacimientoPaciente // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      epsOArl: null == epsOArl
          ? _value.epsOArl
          : epsOArl // ignore: cast_nullable_to_non_nullable
              as String,
      identificacionPaciente: null == identificacionPaciente
          ? _value.identificacionPaciente
          : identificacionPaciente // ignore: cast_nullable_to_non_nullable
              as String,
      carpeta: null == carpeta
          ? _value.carpeta
          : carpeta // ignore: cast_nullable_to_non_nullable
              as String,
      fechaIngreso: null == fechaIngreso
          ? _value.fechaIngreso
          : fechaIngreso // ignore: cast_nullable_to_non_nullable
              as DateTime,
      nombreFamiliar: null == nombreFamiliar
          ? _value.nombreFamiliar
          : nombreFamiliar // ignore: cast_nullable_to_non_nullable
              as String,
      parentescoFamiliar: null == parentescoFamiliar
          ? _value.parentescoFamiliar
          : parentescoFamiliar // ignore: cast_nullable_to_non_nullable
              as String,
      telefonoFamiliar: null == telefonoFamiliar
          ? _value.telefonoFamiliar
          : telefonoFamiliar // ignore: cast_nullable_to_non_nullable
              as String,
      diagnosticoIngreso: null == diagnosticoIngreso
          ? _value.diagnosticoIngreso
          : diagnosticoIngreso // ignore: cast_nullable_to_non_nullable
              as String,
      diagnosticoActual: null == diagnosticoActual
          ? _value.diagnosticoActual
          : diagnosticoActual // ignore: cast_nullable_to_non_nullable
              as String,
      peso: null == peso
          ? _value.peso
          : peso // ignore: cast_nullable_to_non_nullable
              as double,
      talla: null == talla
          ? _value.talla
          : talla // ignore: cast_nullable_to_non_nullable
              as int,
      cama: null == cama
          ? _value.cama
          : cama // ignore: cast_nullable_to_non_nullable
              as String,
      alergias: freezed == alergias
          ? _value.alergias
          : alergias // ignore: cast_nullable_to_non_nullable
              as String?,
      fechaFin: freezed == fechaFin
          ? _value.fechaFin
          : fechaFin // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      sala: null == sala
          ? _value.sala
          : sala // ignore: cast_nullable_to_non_nullable
              as Sala,
    ));
  }
}

/// @nodoc

class _$IngresoImpl implements _Ingreso {
  const _$IngresoImpl(
      {required this.idIngreso,
      required this.nombrePaciente,
      this.fechaNacimientoPaciente,
      required this.epsOArl,
      required this.identificacionPaciente,
      required this.carpeta,
      required this.fechaIngreso,
      required this.nombreFamiliar,
      required this.parentescoFamiliar,
      required this.telefonoFamiliar,
      required this.diagnosticoIngreso,
      required this.diagnosticoActual,
      required this.peso,
      required this.talla,
      required this.cama,
      this.alergias,
      this.fechaFin,
      required this.sala});

  @override
  final String idIngreso;
  @override
  final String nombrePaciente;
  @override
  final DateTime? fechaNacimientoPaciente;
  @override
  final String epsOArl;
  @override
  final String identificacionPaciente;
  @override
  final String carpeta;
  @override
  final DateTime fechaIngreso;
  @override
  final String nombreFamiliar;
  @override
  final String parentescoFamiliar;
  @override
  final String telefonoFamiliar;
  @override
  final String diagnosticoIngreso;
  @override
  final String diagnosticoActual;
  @override
  final double peso;
  @override
  final int talla;
  @override
  final String cama;
  @override
  final String? alergias;
  @override
  final DateTime? fechaFin;
  @override
  final Sala sala;

  @override
  String toString() {
    return 'Ingreso(idIngreso: $idIngreso, nombrePaciente: $nombrePaciente, fechaNacimientoPaciente: $fechaNacimientoPaciente, epsOArl: $epsOArl, identificacionPaciente: $identificacionPaciente, carpeta: $carpeta, fechaIngreso: $fechaIngreso, nombreFamiliar: $nombreFamiliar, parentescoFamiliar: $parentescoFamiliar, telefonoFamiliar: $telefonoFamiliar, diagnosticoIngreso: $diagnosticoIngreso, diagnosticoActual: $diagnosticoActual, peso: $peso, talla: $talla, cama: $cama, alergias: $alergias, fechaFin: $fechaFin, sala: $sala)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IngresoImpl &&
            (identical(other.idIngreso, idIngreso) ||
                other.idIngreso == idIngreso) &&
            (identical(other.nombrePaciente, nombrePaciente) ||
                other.nombrePaciente == nombrePaciente) &&
            (identical(
                    other.fechaNacimientoPaciente, fechaNacimientoPaciente) ||
                other.fechaNacimientoPaciente == fechaNacimientoPaciente) &&
            (identical(other.epsOArl, epsOArl) || other.epsOArl == epsOArl) &&
            (identical(other.identificacionPaciente, identificacionPaciente) ||
                other.identificacionPaciente == identificacionPaciente) &&
            (identical(other.carpeta, carpeta) || other.carpeta == carpeta) &&
            (identical(other.fechaIngreso, fechaIngreso) ||
                other.fechaIngreso == fechaIngreso) &&
            (identical(other.nombreFamiliar, nombreFamiliar) ||
                other.nombreFamiliar == nombreFamiliar) &&
            (identical(other.parentescoFamiliar, parentescoFamiliar) ||
                other.parentescoFamiliar == parentescoFamiliar) &&
            (identical(other.telefonoFamiliar, telefonoFamiliar) ||
                other.telefonoFamiliar == telefonoFamiliar) &&
            (identical(other.diagnosticoIngreso, diagnosticoIngreso) ||
                other.diagnosticoIngreso == diagnosticoIngreso) &&
            (identical(other.diagnosticoActual, diagnosticoActual) ||
                other.diagnosticoActual == diagnosticoActual) &&
            (identical(other.peso, peso) || other.peso == peso) &&
            (identical(other.talla, talla) || other.talla == talla) &&
            (identical(other.cama, cama) || other.cama == cama) &&
            (identical(other.alergias, alergias) ||
                other.alergias == alergias) &&
            (identical(other.fechaFin, fechaFin) ||
                other.fechaFin == fechaFin) &&
            (identical(other.sala, sala) || other.sala == sala));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      idIngreso,
      nombrePaciente,
      fechaNacimientoPaciente,
      epsOArl,
      identificacionPaciente,
      carpeta,
      fechaIngreso,
      nombreFamiliar,
      parentescoFamiliar,
      telefonoFamiliar,
      diagnosticoIngreso,
      diagnosticoActual,
      peso,
      talla,
      cama,
      alergias,
      fechaFin,
      sala);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IngresoImplCopyWith<_$IngresoImpl> get copyWith =>
      __$$IngresoImplCopyWithImpl<_$IngresoImpl>(this, _$identity);
}

abstract class _Ingreso implements Ingreso {
  const factory _Ingreso(
      {required final String idIngreso,
      required final String nombrePaciente,
      final DateTime? fechaNacimientoPaciente,
      required final String epsOArl,
      required final String identificacionPaciente,
      required final String carpeta,
      required final DateTime fechaIngreso,
      required final String nombreFamiliar,
      required final String parentescoFamiliar,
      required final String telefonoFamiliar,
      required final String diagnosticoIngreso,
      required final String diagnosticoActual,
      required final double peso,
      required final int talla,
      required final String cama,
      final String? alergias,
      final DateTime? fechaFin,
      required final Sala sala}) = _$IngresoImpl;

  @override
  String get idIngreso;
  @override
  String get nombrePaciente;
  @override
  DateTime? get fechaNacimientoPaciente;
  @override
  String get epsOArl;
  @override
  String get identificacionPaciente;
  @override
  String get carpeta;
  @override
  DateTime get fechaIngreso;
  @override
  String get nombreFamiliar;
  @override
  String get parentescoFamiliar;
  @override
  String get telefonoFamiliar;
  @override
  String get diagnosticoIngreso;
  @override
  String get diagnosticoActual;
  @override
  double get peso;
  @override
  int get talla;
  @override
  String get cama;
  @override
  String? get alergias;
  @override
  DateTime? get fechaFin;
  @override
  Sala get sala;
  @override
  @JsonKey(ignore: true)
  _$$IngresoImplCopyWith<_$IngresoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
