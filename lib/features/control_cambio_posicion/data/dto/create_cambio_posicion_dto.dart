import 'dart:collection';

class CreateCambioDePosicionDto extends MapView<String, dynamic> {
  final int hora; // Hora del cambio de posición (de 8 AM a 7 AM)
  final String
      posicion; // La posición del paciente (Decúbito Dorsal, Lateral Izquierdo, etc.)
  final int orden; // Orden de los cambios en el día

  CreateCambioDePosicionDto({
    required this.hora,
    required this.posicion,
    required this.orden,
  }) : super({
          'hora': hora,
          'posicion': posicion,
          'orden': orden,
        });
}
