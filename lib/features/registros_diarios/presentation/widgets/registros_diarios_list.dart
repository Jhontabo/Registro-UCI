import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/features/registros_diarios/data/providers/registros_diarios_de_ingreso_provider.dart';
import 'package:registro_uci/features/registros_diarios/presentation/widgets/components/registro_diario_tile.dart';

class RegistrosDiariosList extends ConsumerWidget {
  final String idIngreso;
  const RegistrosDiariosList({super.key, required this.idIngreso});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registrosDiarios =
        ref.watch(registrosDiariosDeIngresoProvider(idIngreso));
    return registrosDiarios.when(
      data: (data) {
        return ListView.separated(
          itemCount: data.length,
          itemBuilder: (context, index) => RegistroDiarioTile(
            registroDiario: data.elementAt(index),
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
