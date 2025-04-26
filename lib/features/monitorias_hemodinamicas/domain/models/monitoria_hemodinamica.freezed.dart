// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'monitoria_hemodinamica.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MonitoriaHemodinamica {
  String get idMonitoria => throw _privateConstructorUsedError;
  int get hora => throw _privateConstructorUsedError;
  int get orden => throw _privateConstructorUsedError;
  int? get pas =>
      throw _privateConstructorUsedError; // Presión arterial sistólica
  int? get pad =>
      throw _privateConstructorUsedError; // Presión arterial diastólica
  int? get pam =>
      throw _privateConstructorUsedError; // Presión arterial media (Fórmula: (2pad + 1pas)/3)
  int? get fc =>
      throw _privateConstructorUsedError; // Frecuencia cardiaca (ppm)
  int? get fr =>
      throw _privateConstructorUsedError; // Frecuencia respiratoria (rpm)
  double? get t => throw _privateConstructorUsedError; // Temperatura (°C)
  int? get pvc => throw _privateConstructorUsedError; // presion venosa central
  int? get rvc =>
      throw _privateConstructorUsedError; // Resistencia vascular sistemica
  int? get fio2 =>
      throw _privateConstructorUsedError; // Fracción de Oxígeno Inspirado (%)
  int? get pia =>
      throw _privateConstructorUsedError; // Presión intraabdominal (mm H2O)
  int? get ppa =>
      throw _privateConstructorUsedError; // Presión de Perfusión arterial (mm Hg)
  int? get pic =>
      throw _privateConstructorUsedError; // Presión intracraneal (mm Hg)
  int? get ppc =>
      throw _privateConstructorUsedError; // Presión de Perfusión cerebral (mm Hg)
  int? get glucometria =>
      throw _privateConstructorUsedError; // Glucometría (mg/dL)
  int? get insulina =>
      throw _privateConstructorUsedError; // Insulina (Unidades)
  int? get saturacion => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MonitoriaHemodinamicaCopyWith<MonitoriaHemodinamica> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonitoriaHemodinamicaCopyWith<$Res> {
  factory $MonitoriaHemodinamicaCopyWith(MonitoriaHemodinamica value,
          $Res Function(MonitoriaHemodinamica) then) =
      _$MonitoriaHemodinamicaCopyWithImpl<$Res, MonitoriaHemodinamica>;
  @useResult
  $Res call(
      {String idMonitoria,
      int hora,
      int orden,
      int? pas,
      int? pad,
      int? pam,
      int? fc,
      int? fr,
      double? t,
      int? pvc,
      int? rvc,
      int? fio2,
      int? pia,
      int? ppa,
      int? pic,
      int? ppc,
      int? glucometria,
      int? insulina,
      int? saturacion});
}

