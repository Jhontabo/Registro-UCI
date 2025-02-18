import "dart:collection";
import "package:registro_uci/features/ingresos/data/constants/strings.dart";

class CreateIngresoDto extends MapView<String, dynamic> {
  final String nombrePaciente;
  final String sala;
  final DateTime? fechaNacimientoPaciente;
  final String epsOArl;
  final String identificacionPaciente;
  final String carpeta;
  final DateTime fechaIngreso; // do not include in form
  final String nombreFamiliar;
  final String parentescoFamiliar;
  final String telefonoFamiliar;
  final String diagnosticoIngreso;
  final String diagnosticoActual;
  final int peso;
  final int talla;
  final String cama;
  final String? alergias;
  final String selectedEpsArl; // ✅ Agregando la propiedad faltante

  CreateIngresoDto({
    required this.nombrePaciente,
    required this.fechaNacimientoPaciente,
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
    required this.alergias,
    required this.sala,
    required this.selectedEpsArl, // ✅ Agregando en el constructor
  }) : super({
          Strings.nombrePaciente: nombrePaciente,
          Strings.fechaNacimientoPaciente: fechaNacimientoPaciente,
          Strings.epsOArl: epsOArl,
          Strings.identificacionPaciente: identificacionPaciente,
          Strings.carpeta: carpeta,
          Strings.fechaIngreso: fechaIngreso,
          Strings.nombreFamiliar: nombreFamiliar,
          Strings.parentescoFamiliar: parentescoFamiliar,
          Strings.telefonoFamiliar: telefonoFamiliar,
          Strings.diagnosticoIngreso: diagnosticoIngreso,
          Strings.diagnosticoActual: diagnosticoActual,
          Strings.peso: peso,
          Strings.talla: talla,
          Strings.cama: cama,
          Strings.alergias: alergias,
          Strings.sala: sala,
          Strings.selectedEpsArl: selectedEpsArl, // ✅ Agregando en el mapa
        });
}
