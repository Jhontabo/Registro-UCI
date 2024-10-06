import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/components/icon_buttons/delete_icon_button.dart';
import 'package:registro_uci/features/firmas/domain/models/necesidades_params.dart';
import 'package:registro_uci/features/necesidades/presentation/widgets/components/confirm_delete_necesidad_form.dart';

class DeleteNecesidadIconButton extends ConsumerWidget {
  final String idNecesidad;
  final ReporteParams params;

  const DeleteNecesidadIconButton({
    super.key,
    required this.params,
    required this.idNecesidad,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DeleteIconButton(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: ConfirmDeleteNecesidadForm(
                  idNecesidad: idNecesidad, params: params),
            );
          },
        );
      },
    );
  }
}
