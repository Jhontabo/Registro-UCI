class Marcapaso {
  final String id;
  final String idIngreso;
  final String fechaColocacion;
  final String modo;
  final String via;
  final int frecuencia;
  final double sensibilidad;
  final double salida;

  Marcapaso({
    required this.id,
    required this.idIngreso,
    required this.fechaColocacion,
    required this.modo,
    required this.via,
    required this.frecuencia,
    required this.sensibilidad,
    required this.salida,
  });

  factory Marcapaso.fromJson(Map<String, dynamic> json) {
    return Marcapaso(
      id: json['id'] ?? '',
      idIngreso: json['idIngreso'] ?? '',
      fechaColocacion: json['fechaColocacion'] ?? '',
      modo: json['modo'] ?? 'Desconocido',
      via: json['via'] ?? 'Desconocida',
      frecuencia: json['frecuencia'] ?? 0,
      sensibilidad: (json['sensibilidad'] as num?)?.toDouble() ?? 0.0,
      salida: (json['salida'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "idIngreso": idIngreso,
      "fechaColocacion": fechaColocacion,
      "modo": modo,
      "via": via,
      "frecuencia": frecuencia,
      "sensibilidad": sensibilidad,
      "salida": salida,
    };
  }
}
