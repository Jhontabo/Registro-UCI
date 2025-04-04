import "dart:collection";

class CreateMonitoriaHemodinamicaDto extends MapView<String, dynamic> {
  final int hora;

  CreateMonitoriaHemodinamicaDto({
    required this.hora,
  }) : super({
          'hora': hora,
        });
}
