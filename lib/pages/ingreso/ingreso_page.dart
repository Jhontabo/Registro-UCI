import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/components/bed_widget.dart';
import 'package:registro_uci/features/ingresos/data/providers/ingreso_by_id_provider.dart';
import 'package:registro_uci/features/ingresos/presentation/widgets/components/tiles/cateteres_tile.dart';
import 'package:registro_uci/features/ingresos/presentation/widgets/components/tiles/detalles_ingreso_tile.dart';
import 'package:registro_uci/features/ingresos/presentation/widgets/components/tiles/marcapasos_tile.dart';
import 'package:registro_uci/features/ingresos/presentation/widgets/components/tiles/procedimientos_especiales_tile.dart';
import 'package:registro_uci/features/ingresos/presentation/widgets/components/tiles/registros_diarios_tile.dart';
import 'package:registro_uci/features/ingresos/presentation/widgets/components/tiles/sondas_tile.dart';
import 'package:registro_uci/features/ingresos/presentation/widgets/components/tiles/terminar_ingreso_tile.dart';
import 'package:registro_uci/features/ingresos/presentation/widgets/components/tiles/tratamientos_antibioticos_tile.dart';
import 'package:registro_uci/pages/loading_page.dart';

class IngresoPage extends ConsumerWidget {
  final String idIngreso;
  const IngresoPage({
    super.key,
    required this.idIngreso,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ingreso = ref.watch(ingresoByIdProvider(idIngreso));

    return ingreso.when(
      data: (data) {
        if (data == null) return const Text("Ingreso no existe");

        return Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text("Ingreso de ${data.nombrePaciente}")),
                const SizedBox(width: 10),
                BedProviderWidget(
                  idIngreso: data.idIngreso,
                  redirectable: true,
                ),
              ],
            ),
          ),
          body: ListView(
            padding: const EdgeInsets.all(15),
            children: [
              DetallesIngresoTile(idIngreso: data.idIngreso),
              const SizedBox(height: 10),
              RegistrosDiariosTile(idIngreso: data.idIngreso),
              const SizedBox(height: 10),
              TratamientosAntibioticosTile(idIngreso: data.idIngreso),
              const SizedBox(height: 10),
              ProcedimientosEspecialesTile(idIngreso: data.idIngreso),
              const SizedBox(height: 10),
              MarcapasosTile(
                  idIngreso: data.idIngreso), // ✅ Se obtiene correctamente
              const SizedBox(height: 10),
              CateteresTile(idIngreso: data.idIngreso),
              const SizedBox(
                height: 10,
              ),
              SondasTile(idIngreso: idIngreso),
              const SizedBox(height: 10),
              TerminarIngresoTile(idIngreso: data.idIngreso),
            ],
          ),
        );
      },
      error: (error, stackTrace) => Text("Error: ${error.toString()}"),
      loading: () => const LoadingPage(),
    );
  }
}
