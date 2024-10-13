import 'package:flutter/material.dart';
import 'package:registro_uci/common/components/buttons/primary_button.dart';
import 'package:registro_uci/features/firmas/domain/models/reporte_params.dart';
import 'package:registro_uci/features/firmas/presentation/widgets/components/confirm_firmar_reporte_form.dart';

class FirmarReporteButton extends StatelessWidget {
  final ReporteParams params;
  final String tipoFirma;

  const FirmarReporteButton(
      {super.key, required this.params, required this.tipoFirma});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 20,
      ),
      child: PrimaryButton(
        minWidth: MediaQuery.of(context).size.width * .7,
        backgroundColor: Theme.of(context).colorScheme.primary,
        splashColor: Colors.blueAccent,
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: ConfirmFirmarReporteForm(
                  params: params,
                  tipoFirma: tipoFirma,
                ),
              );
            },
          );
        },
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.edit_note_rounded,
              color: Colors.white,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "Firmar Reporte",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
