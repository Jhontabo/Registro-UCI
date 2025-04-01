import 'package:flutter/foundation.dart';

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

  // **Añadir esta línea para la fecha de creación**
  final DateTime? fechaRegistro; // Nueva propiedad para la fecha de creación

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
    this.fechaRegistro, // Nueva propiedad en el constructor
  });

  // Método para crear una instancia desde un Map (deserialización)
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
      // Añadir el parsing de la nueva propiedad fechaRegistro
      fechaRegistro: json['fechaRegistro'] != null
          ? DateTime.parse(json['fechaRegistro'])
          : null,
    );
  }

  // Método para convertir la instancia a un Map (serialización)
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
      // Añadir la serialización de la nueva propiedad fechaRegistro
      'fechaRegistro': fechaRegistro?.toIso8601String(),
    };
  }
}
