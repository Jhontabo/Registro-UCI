class Marcapaso {
  final String id;
  final String idPaciente; // Para asociarlo a un paciente
  final String fechaColocacion;
  final String modo;
  final String via;
  final int frecuencia;
  final double sensibilidad;
  final double salida;

  Marcapaso({
    required this.id,
    required this.idPaciente,
    required this.fechaColocacion,
    required this.modo,
    required this.via,
    required this.frecuencia,
    required this.sensibilidad,
    required this.salida,
  });

  factory Marcapaso.fromJson(Map<String, dynamic> json) {
    return Marcapaso(
      id: json['id'],
      idPaciente: json['idPaciente'],
      fechaColocacion: json['fechaColocacion'],
      modo: json['modo'],
      via: json['via'],
      frecuencia: json['frecuencia'],
      sensibilidad: json['sensibilidad'],
      salida: json['salida'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "idPaciente": idPaciente,
      "fechaColocacion": fechaColocacion,
      "modo": modo,
      "via": via,
      "frecuencia": frecuencia,
      "sensibilidad": sensibilidad,
      "salida": salida,
    };
  }
}
