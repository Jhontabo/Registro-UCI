import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:registro_uci/features/ingresos/data/constants/strings.dart';

part 'ingreso.freezed.dart';

// Enum for 'Sala'
enum Sala { A, B, C, D }

@freezed
class Ingreso with _$Ingreso {
  const factory Ingreso({
    required String idIngreso,
    required String nombrePaciente,
    DateTime? fechaNacimientoPaciente,
    required String epsOArl,
    required String identificacionPaciente,
    required String carpeta,
    required DateTime fechaIngreso,
    required String nombreFamiliar,
    required String parentescoFamiliar,
    required String telefonoFamiliar,
    required String diagnosticoIngreso,
    required String diagnosticoActual,
    required double peso,
    required int talla,
    required String cama,
    String? alergias,
    DateTime? fechaFin,
    required Sala sala, // New enum property
  }) = _Ingreso;

  factory Ingreso.fromJson(Map<String, dynamic> json, {required String id}) {
    return Ingreso(
      idIngreso: id,
      nombrePaciente: json[Strings.nombrePaciente] as String,
      fechaNacimientoPaciente: json[Strings.fechaNacimientoPaciente] != null
          ? (json[Strings.fechaNacimientoPaciente] as Timestamp).toDate()
          : null,
      epsOArl: json[Strings.epsOArl] as String,
      identificacionPaciente: json[Strings.identificacionPaciente] as String,
      carpeta: json[Strings.carpeta] as String,
      fechaIngreso: (json[Strings.fechaIngreso] as Timestamp).toDate(),
      nombreFamiliar: json[Strings.nombreFamiliar] as String,
      parentescoFamiliar: json[Strings.parentescoFamiliar] as String,
      telefonoFamiliar: json[Strings.telefonoFamiliar] as String,
      diagnosticoIngreso: json[Strings.diagnosticoIngreso] as String,
      diagnosticoActual: json[Strings.diagnosticoActual] as String,
      peso: (json[Strings.peso] as num).toDouble(),
      talla: json[Strings.talla] as int,
      cama: json[Strings.cama] as String,
      alergias: json[Strings.alergias] as String?,
      fechaFin: json[Strings.fechaFin] != null
          ? (json[Strings.fechaFin] as Timestamp).toDate()
          : null,
      sala: (json[Strings.sala] as String)
          .toSala(), // Convert from string to enum
    );
  }
}

extension ToSala on String {
  Sala toSala() {
    switch (this) {
      case 'A':
        return Sala.A;
      case 'B':
        return Sala.B;
      case 'C':
        return Sala.C;
      case 'D':
        return Sala.D;
      default:
        throw Exception('Invalid Sala value');
    }
  }
}

extension SalaToString on Sala {
  String salaToString() {
    switch (this) {
      case Sala.A:
        return 'A';
      case Sala.B:
        return 'B';
      case Sala.C:
        return 'C';
      case Sala.D:
        return 'D';
    }
  }
}
