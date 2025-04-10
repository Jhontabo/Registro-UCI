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
        return ListView.separated(
          itemCount: data.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => CambioPosicionTile(
            cambio: data[index],
            params: params,
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          padding: const EdgeInsets.all(15),
        );
      },
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
