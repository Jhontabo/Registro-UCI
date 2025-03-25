// registro_diario_params.dart
class RegistroDiarioParams {
  final String idIngreso;
  final String idRegistro;
  final bool completed;
  final bool tieneUPP;
  final bool uppResuelta;
  final bool eventoCaida;
  final bool usaAnticoagulantes;
  final bool enAislamiento;
  final String numeroReporteEA;
  final String numeroReporteCaida;
  final String sitioUPP;
  final String anticoagulanteSeleccionado;
  final String agenteAislamiento;
  final DateTime? fechaRegistroUlcera;
  final DateTime? fechaResolucion;
  final DateTime? fechaInicioAislamiento;
  final DateTime? fechaFinAislamiento;

  RegistroDiarioParams({
    required this.idIngreso,
    required this.idRegistro,
    required this.completed,
    required this.tieneUPP,
    required this.uppResuelta,
    required this.eventoCaida,
    required this.usaAnticoagulantes,
    required this.enAislamiento,
    required this.numeroReporteEA,
    required this.numeroReporteCaida,
    required this.sitioUPP,
    required this.anticoagulanteSeleccionado,
    required this.agenteAislamiento,
    this.fechaRegistroUlcera,
    this.fechaResolucion,
    this.fechaInicioAislamiento,
    this.fechaFinAislamiento,
  });
}
