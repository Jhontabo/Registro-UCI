import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/components/bed_widget.dart';
import 'package:registro_uci/features/auth/data/providers/user_role_provider.dart';
import 'package:registro_uci/features/auth/domain/enums/user_role.dart';
import 'package:registro_uci/features/firmas/domain/models/firma.dart';
import 'package:registro_uci/features/firmas/domain/models/reporte_params.dart';
import 'package:registro_uci/features/firmas/presentation/widgets/components/buttons/firmar_reporte_button.dart';
import 'package:registro_uci/features/firmas/presentation/widgets/components/firma_widget.dart';
import 'package:registro_uci/features/intervenciones/presentation/widgets/add_intervenciones_form.dart';
import 'package:registro_uci/features/intervenciones/presentation/widgets/import_intervenciones_form.dart';
import 'package:registro_uci/features/intervenciones/presentation/widgets/intervenciones_list.dart';
import 'package:registro_uci/features/intervenciones/presentation/widgets/components/buttons/intervenciones_floating_button.dart';
import 'package:registro_uci/features/necesidades/presentation/widgets/components/create_necesidad_form.dart';

class IntervencionesPage extends ConsumerWidget {
  final String idIngreso;
  final String idRegistro;
  final Firma? firma;

  const IntervencionesPage({
    super.key,
    required this.idIngreso,
    required this.idRegistro,
    this.firma,
  });

  @override
  Widget build(BuildContext context, ref) {
    final params = ReporteParams(idIngreso: idIngreso, idRegistro: idRegistro);

    final role = ref.watch(roleProvider);

    final canSign = firma == null && role == UserRole.headNurse;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(child: Text("Lista de Necesidades")),
            const SizedBox(width: 10),
            BedProviderWidget(
              idIngreso: idIngreso,
              redirectable: true,
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IntervencionesList(
            idIngreso: idIngreso,
            idRegistro: idRegistro,
            readOnly: firma != null || role != UserRole.headNurse,
          ),
          canSign
              ? FirmarReporteButton(
                  params: params,
                  tipoFirma: "firmaNecesidades",
                )
              : firma != null
                  ? FirmaWidget(firma: firma!)
                  : const SizedBox()
        ],
      ),
      floatingActionButton: Visibility(
        visible: role == UserRole.headNurse && firma == null,
        child: IntervencionesFloatingButton(
          // onCreate: () => showCreateNecesidadDialog(context, params),
          onImport: () => showImportNecesidadDialog(context, params),
          onAdd: () => showAddIntervencionesDialog(context, params),
        ),
      ),
    );
  }

  void showCreateNecesidadDialog(BuildContext context, ReporteParams params) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: CreateNecesidadForm(params: params),
        );
      },
    );
  }

  void showImportNecesidadDialog(BuildContext context, ReporteParams params) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: ImportIntervencionesForm(
            idIngreso: idIngreso,
            idRegistroToOmit: idRegistro,
          ),
        );
      },
    );
  }

  void showAddIntervencionesDialog(BuildContext context, ReporteParams params) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: AddIntervencionesForm(
            params: params,
          ),
        );
      },
    );
  }
}
