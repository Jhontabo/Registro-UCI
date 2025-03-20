import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:registro_uci/features/registros_diarios/balance_liquidos/data/abstract_repositories/balances_de_liquidos_repository.dart';
import 'package:registro_uci/features/registros_diarios/balance_liquidos/domain/models/balance_de_liquidos.dart';

class FirebaseBalancesDeLiquidosRepository
    implements BalancesDeLiquidosRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<BalanceDeLiquidos>> getBalancesDeLiquidos(
    String idIngreso,
    String idRegistroDiario,
  ) async {
    final balancesDeLiquidosRef = _firestore
        .collection('ingresos')
        .doc(idIngreso)
        .collection('registrosDiarios')
        .doc(idRegistroDiario)
        .collection('balancesDeLiquidos');

    final querySnapshot =
        await balancesDeLiquidosRef.orderBy('orden', descending: false).get();

    final balancesDeLiquidos = querySnapshot.docs.map((doc) {
      return BalanceDeLiquidos.fromJson(doc.data(), id: doc.id);
    }).toList();

    return balancesDeLiquidos;
  }
}
