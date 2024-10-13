import 'package:flutter/material.dart';
import 'package:registro_uci/features/firmas/domain/models/reporte_params.dart';
import 'package:registro_uci/features/intervenciones/domain/models/intervencion.dart';
import 'package:registro_uci/features/intervenciones/presentation/widgets/components/buttons/delete_intervencion_icon_button.dart';
import 'package:registro_uci/features/intervenciones/presentation/widgets/components/buttons/intervencion_details_icon_button.dart';

class IntervencionActionButtons extends StatelessWidget {
  final Intervencion intervencion;
  final ReporteParams params;
  final bool readOnly;

  const IntervencionActionButtons({
    super.key,
    required this.params,
    required this.intervencion,
    required this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Visibility(
          visible: !readOnly,
          child: DeleteIntervencionIconButton(
            idIntervencion: intervencion.idIntervencion,
            params: params,
          ),
        ),
        IntervencionDetailsIconButton(
          params: params,
          intervencion: intervencion,
        ),
      ],
    );
  }
}
