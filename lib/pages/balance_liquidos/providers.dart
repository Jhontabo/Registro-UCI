import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:registro_uci/common/providers/repository_providers.dart';

// Define a class to hold the parameters
@immutable
class BalanceParams {
  final String idIngreso;
  final String idRegistroDiario;

  const BalanceParams({
    required this.idIngreso,
    required this.idRegistroDiario,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BalanceParams &&
        other.idIngreso == idIngreso &&
        other.idRegistroDiario == idRegistroDiario;
  }

  @override
  int get hashCode => Object.hash(idIngreso, idRegistroDiario);
}

// Provider for retrieving balance data
final totalBalanceProvider =
    FutureProvider.family<Map<String, dynamic>, BalanceParams>(
        (ref, params) async {
  final doc = await FirebaseFirestore.instance
      .collection('ingresos')
      .doc(params.idIngreso)
      .collection('registrosDiarios')
      .doc(params.idRegistroDiario)
      .get();
  final data = doc.data() ?? {};
  return {
    'totalAdministrados': data['totalAdministrados'] ?? 0,
    'fechaCalculoTotalAdministrados': data['fechaCalculoTotalAdministrados'],
    'totalAdministradoCalculatedUntil':
        data['totalAdministradoCalculatedUntil'] ?? 0,
  };
});

// Define a separate class for the calculation function parameters
@immutable
class CalculateParams {
  final String idIngreso;
  final String idRegistroDiario;
  final int hora;

  const CalculateParams({
    required this.idIngreso,
    required this.idRegistroDiario,
    required this.hora,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CalculateParams &&
        other.idIngreso == idIngreso &&
        other.idRegistroDiario == idRegistroDiario &&
        other.hora == hora;
  }

  @override
  int get hashCode => Object.hash(idIngreso, idRegistroDiario, hora);
}

// Provider to calculate total balance up to a given hour
final calculateBalanceProvider =
    FutureProvider.family<int, CalculateParams>((ref, params) async {
  final yourServiceClass = ref.watch(registrosDiariosRepositoryProvider);
  return await yourServiceClass.getBalanceAcumuladoUntilHora(
    params.idIngreso,
    params.idRegistroDiario,
    params.hora,
  );
});
