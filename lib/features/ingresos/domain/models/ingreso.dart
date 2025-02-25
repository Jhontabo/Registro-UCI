import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:registro_uci/features/ingresos/data/constants/strings.dart';

part 'ingreso.freezed.dart';

// Enum para 'Sala'
enum Sala { A, B, C, D }

@freezed
class Ingreso with _$Ingreso {
  const factory Ingreso({
    required String idIngreso,
    // ✅ Se agregó idIngreso correctamente
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
    required Sala sala,
  }) = _Ingreso;

  factory Ingreso.fromJson(Map<String, dynamic> json, {required String id}) {
    return Ingreso(
      idIngreso: id, // ✅ Se usa el ID que se pasa en la función
      nombrePaciente: json[Strings.nombrePaciente] as String? ?? "Desconocido",
      fechaNacimientoPaciente: json[Strings.fechaNacimientoPaciente] != null
          ? (json[Strings.fechaNacimientoPaciente] as Timestamp).toDate()
          : null,
      epsOArl: json[Strings.epsOArl] as String? ?? "No especificado",
      identificacionPaciente:
          json[Strings.identificacionPaciente] as String? ?? "",
      carpeta: json[Strings.carpeta] as String? ?? "",
      fechaIngreso: (json[Strings.fechaIngreso] as Timestamp?)?.toDate() ??
          DateTime.now(),
      nombreFamiliar:
          json[Strings.nombreFamiliar] as String? ?? "No registrado",
      parentescoFamiliar:
          json[Strings.parentescoFamiliar] as String? ?? "No registrado",
      telefonoFamiliar:
          json[Strings.telefonoFamiliar] as String? ?? "No registrado",
      diagnosticoIngreso:
          json[Strings.diagnosticoIngreso] as String? ?? "No disponible",
      diagnosticoActual:
          json[Strings.diagnosticoActual] as String? ?? "No disponible",
      peso: (json[Strings.peso] as num?)?.toDouble() ?? 0.0,
      talla: json[Strings.talla] as int? ?? 0,
      cama: json[Strings.cama] as String? ?? "No asignada",
      alergias: json[Strings.alergias] as String?,
      fechaFin: json[Strings.fechaFin] != null
          ? (json[Strings.fechaFin] as Timestamp).toDate()
          : null,
      sala: json[Strings.sala] != null
          ? (json[Strings.sala] as String).toSala()
          : Sala.A, // Valor por defecto si es null
    );
  }
}

// Extensión para convertir String a Enum Sala
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
        throw Exception('Valor inválido para Sala');
    }
  }
}

// Extensión para convertir Enum Sala a String
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
