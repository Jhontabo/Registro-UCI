import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/providers/repository_providers.dart';
import 'package:registro_uci/features/antibioticos/domain/models/tratamiento_antibiotico.dart';

final tratamientosAntibioticosProvider =
    FutureProvider.family<List<TratamientoAntibiotico>, String>(
        (ref, idIngreso) async {
  return await ref
      .watch(tratamientosAntibioticosRepositoryProvider)
      .getTratamientosAntibioticosDeIngreso(idIngreso);
});
