import 'dart:collection';
import '../../domain/models/sonda.dart';

class CreateSondaDto extends MapView<String, dynamic> {
  final String tipo;
  final String regionAnatomica;
  final DateTime fechaColocacion;
  final String idIngreso; // ✅ Se añade para asegurar que se pase correctamente

  CreateSondaDto({
    required this.tipo,
    required this.regionAnatomica,
    required this.fechaColocacion,
    required this.idIngreso,
  }) : super({
          'tipo': tipo,
          'regionAnatomica': regionAnatomica,
          'fechaColocacion': fechaColocacion.toIso8601String(),
          'idIngreso': idIngreso, // ✅ Se asegura que se pase en Firebase
        });

  // ✅ Método para convertir DTO en una instancia de `Sonda`
  Sonda toSonda() {
    return Sonda(
      id: DateTime.now()
          .millisecondsSinceEpoch
          .toString(), // ✅ Generación de ID con timestamp
      tipo: tipo,
      regionAnatomica: regionAnatomica,
      fechaColocacion: fechaColocacion,
      idIngreso: idIngreso, // ✅ Se asegura de que `idIngreso` no se pierda
    );
  }
}
