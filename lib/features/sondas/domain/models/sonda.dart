import 'package:cloud_firestore/cloud_firestore.dart';

class Sonda {
  final String id;
  final String tipo;
  final String regionAnatomica;
  final DateTime fechaColocacion;
  final String idIngreso;

  Sonda({
    required this.id,
    required this.tipo,
    required this.regionAnatomica,
    required this.fechaColocacion,
    required this.idIngreso,
  });

  // ✅ Método `copyWith` para actualizar solo los campos necesarios
  Sonda copyWith({
    String? id,
    String? tipo,
    String? regionAnatomica,
    DateTime? fechaColocacion,
    String? idIngreso,
  }) {
    return Sonda(
      id: id ?? this.id,
      tipo: tipo ?? this.tipo,
      regionAnatomica: regionAnatomica ?? this.regionAnatomica,
      fechaColocacion: fechaColocacion ?? this.fechaColocacion,
      idIngreso: idIngreso ?? this.idIngreso,
    );
  }

  // ✅ Manejo seguro de `fechaColocacion` si es `String` o `Timestamp`
  factory Sonda.fromJson(Map<String, dynamic> json) {
    return Sonda(
      id: json['id'] ?? '',
      tipo: json['tipo'] ?? 'Desconocido',
      regionAnatomica: json['regionAnatomica'] ?? 'No especificado',
      fechaColocacion: _parseFecha(json['fechaColocacion']),
      idIngreso: json['idIngreso'] ?? '',
    );
  }

  static DateTime _parseFecha(dynamic fecha) {
    if (fecha is Timestamp) {
      return fecha.toDate(); // ✅ Conversión de `Timestamp` a `DateTime`
    } else if (fecha is String) {
      return DateTime.parse(fecha); // ✅ Conversión de `String` a `DateTime`
    }
    return DateTime.now(); // ✅ Valor predeterminado si es `null`
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tipo': tipo,
      'regionAnatomica': regionAnatomica,
      'fechaColocacion':
          fechaColocacion.toIso8601String(), // ✅ Guardar como `String`
      'idIngreso': idIngreso,
    };
  }
}
