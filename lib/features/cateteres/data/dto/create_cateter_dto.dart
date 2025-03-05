import 'package:cloud_firestore/cloud_firestore.dart';

class CreateCateterDto {
  final String idIngreso;
  final String tipo;
  final String sitio;
  final DateTime fechaInsercion; // ✅ Ahora es DateTime
  final DateTime? fechaRetiro; // ✅ Ahora es DateTime opcional
  final String lugarProcedencia;

  CreateCateterDto({
    required this.idIngreso,
    required this.tipo,
    required this.sitio,
    required this.fechaInsercion,
    this.fechaRetiro,
    required this.lugarProcedencia,
  });

  Map<String, dynamic> toJson() {
    return {
      "idIngreso": idIngreso,
      "tipo": tipo,
      "sitio": sitio,
      "fechaInsercion": Timestamp.fromDate(
          fechaInsercion), // ✅ Convertir DateTime a Timestamp
      "fechaRetiro":
          fechaRetiro != null ? Timestamp.fromDate(fechaRetiro!) : null,
      "lugarProcedencia": lugarProcedencia,
    };
  }
}
