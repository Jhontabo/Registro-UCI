import 'package:registro_uci/features/antibioticos/data/dto/create_dosis_tratamiento_dto.dart';
import 'package:registro_uci/features/antibioticos/domain/models/dosis_tratamiento.dart';

abstract class DosisTratamientoRepository {
  Future<List<DosisTratamiento>> getDosisTratamiento(
    String idIngreso,
    String idTratamientoAntibiotico,
    String idDiaTratamiento,
  );

  Future<void> createDosisTratamiento(
    String idIngreso,
    String idTratamientoAntibiotico,
    String idDiaTratamiento,
    CreateDosisTratamientoDto dto,
  );
}
