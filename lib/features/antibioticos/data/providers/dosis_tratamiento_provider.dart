import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/providers/repository_providers.dart';
import 'package:registro_uci/features/antibioticos/domain/models/dosis_tratamiento.dart';

@immutable
class DosisTratamientoParams {
  final String idIngreso;
  final String idTratamientoAntibiotico;
  final String idDiaTratamiento;

  const DosisTratamientoParams({
    required this.idIngreso,
    required this.idTratamientoAntibiotico,
    required this.idDiaTratamiento,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DosisTratamientoParams &&
        other.idIngreso == idIngreso &&
        other.idTratamientoAntibiotico == idTratamientoAntibiotico &&
        other.idDiaTratamiento == idDiaTratamiento;
  }

  @override
  int get hashCode =>
      Object.hash(idIngreso, idTratamientoAntibiotico, idDiaTratamiento);
}

final dosisTratamientoProvider =
    FutureProvider.family<List<DosisTratamiento>, DosisTratamientoParams>(
        (ref, params) async {
  final repository = ref.watch(dosisTratamientoRepositoryProvider);
  return await repository.getDosisTratamiento(
    params.idIngreso,
    params.idTratamientoAntibiotico,
    params.idDiaTratamiento,
  );
});
