import 'package:registro_uci/features/necesidades/data/dto/create_necesidad_dto.dart';
import 'package:registro_uci/features/necesidades/data/dto/update_necesidad_dto.dart';
import 'package:registro_uci/features/necesidades/domain/models/necesidad.dart';

abstract class NecesidadesRepository {
  Future<List<Necesidad>> getNecesidadesDeRegistro(
    String idIngreso,
    String idRegistro,
  );

  Future<void> addNecesidadToRegistro(
    String idIngreso,
    String idRegistro,
    CreateNecesidadDto dto,
  );

  Future<void> updateNecesidadDeRegistro(
    String idIngreso,
    String idRegistro,
    String idNecesidad,
    UpdateNecesidadDto dto,
  );

  Future<void> deleteNecesidadDeRegistro(
    String idIngreso,
    String idRegistro,
    String idNecesidad,
  );
}
