import 'package:flutter/material.dart';
import 'package:registro_uci/features/registros_diarios/balance_liquidos/administrados/data/providers/liquidos_administrados_provider.dart';
import 'package:registro_uci/features/registros_diarios/balance_liquidos/administrados/presentation/widgets/components/buttons/confirm_delete_liquido_administrado_form_button.dart';

class ConfirmDeleteLiquidoAdministrado extends StatelessWidget {
  const ConfirmDeleteLiquidoAdministrado({
    super.key,
    required this.idLiquidoAdministrado,
    required this.params,
  });

  final String idLiquidoAdministrado;
  final LiquidosAdministradosParams params;
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
            "Confirmar Eliminar Liquido Administrado",
            style: Theme.of(context).textTheme.headlineLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),

          // Body
          Text(
            "¿Estás seguro de que deseas eliminar este liquido administrado?",
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),

          // Delete Button
          DeleteLiquidoAdministradoFormButton(
            params: params,
            idLiquidoAdministrado: idLiquidoAdministrado,
          ),
        ],
      ),
    );
  }
}
