import 'package:flutter/material.dart';
import 'package:registro_uci/features/firmas/domain/models/reporte_params.dart';
import 'package:registro_uci/features/firmas/presentation/widgets/components/buttons/firmar_reporte_form_button.dart';

class ConfirmFirmarReporteForm extends StatelessWidget {
  const ConfirmFirmarReporteForm({
    super.key,
    required this.params,
    required this.tipoFirma,
  });

  final ReporteParams params;
  final String tipoFirma;

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
            "Confirmar Firma",
            style: Theme.of(context).textTheme.headlineLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),

          // Body
          Text(
            "¿Estás seguro de que deseas firmar este reporte?",
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),

          // Delete Button
          FirmarReporteFormButton(
            tipoFirma: tipoFirma,
            params: params,
          ),
        ],
      ),
    );
  }
}
