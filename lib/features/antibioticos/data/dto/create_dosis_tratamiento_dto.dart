import "dart:collection";

class CreateDosisTratamientoDto extends MapView<String, dynamic> {
  final int cantidad;
  final String? comentario;
  final String? dosis;
  final DateTime hora;

  CreateDosisTratamientoDto({
    required this.cantidad,
    this.comentario,
    this.dosis,
    required this.hora,
  }) : super({
          'cantidad': cantidad,
          if (comentario != null) 'comentario': comentario,
          if (dosis != null) 'dosis': dosis,
          'hora': hora,
        });
}
