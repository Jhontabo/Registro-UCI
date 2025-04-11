import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/providers/repository_providers.dart';
import 'package:registro_uci/features/control_cambio_posicion/domain/models/cambio_posicion.dart';

@immutable
class CambioPosicionParams {
  final String idIngreso;
  final String idRegistroDiario;
  final String? idCambioPosicion;

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

@immutable
class GuardarCambioPosicionParams {
  final String idIngreso;
  final String idRegistroDiario;
  final int hora;
  final String posicion;
  final String? idCambioPosicion; // Para actualizaciones

  const GuardarCambioPosicionParams({
    required this.idIngreso,
    required this.idRegistroDiario,
    required this.hora,
    required this.posicion,
    this.idCambioPosicion,
  });
}

// Provider para obtener cambios de posición
final cambioPosicionProvider =
    FutureProvider.family<List<CambioDePosicion>, CambioPosicionParams>(
  (ref, params) async {
    final repository = ref.watch(cambioPosicionRepositoryProvider);

    try {
      List<CambioDePosicion> cambios;

      if (params.idCambioPosicion != null) {
        final cambio = await repository.getCambioPosicionById(
          params.idIngreso,
          params.idRegistroDiario,
          params.idCambioPosicion!,
        );
        cambios = cambio != null ? [cambio] : [];
      } else {
        cambios = await repository.getCambiosDePosicion(
          params.idIngreso,
          params.idRegistroDiario,
        );
      }

      return cambios;
    } catch (e) {
      throw Exception('Error al obtener cambios de posición: $e');
    }
  },
);

// Provider para guardar/actualizar cambios de posición
final guardarCambioPosicionProvider =
    FutureProvider.family<void, GuardarCambioPosicionParams>(
  (ref, params) async {
    final repository = ref.watch(cambioPosicionRepositoryProvider);

    try {
      if (params.idCambioPosicion != null) {
        // Actualización
        await repository.actualizarCambioPosicion(
          params.idIngreso,
          params.idRegistroDiario,
          params.idCambioPosicion!,
          params.hora,
          params.posicion,
        );
      } else {
        // Creación
        await repository.guardarCambioPosicion(
          params.idIngreso,
          params.idRegistroDiario,
          params.hora,
          params.posicion,
        );
      }
    } catch (e, stackTrace) {
      debugPrintStack(stackTrace: stackTrace);
      throw Exception('Error al guardar cambio de posición: $e');
    }
  },
);

// Provider para el último cambio
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

// Provider para eliminar un cambio
final eliminarCambioPosicionProvider =
    FutureProvider.family<void, CambioPosicionParams>(
  (ref, params) async {
    final repository = ref.watch(cambioPosicionRepositoryProvider);

    try {
      if (params.idCambioPosicion != null) {
        await repository.eliminarCambioPosicion(
          params.idIngreso,
          params.idRegistroDiario,
          params.idCambioPosicion!,
        );
      }
    } catch (e, stackTrace) {
      debugPrintStack(stackTrace: stackTrace);
      throw Exception('Error al eliminar cambio de posición: $e');
    }
  },
);
