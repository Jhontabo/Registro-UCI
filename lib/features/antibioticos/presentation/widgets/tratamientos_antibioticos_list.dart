import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/features/antibioticos/data/providers/tratamientos_antibioticos_de_ingreso_provider.dart';
import 'package:registro_uci/features/antibioticos/presentation/widgets/components/tratamiento_antibiotico_widget.dart';

class TratamientosAntibioticosList extends ConsumerWidget {
  final String idIngreso;
  const TratamientosAntibioticosList({super.key, required this.idIngreso});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registrosDiarios =
        ref.watch(tratamientosAntibioticosProvider(idIngreso));
    return registrosDiarios.when(
      data: (data) {
        return ListView.separated(
          itemCount: data.length,
          itemBuilder: (context, index) => TratamientoAntibioticoWidget(
            tratamientoAntibiotico: data.elementAt(index),
            idIngreso: idIngreso,
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
