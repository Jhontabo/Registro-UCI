import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repositories/marcapasos_repository.dart';
import '../dto/create_marcapaso_dto.dart';

final marcapasosRepositoryProvider = Provider((ref) => MarcapasosRepository());

final registrarMarcapasoProvider =
    FutureProvider.family<void, CreateMarcapasoDto>((ref, dto) async {
  final repository = ref.read(marcapasosRepositoryProvider);
  await repository.registrarMarcapaso(dto);
});
