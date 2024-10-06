import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:registro_uci/common/components/bed_widget.dart';
import 'package:registro_uci/common/extensions/capitalize.dart';
import 'package:registro_uci/features/firmas/domain/models/necesidades_params.dart';
import 'package:registro_uci/features/registros_diarios/data/providers/registro_diario_provider.dart';
import 'package:registro_uci/features/registros_diarios/presentation/widgets/components/tiles/control_de_liquidos_tile.dart';
import 'package:registro_uci/features/registros_diarios/presentation/widgets/components/tiles/control_de_posicion_tile.dart';
import 'package:registro_uci/features/registros_diarios/presentation/widgets/components/tiles/control_de_riesgos_tile.dart';
import 'package:registro_uci/features/registros_diarios/presentation/widgets/components/tiles/control_de_sedacion_tile.dart';
import 'package:registro_uci/features/registros_diarios/presentation/widgets/components/tiles/monitorias_hemodinamicas_tile.dart';
import 'package:registro_uci/features/registros_diarios/presentation/widgets/components/tiles/necesidades_tile.dart';
import 'package:registro_uci/features/registros_diarios/presentation/widgets/components/tiles/tratamientos_tile.dart';

class RegistroDiarioPage extends ConsumerWidget {
  final String idIngreso;
  final String idRegistro; // change to id
  const RegistroDiarioPage({
    super.key,
    required this.idIngreso,
    required this.idRegistro,
  });

  @override
  Widget build(BuildContext context, ref) {
    final registro = ref.watch(registroDiarioProvider(
        ReporteParams(idIngreso: idIngreso, idRegistro: idRegistro)));

    return registro.when(
      data: (registroDiario) {
        if (registroDiario == null) {
          return const Text("Sin registro");
        }
        return Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    DateFormat.MMMMEEEEd()
                        .format(registroDiario.fechaRegistro)
                        .capitalize(),
                  ),
                ),
                const SizedBox(width: 10),
                BedProviderWidget(
                  idIngreso: idIngreso,
                  redirectable: true,
                ),
              ],
            ),
          ),
          body: ListView(
            padding: const EdgeInsets.all(15),
            children: [
              NecesidadesTile(
                  idIngreso: idIngreso,
                  idRegistro: registroDiario.idRegistroDiario,
                  firma: registroDiario.firmaNecesidades),
              const SizedBox(height: 10),
              TratamientosTile(
                idIngreso: idIngreso,
                idRegistro: registroDiario.idRegistroDiario,
                completed: false, // set to true or false accordingly
              ),
              const SizedBox(height: 10),
              ControlDeRiesgosTile(
                idIngreso: idIngreso,
                idRegistro: registroDiario.idRegistroDiario,
                completed: true,
              ),
              const SizedBox(height: 10),
              MonitoriasHemodinamicasTile(
                idIngreso: idIngreso,
                idRegistro: registroDiario.idRegistroDiario,
                completed: false,
              ),
              const SizedBox(height: 10),
              ControlDeLiquidosTile(
                idIngreso: idIngreso,
                idRegistro: registroDiario.idRegistroDiario,
                completed: true,
              ),
              const SizedBox(height: 10),
              ControlDePosicionTile(
                idIngreso: idIngreso,
                idRegistro: registroDiario.idRegistroDiario,
                completed: false,
              ),
              const SizedBox(height: 10),
              ControlDeSedacionTile(
                idIngreso: idIngreso,
                idRegistro: registroDiario.idRegistroDiario,
                completed: true,
              ),
            ],
          ),
        );
      },
      error: (error, stackTrace) => const Scaffold(),
      loading: () => const Scaffold(),
    );
  }
}
