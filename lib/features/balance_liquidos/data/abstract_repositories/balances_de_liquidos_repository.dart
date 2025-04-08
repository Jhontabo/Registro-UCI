import 'package:registro_uci/features/balance_liquidos/domain/models/balance_de_liquidos.dart';

abstract class BalancesDeLiquidosRepository {
  Future<List<BalanceDeLiquidos>> getBalancesDeLiquidos(
    String idIngreso,
    String idRegistroDiario,
  );
}
