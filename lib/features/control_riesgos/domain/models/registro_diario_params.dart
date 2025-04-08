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

  // Método para convertir el objeto a un Map (serialización)
  Map<String, dynamic> toJson() {
    return {
      'idIngreso': idIngreso,
      'idRegistro': idRegistro,
      'completed': completed,
      'tieneUPP': tieneUPP,
      'uppResuelta': uppResuelta,
      'eventoCaida': eventoCaida,
      'usaAnticoagulantes': usaAnticoagulantes,
      'enAislamiento': enAislamiento,
      'numeroReporteEA': numeroReporteEA,
      'numeroReporteCaida': numeroReporteCaida,
      'sitioUPP': sitioUPP,
      'anticoagulanteSeleccionado': anticoagulanteSeleccionado,
      'agenteAislamiento': agenteAislamiento,
      'fechaRegistroUlcera': fechaRegistroUlcera?.toIso8601String(),
      'fechaResolucion': fechaResolucion?.toIso8601String(),
      'fechaInicioAislamiento': fechaInicioAislamiento?.toIso8601String(),
      'fechaFinAislamiento': fechaFinAislamiento?.toIso8601String(),
    };
  }

  // Método para crear una instancia desde un Map (deserialización)
  factory RegistroDiarioParams.fromJson(Map<String, dynamic> json) {
    return RegistroDiarioParams(
      idIngreso: json['idIngreso'] as String,
      idRegistro: json['idRegistro'] as String,
      completed: json['completed'] as bool,
      tieneUPP: json['tieneUPP'] as bool,
      uppResuelta: json['uppResuelta'] as bool,
      eventoCaida: json['eventoCaida'] as bool,
      usaAnticoagulantes: json['usaAnticoagulantes'] as bool,
      enAislamiento: json['enAislamiento'] as bool,
      numeroReporteEA: json['numeroReporteEA'] as String,
      numeroReporteCaida: json['numeroReporteCaida'] as String,
      sitioUPP: json['sitioUPP'] as String,
      anticoagulanteSeleccionado: json['anticoagulanteSeleccionado'] as String,
      agenteAislamiento: json['agenteAislamiento'] as String,
      fechaRegistroUlcera: json['fechaRegistroUlcera'] != null
          ? DateTime.parse(json['fechaRegistroUlcera'])
          : null,
      fechaResolucion: json['fechaResolucion'] != null
          ? DateTime.parse(json['fechaResolucion'])
          : null,
      fechaInicioAislamiento: json['fechaInicioAislamiento'] != null
          ? DateTime.parse(json['fechaInicioAislamiento'])
          : null,
      fechaFinAislamiento: json['fechaFinAislamiento'] != null
          ? DateTime.parse(json['fechaFinAislamiento'])
          : null,
    );
  }
}
