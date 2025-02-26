import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repositories/marcapasos_repository.dart';
import '../dto/create_marcapaso_dto.dart';
import '../dto/update_marcapso_dto.dart';
import '../../domain/models/marcapaso.dart';

/// 🔥 **Provee la instancia del repositorio de marcapasos**
final marcapasosRepositoryProvider = Provider((ref) => MarcapasosRepository());

/// 🔥 **Registrar un marcapaso**
final registrarMarcapasoProvider =
    FutureProvider.family<void, CreateMarcapasoDto>((ref, dto) async {
  final repository = ref.read(marcapasosRepositoryProvider);
  await repository.registrarMarcapaso(dto);
});

/// 🔥 **Obtener todos los marcapasos de un ingreso**
final marcapasosByIngresoProvider =
    FutureProvider.family<List<Marcapaso>, String>((ref, idIngreso) async {
  final repository = ref.read(marcapasosRepositoryProvider);
  return await repository.getMarcapasosByIngreso(idIngreso);
});

/// 🔥 **Obtener un marcapaso específico de un ingreso**
final marcapasoByIdProvider =
    FutureProvider.family<Marcapaso?, ({String idIngreso, String idMarcapaso})>(
        (ref, params) async {
  final repository = ref.read(marcapasosRepositoryProvider);
  return await repository.getMarcapaso(params.idIngreso, params.idMarcapaso);
});

/// 🔥 **Actualizar un marcapaso**
final actualizarMarcapasoProvider = FutureProvider.family<
    void,
    ({
      String idIngreso,
      String idMarcapaso,
      UpdateMarcapasoDto dto
    })>((ref, params) async {
  final repository = ref.read(marcapasosRepositoryProvider);
  await repository.updateMarcapaso(
      params.idIngreso, params.idMarcapaso, params.dto);
});

/// 🔥 **Eliminar un marcapaso**
final eliminarMarcapasoProvider =
    FutureProvider.family<void, ({String idIngreso, String idMarcapaso})>(
        (ref, params) async {
  final repository = ref.read(marcapasosRepositoryProvider);
  await repository.deleteMarcapaso(params.idIngreso, params.idMarcapaso);
});
