import 'package:flutter/material.dart';
import 'package:registro_uci/features/antibioticos/presentation/widgets/components/buttons/confirmar_finalizar_antibiotico_form_button.dart';

class ConfirmFinalizarAntibioticoForm extends StatelessWidget {
  final String idIngreso;
  final String idTratamientoAntibiotico;

  const ConfirmFinalizarAntibioticoForm(
      {super.key,
      required this.idIngreso,
      required this.idTratamientoAntibiotico});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Title
          Text(
            "Confirmar Finalizar Tratamiento",
            style: Theme.of(context).textTheme.headlineLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),

          // Body
          Text(
            "¿Estás seguro de que deseas eliminar este tratamiento?",
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),

          // Delete Button
          ConfirmarFinalizarAntibioticoFormButton(
            idIngreso: idIngreso,
            idTratamientoAntibiotico: idTratamientoAntibiotico,
          ),
        ],
      ),
    );
  }
}
