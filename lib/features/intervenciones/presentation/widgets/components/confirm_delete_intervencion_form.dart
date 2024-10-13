import 'package:flutter/material.dart';
import 'package:registro_uci/features/firmas/domain/models/reporte_params.dart';
import 'package:registro_uci/features/intervenciones/presentation/widgets/components/buttons/delete_intervencion_form_button.dart';

class ConfirmDeleteIntervencionForm extends StatelessWidget {
  const ConfirmDeleteIntervencionForm({
    super.key,
    required this.idIntervencion,
    required this.params,
  });

  final String idIntervencion;
  final ReporteParams params;
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
            "Confirmar Eliminación",
            style: Theme.of(context).textTheme.headlineLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),

          // Body
          Text(
            "¿Estás seguro de que deseas eliminar esta intervencion?",
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),

          // Delete Button
          DeleteIntervencionFormButton(
            idIntervencion: idIntervencion,
            params: params,
          ),
        ],
      ),
    );
  }
}
