import 'package:flutter/material.dart';
import 'package:registro_uci/features/necesidades/data/providers/necesidades_de_registro_provider.dart';
import 'package:registro_uci/features/necesidades/domain/models/necesidad.dart';
import 'package:registro_uci/features/necesidades/presentation/widgets/components/buttons/delete_necesidad_icon_button.dart';
import 'package:registro_uci/features/necesidades/presentation/widgets/components/buttons/update_necesidad_icon_button.dart';

class NecesidadActionButtons extends StatelessWidget {
  final Necesidad necesidad;
  final NecesidadesParams params;

  const NecesidadActionButtons({
    super.key,
    required this.params,
    required this.necesidad,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DeleteNecesidadIconButton(
          idNecesidad: necesidad.idNecesidad,
          params: params,
        ),
        UpdateNecesidadIconButton(
          params: params,
          necesidad: necesidad,
        ),
      ],
    );
  }
}
