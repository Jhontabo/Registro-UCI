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
}
