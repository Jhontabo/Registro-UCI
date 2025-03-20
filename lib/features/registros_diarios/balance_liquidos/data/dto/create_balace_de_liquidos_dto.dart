import "dart:collection";

class CreateBalanceDeLiquidosDto extends MapView<String, dynamic> {
  final int hora;
  final int orden;

  CreateBalanceDeLiquidosDto({
    required this.hora,
    required this.orden,
  }) : super({
          'hora': hora,
          'orden': orden,
        });
}
