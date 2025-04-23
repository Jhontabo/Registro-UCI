import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/providers/repository_providers.dart';
import 'package:registro_uci/features/control_sedacion/domain/models/control_sedacion.dart';

@immutable
class ControlSedacionParams {
  final String idIngreso;
  final String idRegistroDiario;
  final String? idControlSedacion;

  const ControlSedacionParams({
    required this.idIngreso,
    required this.idRegistroDiario,
    this.idControlSedacion,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ControlSedacionParams &&
        other.idIngreso == idIngreso &&
        other.idRegistroDiario == idRegistroDiario &&
        other.idControlSedacion == idControlSedacion;
  }

  @override
  int get hashCode =>
      Object.hash(idIngreso, idRegistroDiario, idControlSedacion);
}

@immutable
class GuardarControlSedacionParams {
  final String idIngreso;
  final String idRegistroDiario;
  final int hora;
  final String observacion;
  final int rass;
  final String? idControlSedacion;
  final int? orden;

  const GuardarControlSedacionParams({
    required this.idIngreso,
    required this.idRegistroDiario,
    required this.hora,
    required this.observacion,
    required this.rass,
    this.idControlSedacion,
    this.orden,
  });
}

// Provider para obtener controles de sedación
final controlSedacionProvider =
    FutureProvider.family<List<ControlSedacion>, ControlSedacionParams>(
  (ref, params) async {
    final repository = ref.watch(controlSedacionRepositoryProvider);

    try {
      List<ControlSedacion> controles;

      if (params.idControlSedacion != null) {
        final control = await repository.getControlSedacionById(
          params.idIngreso,
          params.idRegistroDiario,
          params.idControlSedacion!,
        );
        controles = control != null ? [control] : [];
      } else {
        controles = await repository.getControlesSedacion(
          params.idIngreso,
          params.idRegistroDiario,
        );
      }

      return controles;
    } catch (e) {
      throw Exception('Error al obtener controles de sedación: $e');
    }
  },
);

// Provider para guardar/actualizar controles de sedación
final guardarControlSedacionProvider =
    FutureProvider.family<void, GuardarControlSedacionParams>(
  (ref, params) async {
    final repository = ref.watch(controlSedacionRepositoryProvider);

    try {
      if (params.idControlSedacion != null) {
        // Actualización
        await repository.actualizarControlSedacion(
          params.idIngreso,
          params.idRegistroDiario,
          params.idControlSedacion!,
          params.hora,
          params.observacion,
          params.rass,
          orden: params.orden,
        );
      } else {
        // Creación
        await repository.guardarControlSedacion(
          params.idIngreso,
          params.idRegistroDiario,
          params.hora,
          params.observacion,
          params.rass,
        );
      }
    } catch (e, stackTrace) {
      debugPrintStack(stackTrace: stackTrace);
      throw Exception('Error al guardar control de sedación: $e');
    }
  },
);

// Provider para el último control de sedación
final ultimoControlSedacionProvider =
    FutureProvider.family<ControlSedacion?, ControlSedacionParams>(
  (ref, params) async {
    final repository = ref.watch(controlSedacionRepositoryProvider);

    try {
      return await repository.getUltimoControlSedacion(
        params.idIngreso,
        params.idRegistroDiario,
      );
    } catch (e, stackTrace) {
      debugPrintStack(stackTrace: stackTrace);
      throw Exception('Error al obtener último control de sedación: $e');
    }
  },
);

// Provider para eliminar un control de sedación
final eliminarControlSedacionProvider =
    FutureProvider.family<void, ControlSedacionParams>(
  (ref, params) async {
    final repository = ref.watch(controlSedacionRepositoryProvider);

    try {
      if (params.idControlSedacion != null) {
        await repository.eliminarControlSedacion(
          params.idIngreso,
          params.idRegistroDiario,
          params.idControlSedacion!,
        );
      }
    } catch (e, stackTrace) {
      debugPrintStack(stackTrace: stackTrace);
      throw Exception('Error al eliminar control de sedación: $e');
    }
  },
);

// Provider para obtener el resumen de RASS
final resumenRASSProvider =
    FutureProvider.family<Map<String, int>, ControlSedacionParams>(
  (ref, params) async {
    final repository = ref.watch(controlSedacionRepositoryProvider);

    try {
      return await repository.getResumenRASS(
        params.idIngreso,
        params.idRegistroDiario,
      );
    } catch (e, stackTrace) {
      debugPrintStack(stackTrace: stackTrace);
      throw Exception('Error al obtener resumen de RASS: $e');
    }
  },
);

// Provider para reordenar controles de sedación
final reordenarControlesSedacionProvider = FutureProvider.family<void,
    ({String idIngreso, String idRegistroDiario, List<String> idsEnOrden})>(
  (ref, params) async {
    final repository = ref.watch(controlSedacionRepositoryProvider);

    try {
      await repository.reordenarControlesSedacion(
        params.idIngreso,
        params.idRegistroDiario,
        params.idsEnOrden,
      );
    } catch (e, stackTrace) {
      debugPrintStack(stackTrace: stackTrace);
      throw Exception('Error al reordenar controles de sedación: $e');
    }
  },
);
