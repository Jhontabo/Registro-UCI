import 'package:flutter/material.dart';
import 'package:registro_uci/common/components/icon_buttons/delete_icon_button.dart';
import 'package:registro_uci/features/firmas/domain/models/reporte_params.dart';
import 'package:registro_uci/features/intervenciones/presentation/widgets/components/confirm_delete_intervencion_form.dart';

class DeleteIntervencionIconButton extends StatelessWidget {
  final String idIntervencion;
  final ReporteParams params;

  const DeleteIntervencionIconButton({
    super.key,
    required this.params,
    required this.idIntervencion,
  });

  @override
  Widget build(BuildContext context) {
    return DeleteIconButton(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: ConfirmDeleteIntervencionForm(
                idIntervencion: idIntervencion,
                params: params,
              ),
            );
          },
        );
      },
    );
  }
}
