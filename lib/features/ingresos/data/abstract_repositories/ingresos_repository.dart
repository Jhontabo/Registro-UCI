import 'package:registro_uci/features/ingresos/data/dto/create_ingreso_dto.dart';
import 'package:registro_uci/features/ingresos/data/dto/update_ingreso_dto.dart';
import 'package:registro_uci/features/ingresos/domain/models/ingreso.dart';

abstract class IngresosRepository {
  Future<List<Ingreso>> getAllIngresos(); // order by fechaIngreso desc
  Future<void> createIngreso(CreateIngresoDto dto);
  Future<void> updateIngreso(
    String idIngreso,
    UpdateIngresoDto dto,
  );
  Future<Ingreso?> getIngresoById(String idIngreso);

  Future<List<Ingreso>> getIngresosBySala(Sala sala);
}
