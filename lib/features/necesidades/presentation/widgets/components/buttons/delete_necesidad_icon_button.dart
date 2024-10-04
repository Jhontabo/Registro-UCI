import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/components/icon_buttons/delete_icon_button.dart';
import 'package:registro_uci/features/necesidades/data/providers/necesidades_de_registro_provider.dart';
import 'package:registro_uci/features/necesidades/presentation/controllers/delete_necesidad_controller.dart';
import 'package:registro_uci/features/necesidades/presentation/widgets/components/confirm_delete_necesidad_form.dart';

class DeleteNecesidadIconButton extends ConsumerWidget {
  final String idNecesidad;
  final NecesidadesParams params;

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
