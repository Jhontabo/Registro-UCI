import 'package:registro_uci/features/antibioticos/data/dto/update_dia_tratamiento_dto.dart';
import 'package:registro_uci/features/antibioticos/domain/models/dia_tratamiento.dart';

abstract class DiasTratamientoRepository {
  Future<List<DiaTratamiento>> getDiasTratamiento(
    String idIngreso,
    String idTratamientoAntibiotico,
  );

  Future<DiaTratamiento?> getDiaTratamiento(
    String idIngreso,
    String idTratamientoAntibiotico,
    String idDiaTratamiento,
  );

  Future<void> updateDiaTratamiento(
    String idIngreso,
    String idTratamientoAntibiotico,
    String idDiaTratamiento,
    UpdateDiaTratamientoDto dto,
  );

  Future<void> refreshDiasTratamiento(
    String idIngreso,
    String idTratamientoAntibiotico,
  );
}
