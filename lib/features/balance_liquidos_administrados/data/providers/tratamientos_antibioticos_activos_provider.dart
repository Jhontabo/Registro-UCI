import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/providers/repository_providers.dart';
import 'package:registro_uci/features/balance_liquidos_administrados/data/dto/create_liquido_administrado_dto.dart';

final getTratamientosAntibioticosActivosProvider = FutureProvider.family<
    List<CreateLiquidoAdministradoDto>,
    TratamientosAntibioticosActivosParams>((ref, params) async {
  final repository = ref.watch(
      liquidosAdministradosRepositoryProvider); // Assuming repository provider exists

  try {
    return await repository.getTratamientosAntibioticosActivos(
      params.idIngreso,
      params.hora,
    );
  } catch (e) {
    throw Exception('Error al obtener tratamientos antibióticos activos: $e');
  }
});

@immutable
class TratamientosAntibioticosActivosParams {
  final String idIngreso;
  final DateTime hora;

  const TratamientosAntibioticosActivosParams({
    required this.idIngreso,
    required this.hora,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TratamientosAntibioticosActivosParams &&
        other.idIngreso == idIngreso &&
        other.hora == hora;
  }

  @override
  int get hashCode => Object.hash(idIngreso, hora);
}
