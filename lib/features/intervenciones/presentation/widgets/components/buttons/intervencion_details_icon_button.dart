import 'package:flutter/material.dart';
import 'package:registro_uci/common/components/icon_buttons/details_icon_button.dart';
import 'package:registro_uci/features/firmas/domain/models/reporte_params.dart';
import 'package:registro_uci/features/intervenciones/domain/models/intervencion.dart';
import 'package:registro_uci/pages/intervencion_page.dart';

class IntervencionDetailsIconButton extends StatelessWidget {
  final Intervencion intervencion;
  final ReporteParams params;

  const IntervencionDetailsIconButton({
    super.key,
    required this.params,
    required this.intervencion,
  });

  @override
  Widget build(BuildContext context) {
    return DetailsIconButton(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return IntervencionPage(
                intervencion: intervencion,
              );
            },
          ),
        );
      },
    );
  }
}
