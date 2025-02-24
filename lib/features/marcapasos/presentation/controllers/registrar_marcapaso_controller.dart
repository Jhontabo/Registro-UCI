import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:registro_uci/features/marcapasos/data/dto/create_marcapaso_dto.dart';
import 'package:registro_uci/features/marcapasos/data/repositories/marcapasos_repository.dart';
import '../../data/providers/marcapasos_provider.dart';

final registrarMarcapasoControllerProvider = Provider((ref) {
  final repository = ref.watch(marcapasosRepositoryProvider);
  return RegistrarMarcapasoController(repository);
});

class RegistrarMarcapasoController {
  final MarcapasosRepository _repository;

  RegistrarMarcapasoController(this._repository);

  Future<void> registrarMarcapaso(CreateMarcapasoDto dto) async {
    await _repository.registrarMarcapaso(dto);
  }
}
