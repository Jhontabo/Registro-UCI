import 'package:registro_uci/features/balance_liquidos/administrados/data/dto/create_liquido_administrado_dto.dart';
import 'package:registro_uci/features/balance_liquidos/administrados/domain/models/liquido_administrado.dart';

abstract class LiquidosAdministradosRepository {
  Future<void> createLiquidoAdministrado(
    String idIngreso,
    String idRegistroDiario,
    String idBalanceLiquidos,
    CreateLiquidoAdministradoDto dto,
  );

  Future<void> updateLiquidoAdministrado(
    String idIngreso,
    String idRegistroDiario,
    String idBalanceLiquidos,
    String idLiquidoAdministrado,
    CreateLiquidoAdministradoDto dto,
  );

  Future<void> deleteLiquidoAdministrado(
    String idIngreso,
    String idRegistroDiario,
    String idBalanceLiquidos,
    String idLiquidoAdministrado,
  );

  Future<List<LiquidoAdministrado>> getLiquidosAdministrados(
    String idIngreso,
    String idRegistroDiario,
    String idBalanceLiquidos,
  );

  Future<List<LiquidoAdministrado>> getLiquidosAdministradosFromPreviousHour(
    String idIngreso,
    String idRegistroDiario,
    String idBalanceLiquidos,
  );

  Future<List<CreateLiquidoAdministradoDto>> getTratamientosAntibioticosActivos(
    String idIngreso,
    DateTime hora,
  );

  Future<void> createManyLiquidosAdministrados(
    String idIngreso,
    String idRegistroDiario,
    String idBalanceLiquidos,
    List<CreateLiquidoAdministradoDto> dtos,
  );
}
