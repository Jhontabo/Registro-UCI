import "dart:collection";
import 'package:registro_uci/features/necesidades/data/constants/strings.dart';

class CreateNecesidadDto extends MapView<String, dynamic> {
  final String nombreNecesidad;

  CreateNecesidadDto({
    required this.nombreNecesidad,
  }) : super({
          Strings.nombreNecesidad: nombreNecesidad,
        });
}
