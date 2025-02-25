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

/// 🔥 **Obtener todos los marcapasos de un paciente**
final marcapasosByPacienteProvider =
    FutureProvider.family<List<Marcapaso>, String>((ref, idPaciente) async {
  final repository = ref.read(marcapasosRepositoryProvider);
  return await repository.getMarcapasosByPaciente(idPaciente);
});

/// 🔥 **Obtener un marcapaso específico de un paciente**
final marcapasoByIdProvider = FutureProvider.family<Marcapaso?,
    ({String idPaciente, String idMarcapaso})>((ref, params) async {
  final repository = ref.read(marcapasosRepositoryProvider);
  return await repository.getMarcapaso(params.idPaciente, params.idMarcapaso);
});

/// 🔥 **Actualizar un marcapaso**
final actualizarMarcapasoProvider = FutureProvider.family<
    void,
    ({
      String idPaciente,
      String idMarcapaso,
      UpdateMarcapasoDto dto
    })>((ref, params) async {
  final repository = ref.read(marcapasosRepositoryProvider);
  await repository.updateMarcapaso(
      params.idPaciente, params.idMarcapaso, params.dto);
});

/// 🔥 **Eliminar un marcapaso**
final eliminarMarcapasoProvider =
    FutureProvider.family<void, ({String idPaciente, String idMarcapaso})>(
        (ref, params) async {
  final repository = ref.read(marcapasosRepositoryProvider);
  await repository.deleteMarcapaso(params.idPaciente, params.idMarcapaso);
});
