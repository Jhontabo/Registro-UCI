import "dart:collection";
import 'package:registro_uci/features/firmas/data/dto/constants/strings.dart';

class CreateFirmaDto extends MapView<String, dynamic> {
  final String nombreFirma;
  final DateTime fechaFirma;

  CreateFirmaDto({
    required this.nombreFirma,
    required this.fechaFirma,
  }) : super({
          Strings.nombreFirma: nombreFirma,
          Strings.fechaFirma: fechaFirma,
        });
}
