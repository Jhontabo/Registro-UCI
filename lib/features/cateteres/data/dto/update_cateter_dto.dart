import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateCateterDto {
  final String? tipo;
  final String? sitio;
  final DateTime? fechaInsercion; // ✅ Convertir a DateTime
  final DateTime? fechaRetiro; // ✅ Convertir a DateTime
  final String? lugarProcedencia;

  UpdateCateterDto({
    this.tipo,
    this.sitio,
    this.fechaInsercion,
    this.fechaRetiro,
    this.lugarProcedencia,
  });

  /// 🔥 **Convierte solo los valores que no sean `null` a JSON**
  Map<String, dynamic> toJson() {
    return {
      if (tipo != null) "tipo": tipo,
      if (sitio != null) "sitio": sitio,
      if (fechaInsercion != null)
        "fechaInsercion": Timestamp.fromDate(fechaInsercion!), // ✅ Cambio
      if (fechaRetiro != null)
        "fechaRetiro": Timestamp.fromDate(fechaRetiro!), // ✅ Cambio
      if (lugarProcedencia != null) "lugarProcedencia": lugarProcedencia,
    };
  }
}
