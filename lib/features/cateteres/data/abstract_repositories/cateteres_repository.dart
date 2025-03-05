import 'package:registro_uci/features/cateteres/data/dto/create_cateter_dto.dart';
import 'package:registro_uci/features/cateteres/data/dto/update_cateter_dto.dart';
import 'package:registro_uci/features/cateteres/domain/models/cateter.dart';

/// 🔹 **Interfaz del Repositorio de Catéteres**
abstract class CateteresRepository {
  Stream<List<Cateter>>
      getAllCateteres(); // 🔥 Ya coincide con la implementación corregida
  Future<void> createCateter(CreateCateterDto dto);
  Stream<List<Cateter>> getCateteresByIngreso(String idIngreso);
  Future<Cateter?> getCateterById(String idIngreso, String idCateter);
  Future<void> updateCateter(
      String idIngreso, String idCateter, UpdateCateterDto dto);
  Future<void> deleteCateter(String idIngreso, String idCateter);
}
