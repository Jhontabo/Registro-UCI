import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/providers/repository_providers.dart';
import 'package:registro_uci/features/antibioticos/domain/models/dia_tratamiento.dart';

@immutable
class DiaTratamientoParams {
  final String idIngreso;
  final String idTratamientoAntibiotico;
  final String idDiaTratamiento;

  const DiaTratamientoParams({
    required this.idIngreso,
    required this.idTratamientoAntibiotico,
    required this.idDiaTratamiento,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DiaTratamientoParams &&
        other.idIngreso == idIngreso &&
        other.idTratamientoAntibiotico == idTratamientoAntibiotico &&
        other.idDiaTratamiento == idDiaTratamiento;
  }

  @override
  int get hashCode =>
      Object.hash(idIngreso, idTratamientoAntibiotico, idDiaTratamiento);
}

final diaTratamientoProvider =
    FutureProvider.family<DiaTratamiento?, DiaTratamientoParams>(
        (ref, params) async {
  final repository = ref.watch(diasTratamientoRepositoryProvider);
  return await repository.getDiaTratamiento(
    params.idIngreso,
    params.idTratamientoAntibiotico,
    params.idDiaTratamiento,
  );
});