/// @nodoc
class _$MonitoriaHemodinamicaCopyWithImpl<$Res,
        $Val extends MonitoriaHemodinamica>
    implements $MonitoriaHemodinamicaCopyWith<$Res> {
  _$MonitoriaHemodinamicaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idMonitoria = null,
    Object? hora = null,
    Object? orden = null,
    Object? pas = freezed,
    Object? pad = freezed,
    Object? pam = freezed,
    Object? fc = freezed,
    Object? fr = freezed,
    Object? t = freezed,
    Object? pvc = freezed,
    Object? rvc = freezed,
    Object? fio2 = freezed,
    Object? pia = freezed,
    Object? ppa = freezed,
    Object? pic = freezed,
    Object? ppc = freezed,
    Object? glucometria = freezed,
    Object? insulina = freezed,
    Object? saturacion = freezed,
  }) {
    return _then(_value.copyWith(
      idMonitoria: null == idMonitoria
          ? _value.idMonitoria
          : idMonitoria // ignore: cast_nullable_to_non_nullable
              as String,
      hora: null == hora
          ? _value.hora
          : hora // ignore: cast_nullable_to_non_nullable
              as int,
      orden: null == orden
          ? _value.orden
          : orden // ignore: cast_nullable_to_non_nullable
              as int,
      pas: freezed == pas
          ? _value.pas
          : pas // ignore: cast_nullable_to_non_nullable
              as int?,
      pad: freezed == pad
          ? _value.pad
          : pad // ignore: cast_nullable_to_non_nullable
              as int?,
      pam: freezed == pam
          ? _value.pam
          : pam // ignore: cast_nullable_to_non_nullable
              as int?,
      fc: freezed == fc
          ? _value.fc
          : fc // ignore: cast_nullable_to_non_nullable
              as int?,
      fr: freezed == fr
          ? _value.fr
          : fr // ignore: cast_nullable_to_non_nullable
              as int?,
      t: freezed == t
          ? _value.t
          : t // ignore: cast_nullable_to_non_nullable
              as double?,
      pvc: freezed == pvc
          ? _value.pvc
          : pvc // ignore: cast_nullable_to_non_nullable
              as int?,
      rvc: freezed == rvc
          ? _value.rvc
          : rvc // ignore: cast_nullable_to_non_nullable
              as int?,
      fio2: freezed == fio2
          ? _value.fio2
          : fio2 // ignore: cast_nullable_to_non_nullable
              as int?,
      pia: freezed == pia
          ? _value.pia
          : pia // ignore: cast_nullable_to_non_nullable
              as int?,
      ppa: freezed == ppa
          ? _value.ppa
          : ppa // ignore: cast_nullable_to_non_nullable
              as int?,
      pic: freezed == pic
          ? _value.pic
          : pic // ignore: cast_nullable_to_non_nullable
              as int?,
      ppc: freezed == ppc
          ? _value.ppc
          : ppc // ignore: cast_nullable_to_non_nullable
              as int?,
      glucometria: freezed == glucometria
          ? _value.glucometria
          : glucometria // ignore: cast_nullable_to_non_nullable
              as int?,
      insulina: freezed == insulina
          ? _value.insulina
          : insulina // ignore: cast_nullable_to_non_nullable
              as int?,
      saturacion: freezed == saturacion
          ? _value.saturacion
          : saturacion // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MonitoriaHemodinamicaImplCopyWith<$Res>
    implements $MonitoriaHemodinamicaCopyWith<$Res> {
  factory _$$MonitoriaHemodinamicaImplCopyWith(
          _$MonitoriaHemodinamicaImpl value,
          $Res Function(_$MonitoriaHemodinamicaImpl) then) =
      __$$MonitoriaHemodinamicaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String idMonitoria,
      int hora,
      int orden,
      int? pas,
      int? pad,
      int? pam,
      int? fc,
      int? fr,
      double? t,
      int? pvc,
      int? rvc,
      int? fio2,
      int? pia,
      int? ppa,
      int? pic,
      int? ppc,
      int? glucometria,
      int? insulina,
      int? saturacion});
}

/// @nodoc
class __$$MonitoriaHemodinamicaImplCopyWithImpl<$Res>
    extends _$MonitoriaHemodinamicaCopyWithImpl<$Res,
        _$MonitoriaHemodinamicaImpl>
    implements _$$MonitoriaHemodinamicaImplCopyWith<$Res> {
  __$$MonitoriaHemodinamicaImplCopyWithImpl(_$MonitoriaHemodinamicaImpl _value,
      $Res Function(_$MonitoriaHemodinamicaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idMonitoria = null,
    Object? hora = null,
    Object? orden = null,
    Object? pas = freezed,
    Object? pad = freezed,
    Object? pam = freezed,
    Object? fc = freezed,
    Object? fr = freezed,
    Object? t = freezed,
    Object? pvc = freezed,
    Object? rvc = freezed,
    Object? fio2 = freezed,
    Object? pia = freezed,
    Object? ppa = freezed,
    Object? pic = freezed,
    Object? ppc = freezed,
    Object? glucometria = freezed,
    Object? insulina = freezed,
    Object? saturacion = freezed,
  }) {
    return _then(_$MonitoriaHemodinamicaImpl(
      idMonitoria: null == idMonitoria
          ? _value.idMonitoria
          : idMonitoria // ignore: cast_nullable_to_non_nullable
              as String,
      hora: null == hora
          ? _value.hora
          : hora // ignore: cast_nullable_to_non_nullable
              as int,
      orden: null == orden
          ? _value.orden
          : orden // ignore: cast_nullable_to_non_nullable
              as int,
      pas: freezed == pas
          ? _value.pas
          : pas // ignore: cast_nullable_to_non_nullable
              as int?,
      pad: freezed == pad
          ? _value.pad
          : pad // ignore: cast_nullable_to_non_nullable
              as int?,
      pam: freezed == pam
          ? _value.pam
          : pam // ignore: cast_nullable_to_non_nullable
              as int?,
      fc: freezed == fc
          ? _value.fc
          : fc // ignore: cast_nullable_to_non_nullable
              as int?,
      fr: freezed == fr
          ? _value.fr
          : fr // ignore: cast_nullable_to_non_nullable
              as int?,
      t: freezed == t
          ? _value.t
          : t // ignore: cast_nullable_to_non_nullable
              as double?,
      pvc: freezed == pvc
          ? _value.pvc
          : pvc // ignore: cast_nullable_to_non_nullable
              as int?,
      rvc: freezed == rvc
          ? _value.rvc
          : rvc // ignore: cast_nullable_to_non_nullable
              as int?,
      fio2: freezed == fio2
          ? _value.fio2
          : fio2 // ignore: cast_nullable_to_non_nullable
              as int?,
      pia: freezed == pia
          ? _value.pia
          : pia // ignore: cast_nullable_to_non_nullable
              as int?,
      ppa: freezed == ppa
          ? _value.ppa
          : ppa // ignore: cast_nullable_to_non_nullable
              as int?,
      pic: freezed == pic
          ? _value.pic
          : pic // ignore: cast_nullable_to_non_nullable
              as int?,
      ppc: freezed == ppc
          ? _value.ppc
          : ppc // ignore: cast_nullable_to_non_nullable
              as int?,
      glucometria: freezed == glucometria
          ? _value.glucometria
          : glucometria // ignore: cast_nullable_to_non_nullable
              as int?,
      insulina: freezed == insulina
          ? _value.insulina
          : insulina // ignore: cast_nullable_to_non_nullable
              as int?,
      saturacion: freezed == saturacion
          ? _value.saturacion
          : saturacion // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$MonitoriaHemodinamicaImpl implements _MonitoriaHemodinamica {
  const _$MonitoriaHemodinamicaImpl(
      {required this.idMonitoria,
      required this.hora,
      required this.orden,
      this.pas,
      this.pad,
      this.pam,
      this.fc,
      this.fr,
      this.t,
      this.pvc,
      this.rvc,
      this.fio2,
      this.pia,
      this.ppa,
      this.pic,
      this.ppc,
      this.glucometria,
      this.insulina,
      this.saturacion});

  @override
  final String idMonitoria;
  @override
  final int hora;
  @override
  final int orden;
  @override
  final int? pas;
// Presión arterial sistólica
  @override
  final int? pad;
// Presión arterial diastólica
  @override
  final int? pam;
// Presión arterial media (Fórmula: (2pad + 1pas)/3)
  @override
  final int? fc;
// Frecuencia cardiaca (ppm)
  @override
  final int? fr;
// Frecuencia respiratoria (rpm)
  @override
  final double? t;
// Temperatura (°C)
  @override
  final int? pvc;
// presion venosa central
  @override
  final int? rvc;
// Resistencia vascular sistemica
  @override
  final int? fio2;
// Fracción de Oxígeno Inspirado (%)
  @override
  final int? pia;
// Presión intraabdominal (mm H2O)
  @override
  final int? ppa;
// Presión de Perfusión arterial (mm Hg)
  @override
  final int? pic;
// Presión intracraneal (mm Hg)
  @override
  final int? ppc;
// Presión de Perfusión cerebral (mm Hg)
  @override
  final int? glucometria;
// Glucometría (mg/dL)
  @override
  final int? insulina;
// Insulina (Unidades)
  @override
  final int? saturacion;

  @override
  String toString() {
    return 'MonitoriaHemodinamica(idMonitoria: $idMonitoria, hora: $hora, orden: $orden, pas: $pas, pad: $pad, pam: $pam, fc: $fc, fr: $fr, t: $t, pvc: $pvc, rvc: $rvc, fio2: $fio2, pia: $pia, ppa: $ppa, pic: $pic, ppc: $ppc, glucometria: $glucometria, insulina: $insulina, saturacion: $saturacion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonitoriaHemodinamicaImpl &&
            (identical(other.idMonitoria, idMonitoria) ||
                other.idMonitoria == idMonitoria) &&
            (identical(other.hora, hora) || other.hora == hora) &&
            (identical(other.orden, orden) || other.orden == orden) &&
            (identical(other.pas, pas) || other.pas == pas) &&
            (identical(other.pad, pad) || other.pad == pad) &&
            (identical(other.pam, pam) || other.pam == pam) &&
            (identical(other.fc, fc) || other.fc == fc) &&
            (identical(other.fr, fr) || other.fr == fr) &&
            (identical(other.t, t) || other.t == t) &&
            (identical(other.pvc, pvc) || other.pvc == pvc) &&
            (identical(other.rvc, rvc) || other.rvc == rvc) &&
            (identical(other.fio2, fio2) || other.fio2 == fio2) &&
            (identical(other.pia, pia) || other.pia == pia) &&
            (identical(other.ppa, ppa) || other.ppa == ppa) &&
            (identical(other.pic, pic) || other.pic == pic) &&
            (identical(other.ppc, ppc) || other.ppc == ppc) &&
            (identical(other.glucometria, glucometria) ||
                other.glucometria == glucometria) &&
            (identical(other.insulina, insulina) ||
                other.insulina == insulina) &&
            (identical(other.saturacion, saturacion) ||
                other.saturacion == saturacion));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        idMonitoria,
        hora,
        orden,
        pas,
        pad,
        pam,
        fc,
        fr,
        t,
        pvc,
        rvc,
        fio2,
        pia,
        ppa,
        pic,
        ppc,
        glucometria,
        insulina,
        saturacion
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MonitoriaHemodinamicaImplCopyWith<_$MonitoriaHemodinamicaImpl>
      get copyWith => __$$MonitoriaHemodinamicaImplCopyWithImpl<
          _$MonitoriaHemodinamicaImpl>(this, _$identity);
}

abstract class _MonitoriaHemodinamica implements MonitoriaHemodinamica {
  const factory _MonitoriaHemodinamica(
      {required final String idMonitoria,
      required final int hora,
      required final int orden,
      final int? pas,
      final int? pad,
      final int? pam,
      final int? fc,
      final int? fr,
      final double? t,
      final int? pvc,
      final int? rvc,
      final int? fio2,
      final int? pia,
      final int? ppa,
      final int? pic,
      final int? ppc,
      final int? glucometria,
      final int? insulina,
      final int? saturacion}) = _$MonitoriaHemodinamicaImpl;

  @override
  String get idMonitoria;
  @override
  int get hora;
  @override
  int get orden;
  @override
  int? get pas;
  @override // Presión arterial sistólica
  int? get pad;
  @override // Presión arterial diastólica
  int? get pam;
  @override // Presión arterial media (Fórmula: (2pad + 1pas)/3)
  int? get fc;
  @override // Frecuencia cardiaca (ppm)
  int? get fr;
  @override // Frecuencia respiratoria (rpm)
  double? get t;
  @override // Temperatura (°C)
  int? get pvc;
  @override // presion venosa central
  int? get rvc;
  @override // Resistencia vascular sistemica
  int? get fio2;
  @override // Fracción de Oxígeno Inspirado (%)
  int? get pia;
  @override // Presión intraabdominal (mm H2O)
  int? get ppa;
  @override // Presión de Perfusión arterial (mm Hg)
  int? get pic;
  @override // Presión intracraneal (mm Hg)
  int? get ppc;
  @override // Presión de Perfusión cerebral (mm Hg)
  int? get glucometria;
  @override // Glucometría (mg/dL)
  int? get insulina;
  @override // Insulina (Unidades)
  int? get saturacion;
  @override
  @JsonKey(ignore: true)
  _$$MonitoriaHemodinamicaImplCopyWith<_$MonitoriaHemodinamicaImpl>
      get copyWith => throw _privateConstructorUsedError;
}
