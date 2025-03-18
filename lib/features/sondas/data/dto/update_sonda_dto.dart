import 'dart:collection';
import '../../domain/models/sonda.dart';

class UpdateSondaDto extends MapView<String, dynamic> {
  final String? tipo;
  final String? regionAnatomica; // ✅ Se añade regionAnatomica
  final DateTime? fechaColocacion;
  final String? pacienteId;
  final String? idIngreso; // ✅ Se mantiene idIngreso

  UpdateSondaDto({
    this.tipo,
    this.regionAnatomica,
    this.fechaColocacion,
    this.pacienteId,
    this.idIngreso,
  }) : super({
          if (tipo != null) 'tipo': tipo,
          if (regionAnatomica != null)
            'regionAnatomica':
                regionAnatomica, // ✅ Se incluye en la actualización
          if (fechaColocacion != null)
            'fechaColocacion': fechaColocacion.toIso8601String(),
          if (pacienteId != null) 'pacienteId': pacienteId,
          if (idIngreso != null)
            'idIngreso': idIngreso, // ✅ Se mantiene el idIngreso
        });

  // ✅ Método para aplicar la actualización al modelo Sonda
  Sonda applyTo(Sonda sonda) {
    return sonda.copyWith(
      tipo: tipo ?? sonda.tipo,
      regionAnatomica:
          regionAnatomica ?? sonda.regionAnatomica, // ✅ Se mantiene la región
      fechaColocacion: fechaColocacion ?? sonda.fechaColocacion,
      idIngreso: idIngreso ?? sonda.idIngreso, // ✅ Se mantiene el idIngreso
    );
  }
}
