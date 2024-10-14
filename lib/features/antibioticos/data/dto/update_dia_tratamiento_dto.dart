import 'dart:collection';

class UpdateDiaTratamientoDto extends MapView<String, dynamic> {
  final int? dia;
  final DateTime? inicio;
  final DateTime? fin;
  final bool? valido;

  UpdateDiaTratamientoDto({
    this.dia,
    this.inicio,
    this.fin,
    this.valido,
  }) : super({
          if (dia != null) 'dia': dia,
          if (inicio != null) 'inicio': inicio,
          if (fin != null) 'fin': fin,
          if (valido != null) 'valido': valido,
        });
}
