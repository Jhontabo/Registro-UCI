import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateSondaDto {
  final String? tipo;
  final String? regionAnatomica;
  final DateTime? fechaColocacion;
  final DateTime? fechaRetiro; // ✅ Nueva propiedad para la fecha de retiro

  UpdateSondaDto({
    this.tipo,
    this.regionAnatomica,
    this.fechaColocacion,
    this.fechaRetiro, // ✅ Aseguramos que la fecha de retiro esté disponible
  });

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (tipo != null) data['tipo'] = tipo;
    if (regionAnatomica != null) data['regionAnatomica'] = regionAnatomica;
    if (fechaColocacion != null)
      data['fechaColocacion'] = fechaColocacion?.toIso8601String();
    if (fechaRetiro != null)
      data['fechaRetiro'] =
          fechaRetiro?.toIso8601String(); // ✅ Guardamos la fecha de retiro
    return data;
  }
}
