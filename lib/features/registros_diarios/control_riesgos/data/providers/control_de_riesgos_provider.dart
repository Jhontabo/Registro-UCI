import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/foundation.dart';
import 'package:registro_uci/features/registros_diarios/control_riesgos/data/repositories/firabase_control_de_riesgos.dart';
import 'package:registro_uci/features/registros_diarios/control_riesgos/domain/models/control_de_riesgos.dart';
import 'package:registro_uci/features/registros_diarios/control_riesgos/data/abstract_repositories/control_de_riesgos_repository.dart';

// El Provider para el repositorio
final controlDeRiesgosRepositoryProvider = Provider<ControlDeRiesgosRepository>(
  (ref) =>
      FirebaseControlDeRiesgosRepository(), // Asegúrate de tener la clase `FirebaseControlDeRiesgosRepository` bien definida
);

/// Parámetros necesarios para obtener los controles de riesgos.
@immutable
class ControlDeRiesgosParams {
  final String idIngreso;
  final String idRegistroDiario;

  const ControlDeRiesgosParams({
    required this.idIngreso,
    required this.idRegistroDiario,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ControlDeRiesgosParams &&
        other.idIngreso == idIngreso &&
        other.idRegistroDiario == idRegistroDiario;
  }

  @override
  int get hashCode => Object.hash(idIngreso, idRegistroDiario);
}

/// Provider para obtener los controles de riesgos desde Firestore
final controlDeRiesgosProvider =
    FutureProvider.family<List<ControlDeRiesgos>, ControlDeRiesgosParams>(
        (ref, params) async {
  final repository = ref.watch(controlDeRiesgosRepositoryProvider);

  try {
    return await repository.getControlDeRiesgos(
      params.idIngreso,
      params.idRegistroDiario,
    );
  } catch (e) {
    throw Exception('Error al obtener los controles de riesgos: $e');
  }
});
