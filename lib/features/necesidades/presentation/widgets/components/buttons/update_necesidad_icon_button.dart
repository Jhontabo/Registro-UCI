import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/components/icon_buttons/edit_icon_button.dart';
import 'package:registro_uci/features/firmas/domain/models/reporte_params.dart';
import 'package:registro_uci/features/necesidades/domain/models/necesidad.dart';
import 'package:registro_uci/features/necesidades/presentation/widgets/components/update_necesidad_form.dart';

class UpdateNecesidadIconButton extends ConsumerWidget {
  final Necesidad necesidad;
  final ReporteParams params;

  const UpdateNecesidadIconButton({
    super.key,
    required this.necesidad,
    required this.params,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return EditIconButton(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: UpdateNecesidadForm(
              necesidad: necesidad,
              params: params,
            ),
          ),
        );
      },
    );
  }
}
