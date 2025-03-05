class UpdateCateterDto {
  final String? tipo; // Venoso central, venoso periférico, arterial
  final String? sitio; // Yugular, radial, femoral, etc.
  final String? fechaInsercion;
  final String? fechaRetiro; // Opcional
  final String? lugarProcedencia; // Hospitalización, urgencias, etc.

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
      if (fechaInsercion != null) "fechaInsercion": fechaInsercion,
      if (fechaRetiro != null) "fechaRetiro": fechaRetiro,
      if (lugarProcedencia != null) "lugarProcedencia": lugarProcedencia,
    };
  }
}
