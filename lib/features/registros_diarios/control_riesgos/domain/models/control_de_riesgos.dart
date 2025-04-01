class ControlDeRiesgos {
  final String idControlDeRiesgos;
  final bool tieneUPP;
  final DateTime? fechaRegistroUlcera;
  final String? numeroReporteEA;
  final String? sitioUPP;
  final bool uppResuelta;
  final DateTime? fechaResolucion;
  final int? diasConUlceras;
  final String riesgoCaida;
  final String? numeroReporteCaida;
  final bool usaAnticoagulantes;
  final String? anticoagulanteSeleccionado;
  final bool enAislamiento;
  final DateTime? fechaInicioAislamiento;
  final String? tipoAislamiento;
  final String? agenteAislamiento;
  final DateTime? fechaFinAislamiento;
  final int? diasDeAislamiento;
  final DateTime? fechaRegistro;
  // Agrega estos nuevos campos
  final int? controlUPPManana;
  final int? controlUPPTarde;
  final int? controlUPPNoche;
  final int? controlCaidaManana;
  final int? controlCaidaTarde;
  final int? controlCaidaNoche;

  ControlDeRiesgos({
    required this.idControlDeRiesgos,
    required this.tieneUPP,
    this.fechaRegistroUlcera,
    this.numeroReporteEA,
    this.sitioUPP,
    required this.uppResuelta,
    this.fechaResolucion,
    this.diasConUlceras,
    required this.riesgoCaida,
    this.numeroReporteCaida,
    required this.usaAnticoagulantes,
    this.anticoagulanteSeleccionado,
    required this.enAislamiento,
    this.fechaInicioAislamiento,
    this.tipoAislamiento,
    this.agenteAislamiento,
    this.fechaFinAislamiento,
    this.diasDeAislamiento,
    this.fechaRegistro,
    // Agrega estos nuevos parámetros al constructor
    this.controlUPPManana,
    this.controlUPPTarde,
    this.controlUPPNoche,
    this.controlCaidaManana,
    this.controlCaidaTarde,
    this.controlCaidaNoche,
  });

  // Asegúrate de actualizar también los métodos toJson y fromJson
  Map<String, dynamic> toJson() {
    return {
      'tieneUPP': tieneUPP,
      'fechaRegistroUlcera': fechaRegistroUlcera?.toIso8601String(),
      'numeroReporteEA': numeroReporteEA,
      'sitioUPP': sitioUPP,
      'uppResuelta': uppResuelta,
      'fechaResolucion': fechaResolucion?.toIso8601String(),
      'diasConUlceras': diasConUlceras,
      'riesgoCaida': riesgoCaida,
      'numeroReporteCaida': numeroReporteCaida,
      'usaAnticoagulantes': usaAnticoagulantes,
      'anticoagulanteSeleccionado': anticoagulanteSeleccionado,
      'enAislamiento': enAislamiento,
      'fechaInicioAislamiento': fechaInicioAislamiento?.toIso8601String(),
      'tipoAislamiento': tipoAislamiento,
      'agenteAislamiento': agenteAislamiento,
      'fechaFinAislamiento': fechaFinAislamiento?.toIso8601String(),
      'diasDeAislamiento': diasDeAislamiento,
      'fechaRegistro': fechaRegistro?.toIso8601String(),
      // Agrega los nuevos campos al JSON
      'controlUPPManana': controlUPPManana,
      'controlUPPTarde': controlUPPTarde,
      'controlUPPNoche': controlUPPNoche,
      'controlCaidaManana': controlCaidaManana,
      'controlCaidaTarde': controlCaidaTarde,
      'controlCaidaNoche': controlCaidaNoche,
    };
  }

  factory ControlDeRiesgos.fromJson(Map<String, dynamic> json,
      {required String id}) {
    return ControlDeRiesgos(
      idControlDeRiesgos: id,
      tieneUPP: json['tieneUPP'] as bool,
      fechaRegistroUlcera: json['fechaRegistroUlcera'] != null
          ? DateTime.parse(json['fechaRegistroUlcera'])
          : null,
      numeroReporteEA: json['numeroReporteEA'] as String?,
      sitioUPP: json['sitioUPP'] as String?,
      uppResuelta: json['uppResuelta'] as bool,
      fechaResolucion: json['fechaResolucion'] != null
          ? DateTime.parse(json['fechaResolucion'])
          : null,
      diasConUlceras: json['diasConUlceras'] as int?,
      riesgoCaida: json['riesgoCaida'] as String,
      numeroReporteCaida: json['numeroReporteCaida'] as String?,
      usaAnticoagulantes: json['usaAnticoagulantes'] as bool,
      anticoagulanteSeleccionado: json['anticoagulanteSeleccionado'] as String?,
      enAislamiento: json['enAislamiento'] as bool,
      fechaInicioAislamiento: json['fechaInicioAislamiento'] != null
          ? DateTime.parse(json['fechaInicioAislamiento'])
          : null,
      tipoAislamiento: json['tipoAislamiento'] as String?,
      agenteAislamiento: json['agenteAislamiento'] as String?,
      fechaFinAislamiento: json['fechaFinAislamiento'] != null
          ? DateTime.parse(json['fechaFinAislamiento'])
          : null,
      diasDeAislamiento: json['diasDeAislamiento'] as int?,
      fechaRegistro: json['fechaRegistro'] != null
          ? DateTime.parse(json['fechaRegistro'])
          : null,
      // Agrega los nuevos campos al fromJson
      controlUPPManana: json['controlUPPManana'] as int?,
      controlUPPTarde: json['controlUPPTarde'] as int?,
      controlUPPNoche: json['controlUPPNoche'] as int?,
      controlCaidaManana: json['controlCaidaManana'] as int?,
      controlCaidaTarde: json['controlCaidaTarde'] as int?,
      controlCaidaNoche: json['controlCaidaNoche'] as int?,
    );
  }
}
