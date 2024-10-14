import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/providers/repository_providers.dart';
import 'package:registro_uci/features/antibioticos/data/providers/dias_tratamiento_provider.dart';
import 'package:registro_uci/features/antibioticos/presentation/widgets/components/dia_tratamiento_tile.dart';

class DiasTratamientoList extends ConsumerWidget {
  final String idIngreso;
  final String idTratamientoAntibiotico;

  const DiasTratamientoList({
    super.key,
    required this.idIngreso,
    required this.idTratamientoAntibiotico,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final diasTratamiento = ref.watch(diasTratamientoProvider(
      DiasTratamientoParams(
        idIngreso: idIngreso,
        idTratamientoAntibiotico: idTratamientoAntibiotico,
      ),
    ));

    Future<void> refresh() {
      ref.read(diasTratamientoRepositoryProvider).refreshDiasTratamiento(
            idIngreso,
            idTratamientoAntibiotico,
          );

      ref.invalidate(diasTratamientoProvider(
        DiasTratamientoParams(
          idIngreso: idIngreso,
          idTratamientoAntibiotico: idTratamientoAntibiotico,
        ),
      ));

      return Future.value(null);
    }

    return diasTratamiento.when(
      data: (data) {
        return RefreshIndicator(
          onRefresh: refresh,
          child: ListView.separated(
            itemCount: data.length,
            itemBuilder: (context, index) => DiaTratamientoTile(
              diaTratamiento: data.elementAt(index),
              idIngreso: idIngreso,
              idTratamientoAntibiotico: idTratamientoAntibiotico,
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            padding: const EdgeInsets.all(15),
          ),
        );
      },
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      skipLoadingOnRefresh: false,
    );
  }
}
