import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/providers/repository_providers.dart';
import 'package:registro_uci/features/control_cambio_posicion/domain/models/cambio_posicion.dart';

@immutable
class CambioPosicionParams {
  final String idIngreso;
  final String idRegistroDiario;
  final String? idCambioPosicion; // Hacerlo opcional para consultas generales

  const CambioPosicionParams({
    required this.idIngreso,
    required this.idRegistroDiario,
    this.idCambioPosicion,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CambioPosicionParams &&
        other.idIngreso == idIngreso &&
        other.idRegistroDiario == idRegistroDiario &&
        other.idCambioPosicion == idCambioPosicion;
  }

  @override
  int get hashCode =>
      Object.hash(idIngreso, idRegistroDiario, idCambioPosicion);
}

final cambioPosicionProvider =
    FutureProvider.family<List<CambioDePosicion>, CambioPosicionParams>(
        (ref, params) async {
  final repository = ref.watch(cambioPosicionRepositoryProvider);

  try {
    if (params.idCambioPosicion != null) {
      // Obtener un cambio específico
      final cambio = await repository.getCambioPosicionById(
        params.idIngreso,
        params.idRegistroDiario,
        params.idCambioPosicion!,
      );
      return cambio != null ? [cambio] : [];
    } else {
      // Obtener todos los cambios
      return await repository.getCambiosDePosicion(
        params.idIngreso,
        params.idRegistroDiario,
      );
    }
  } catch (e, stackTrace) {
    debugPrintStack(stackTrace: stackTrace);
    throw Exception('Error al obtener cambios de posición: $e');
  }
});

// Provider adicional para el último cambio
final ultimoCambioPosicionProvider =
    FutureProvider.family<CambioDePosicion?, CambioPosicionParams>(
        (ref, params) async {
  final repository = ref.watch(cambioPosicionRepositoryProvider);

  try {
    return await repository.getUltimoCambioPosicion(
      params.idIngreso,
      params.idRegistroDiario,
    );
  } catch (e, stackTrace) {
    debugPrintStack(stackTrace: stackTrace);
    throw Exception('Error al obtener último cambio de posición: $e');
  }
});
