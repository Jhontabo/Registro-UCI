import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/features/firmas/domain/models/reporte_params.dart';
import 'package:registro_uci/features/intervenciones/data/providers/intervenciones_de_registro_provider.dart';
import 'package:registro_uci/features/intervenciones/presentation/widgets/components/intervencion_widget.dart';
import 'package:registro_uci/features/necesidades/domain/models/necesidad.dart';
import 'package:registro_uci/features/necesidades/presentation/widgets/necesidad_action_buttons.dart';

class IntervencionesList extends ConsumerWidget {
  final String idIngreso;
  final String idRegistro;
  final bool readOnly;

  const IntervencionesList({
    super.key,
    required this.idIngreso,
    required this.idRegistro,
    required this.readOnly,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final params = ReporteParams(
      idIngreso: idIngreso,
      idRegistro: idRegistro,
    );
    final intervenciones = ref.watch(intervencionesDeRegistroProvider(params));

    return intervenciones.when(
      data: (data) {
        return Expanded(
          // height: MediaQuery.of(context).size.height * .3,
          child: SingleChildScrollView(
            child: Column(
              children: data
                  .map(
                    (intervencion) => IntervencionWidget(
                      intervencion: intervencion,
                      params: params,
                      readOnly: readOnly,
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      },
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const CircularProgressIndicator(),
    );
  }
}

class NecesidadWidget extends StatelessWidget {
  final Necesidad necesidad;
  final ReporteParams params;
  final bool readOnly;

  const NecesidadWidget({
    super.key,
    required this.necesidad,
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
              Expanded(child: Text(necesidad.nombreNecesidad)),
              Visibility(
                visible: !readOnly,
                child: NecesidadActionButtons(
                  necesidad: necesidad,
                  params: params,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
