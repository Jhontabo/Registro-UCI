import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/features/control_cambio_posicion/data/providers/cambio_posicion_provider.dart';
import 'package:registro_uci/features/control_cambio_posicion/presentation/widgets/components/cambio_posicion_tile.dart';

class CambioPosicionList extends ConsumerWidget {
  final String idIngreso;
  final String idRegistroDiario;

  const CambioPosicionList({
    super.key,
    required this.idIngreso,
    required this.idRegistroDiario,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final params = CambioPosicionParams(
      idIngreso: idIngreso,
      idRegistroDiario: idRegistroDiario,
    );

    final cambios = ref.watch(cambioPosicionProvider(params));

    return cambios.when(
      data: (data) {
        if (data.isEmpty) {
          return const Center(child: Text('No hay horarios disponibles'));
        }

        return ListView.separated(
          itemCount: data.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => CambioPosicionTile(
            cambio: data[index],
            params: params,
          ),
          separatorBuilder: (context, index) => const Divider(height: 1),
          padding: const EdgeInsets.symmetric(vertical: 8),
        );
      },
      error: (error, stackTrace) =>
          Center(child: Text('Error: ${error.toString()}')),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
