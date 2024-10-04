import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/providers/repository_providers.dart';
import 'package:registro_uci/features/necesidades/domain/models/necesidad.dart';

@immutable
class NecesidadesParams {
  final String idIngreso;
  final String idRegistro;

  const NecesidadesParams({
    required this.idIngreso,
    required this.idRegistro,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NecesidadesParams &&
        other.idIngreso == idIngreso &&
        other.idRegistro == idRegistro;
  }

  @override
  int get hashCode => Object.hash(idIngreso, idRegistro);
}

final necesidadesDeRegistroProvider =
    FutureProvider.family<List<Necesidad>, NecesidadesParams>(
        (ref, params) async {
  return await ref
      .watch(necesidadesRepositoryProvider)
      .getNecesidadesDeRegistro(
        params.idIngreso,
        params.idRegistro,
      );
});
