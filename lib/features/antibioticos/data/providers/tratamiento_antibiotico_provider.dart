import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/providers/repository_providers.dart';
import 'package:registro_uci/features/antibioticos/domain/models/tratamiento_antibiotico.dart';

@immutable
class TratamientoAntibioticoParams {
  final String idIngreso;
  final String idTratamientoAntibiotico;

  const TratamientoAntibioticoParams({
    required this.idIngreso,
    required this.idTratamientoAntibiotico,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TratamientoAntibioticoParams &&
        other.idIngreso == idIngreso &&
        other.idTratamientoAntibiotico == idTratamientoAntibiotico;
  }

  @override
  int get hashCode => Object.hash(idIngreso, idTratamientoAntibiotico);
}

final tratamientoAntibioticoProvider =
    FutureProvider.family<TratamientoAntibiotico, TratamientoAntibioticoParams>(
        (ref, params) async {
  return await ref
      .watch(tratamientosAntibioticosRepositoryProvider)
      .getTratamientoAntibiotico(
        params.idIngreso,
        params.idTratamientoAntibiotico,
      );
});
