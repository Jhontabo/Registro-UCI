import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/providers/repository_providers.dart';
import 'package:registro_uci/features/antibioticos/domain/models/dia_tratamiento.dart';

@immutable
class DiasTratamientoParams {
  final String idIngreso;
  final String idTratamientoAntibiotico;

  const DiasTratamientoParams({
    required this.idIngreso,
    required this.idTratamientoAntibiotico,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DiasTratamientoParams &&
        other.idIngreso == idIngreso &&
        other.idTratamientoAntibiotico == idTratamientoAntibiotico;
  }

  @override
  int get hashCode => Object.hash(idIngreso, idTratamientoAntibiotico);
}

final diasTratamientoProvider =
    FutureProvider.family<List<DiaTratamiento>, DiasTratamientoParams>(
        (ref, params) async {
  final repository = ref.watch(diasTratamientoRepositoryProvider);
  return await repository.getDiasTratamiento(
    params.idIngreso,
    params.idTratamientoAntibiotico,
  );
});
