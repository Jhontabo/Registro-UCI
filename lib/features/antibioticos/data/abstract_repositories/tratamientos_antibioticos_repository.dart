import 'package:registro_uci/features/antibioticos/data/dto/create_tratamiento_antibiotico_dto.dart';
import 'package:registro_uci/features/antibioticos/data/dto/update_tratamiento_antibiotico_dto.dart';
import 'package:registro_uci/features/antibioticos/domain/models/tratamiento_antibiotico.dart';

abstract class TratamientosAntibioticosRepository {
  Future<void> createTratamientoAntibiotico(
    String idIngreso,
    CreateTratamientoAntibioticoDto dto,
  );

  Future<TratamientoAntibiotico> getTratamientoAntibiotico(
    String idIngreso,
    String idTratamientoAntibiotico,
  );

  Future<List<TratamientoAntibiotico>> getTratamientosAntibioticosDeIngreso(
    String idIngreso,
  );

  Future<void> finalizarTratamientoAntibiotico(
    String idIngreso,
    String idTratamientoAntibiotico,
  );

  Future<void> updateTratamientoAntibiotico(
    String idIngreso,
    String idTratamientoAntibiotico,
    UpdateTratamientoAntibioticoDto dto,
  );
}
