import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/dto/create_marcapaso_dto.dart';
import '../../data/providers/marcapasos_provider.dart';

class RegistrarMarcapasoController {
  final Ref ref;

  RegistrarMarcapasoController(this.ref);

  Future<void> registrarMarcapaso(CreateMarcapasoDto dto) async {
    await ref.read(registrarMarcapasoProvider(dto).future);
  }
}

final registrarMarcapasoControllerProvider =
    Provider((ref) => RegistrarMarcapasoController(ref));
