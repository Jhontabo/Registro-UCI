import "dart:collection";

import "package:registro_uci/features/ingresos/data/constants/strings.dart";

class UpdateIngresoDto extends MapView<String, dynamic> {
  final String? nombrePaciente;
  final DateTime? fechaNacimientoPaciente;
  final String? epsOArl;
  final String? identificacionPaciente;
  final String? carpeta;
  final String? nombreFamiliar;
  final String? parentescoFamiliar;
  final String? telefonoFamiliar;
  final String? diagnosticoIngreso;
  final String? diagnosticoActual;
  final int? peso;
  final int? talla;
  final String? cama;
  final String? alergias;
  final String? sala;

  UpdateIngresoDto({
    this.nombrePaciente,
    this.fechaNacimientoPaciente,
    this.epsOArl,
    this.identificacionPaciente,
    this.carpeta,
    this.nombreFamiliar,
    this.parentescoFamiliar,
    this.telefonoFamiliar,
    this.diagnosticoIngreso,
    this.diagnosticoActual,
    this.peso,
    this.talla,
    this.cama,
    this.alergias,
    this.sala,
  }) : super({
          if (nombrePaciente != null) Strings.nombrePaciente: nombrePaciente,
          if (fechaNacimientoPaciente != null)
            Strings.fechaNacimientoPaciente: fechaNacimientoPaciente,
          if (epsOArl != null) Strings.epsOArl: epsOArl,
          if (identificacionPaciente != null)
            Strings.identificacionPaciente: identificacionPaciente,
          if (carpeta != null) Strings.carpeta: carpeta,
          if (nombreFamiliar != null) Strings.nombreFamiliar: nombreFamiliar,
          if (parentescoFamiliar != null)
            Strings.parentescoFamiliar: parentescoFamiliar,
          if (telefonoFamiliar != null)
            Strings.telefonoFamiliar: telefonoFamiliar,
          if (diagnosticoIngreso != null)
            Strings.diagnosticoIngreso: diagnosticoIngreso,
          if (diagnosticoActual != null)
            Strings.diagnosticoActual: diagnosticoActual,
          if (peso != null) Strings.peso: peso,
          if (talla != null) Strings.talla: talla,
          if (cama != null) Strings.cama: cama,
          if (alergias != null) Strings.alergias: alergias,
          if (sala != null) Strings.sala: sala,
        });
}
