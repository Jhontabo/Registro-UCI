import 'package:flutter/material.dart';
import 'package:registro_uci/features/antibioticos/presentation/widgets/create_tratamiento_antibiotico_form.dart';

class CreateTratamientoAntibioticoFAB extends StatelessWidget {
  const CreateTratamientoAntibioticoFAB({
    super.key,
    required this.idIngreso,
  });

  final String idIngreso;

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      padding: const EdgeInsets.all(15),
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
          Theme.of(context).colorScheme.secondary,
        ),
      ),
      iconSize: 28,
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: CreateTratamientoAntibioticoForm(idIngreso: idIngreso),
            );
          },
        );
      },
      icon: const Icon(Icons.add),
    );
  }
}
