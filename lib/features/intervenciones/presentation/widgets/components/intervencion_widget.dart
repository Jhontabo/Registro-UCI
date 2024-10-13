import 'package:flutter/material.dart';
import 'package:registro_uci/features/firmas/domain/models/reporte_params.dart';
import 'package:registro_uci/features/intervenciones/domain/models/intervencion.dart';
import 'package:registro_uci/features/intervenciones/presentation/widgets/components/intervencion_action_buttons.dart';

class IntervencionWidget extends StatelessWidget {
  final Intervencion intervencion;
  final ReporteParams params;
  final bool readOnly;

  const IntervencionWidget({
    super.key,
    required this.intervencion,
    required this.params,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${intervencion.idNIC}: ', // Bold part
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black, // Set color explicitly
                        ),
                      ),
                      TextSpan(
                        text: intervencion.nombre, // Regular part
                        style: const TextStyle(
                          color: Colors.black, // Set color explicitly
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              IntervencionActionButtons(
                intervencion: intervencion,
                params: params,
                readOnly: readOnly,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
