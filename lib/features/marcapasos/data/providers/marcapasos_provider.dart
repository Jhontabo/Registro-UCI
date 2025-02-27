import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../repositories/firabase_marcapaso_repository.dart';
import '../../data/abstract_repositories/marcapasos_repository.dart';
import 'package:registro_uci/features/marcapasos/domain/models/marcapaso.dart';
import 'package:registro_uci/features/marcapasos/data/dto/create_marcapaso_dto.dart';
import 'package:registro_uci/features/marcapasos/data/dto/update_marcapaso_dto.dart';

/// 🔹 **Provee la instancia del repositorio de marcapasos**
final marcapasosRepositoryProvider = Provider<MarcapasosRepository>((ref) {
  return FirebaseMarcapasosRepository(); // 🔥 Usa la implementación real
});

/// 🔹 **Registrar un marcapaso**
final registrarMarcapasoProvider =
    FutureProvider.family<void, CreateMarcapasoDto>((ref, dto) async {
  final repository = ref.read(marcapasosRepositoryProvider);
  await repository.createMarcapaso(dto); // 🔥 Método corregido
});

/// 🔹 **Obtener todos los marcapasos de la base de datos**
final allMarcapasosProvider = FutureProvider<List<Marcapaso>>((ref) async {
  return await ref.watch(marcapasosRepositoryProvider).getAllMarcapasos();
});

/// 🔹 **Obtener todos los marcapasos de un ingreso específico**
final marcapasosByIngresoProvider =
    StreamProvider.family<List<Marcapaso>, String>((ref, idIngreso) {
  final repository = ref.read(marcapasosRepositoryProvider);
  return repository.getMarcapasosByIngreso(idIngreso);
});

/// 🔹 **Obtener un marcapaso específico de un ingreso**
final marcapasoByIdProvider =
    FutureProvider.family<Marcapaso?, ({String idIngreso, String idMarcapaso})>(
        (ref, params) async {
  final repository = ref.read(marcapasosRepositoryProvider);
  return await repository.getMarcapasoById(
      params.idIngreso, params.idMarcapaso);
});

/// 🔹 **Actualizar un marcapaso**
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

/// 🔹 **Eliminar un marcapaso**
final eliminarMarcapasoProvider =
    FutureProvider.family<void, ({String idIngreso, String idMarcapaso})>(
        (ref, params) async {
  final repository = ref.read(marcapasosRepositoryProvider);
  await repository.deleteMarcapaso(params.idIngreso, params.idMarcapaso);
});
