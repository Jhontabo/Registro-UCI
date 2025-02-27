import 'package:registro_uci/features/marcapasos/data/dto/create_marcapaso_dto.dart';
import 'package:registro_uci/features/marcapasos/data/dto/update_marcapaso_dto.dart';
import 'package:registro_uci/features/marcapasos/domain/models/marcapaso.dart';

/// 🔹 **Interfaz del Repositorio de Marcapasos**
/// Define las operaciones CRUD que todas las implementaciones deben seguir.
abstract class MarcapasosRepository {
  /// 🔥 Obtiene todos los marcapasos registrados en la base de datos
  Future<List<Marcapaso>> getAllMarcapasos();

  /// 🔥 Registra un nuevo marcapasos con los datos proporcionados
  Future<void> createMarcapaso(CreateMarcapasoDto dto);

  /// 🔥 Obtiene los marcapasos asociados a un ingreso específico
  Future<List<Marcapaso>> getMarcapasosByIngreso(String idIngreso);

  /// 🔥 Obtiene un marcapaso específico de un ingreso
  Future<Marcapaso?> getMarcapasoById(String idIngreso, String idMarcapaso);

  /// 🔥 Actualiza los datos de un marcapaso
  Future<void> updateMarcapaso(
      String idIngreso, String idMarcapaso, UpdateMarcapasoDto dto);

  /// 🔥 Elimina un marcapasos por su ID y el ingreso asociado
  Future<void> deleteMarcapaso(String idIngreso, String idMarcapaso);
}
