import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:registro_uci/common/components/bed_widget.dart';
import 'package:registro_uci/common/components/buttons/primary_button.dart';
import 'package:registro_uci/features/firmas/domain/models/firma.dart';
import 'package:registro_uci/features/firmas/presentation/widgets/components/confirm_firmar_reporte_form.dart';
import 'package:registro_uci/features/necesidades/data/providers/necesidades_de_registro_provider.dart';
import 'package:registro_uci/features/necesidades/presentation/widgets/components/buttons/necesidades_menu_FAB.dart';
import 'package:registro_uci/features/necesidades/presentation/widgets/components/create_necesidad_form.dart';
import 'package:registro_uci/features/necesidades/presentation/widgets/necesidades_list.dart';

class NecesidadesPage extends StatelessWidget {
  final String idIngreso;
  final String idRegistro;
  final Firma? firma;

  const NecesidadesPage({
    super.key,
    required this.idIngreso,
    required this.idRegistro,
    this.firma,
  });

  @override
  Widget build(BuildContext context) {
    final params =
        NecesidadesParams(idIngreso: idIngreso, idRegistro: idRegistro);
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
          NecesidadesList(
            idIngreso: idIngreso,
            idRegistro: idRegistro,
          ),
          firma == null
              ? FirmarReporteButton(
                  params: params,
                  tipoFirma: "firmaNecesidades",
                )
              : FirmaWidget(firma: firma!)
        ],
      ),
      floatingActionButton: NecesidadFloatingActionButton(
        onCreate: () => showCreateNecesidadDialog(context, params),
        onImport: () => showImportNecesidadDialog(context),
      ),
    );
  }

  void showCreateNecesidadDialog(BuildContext context, params) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: CreateNecesidadForm(params: params),
        );
      },
    );
  }

  void showImportNecesidadDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Importar Necesidades'),
          content: const Text(
              'Aquí irá la funcionalidad para importar necesidades.'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cerrar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class FirmaWidget extends StatefulWidget {
  final Firma firma;

  const FirmaWidget({super.key, required this.firma});

  @override
  FirmaWidgetState createState() => FirmaWidgetState();
}

class FirmaWidgetState extends State<FirmaWidget> {
  bool _isExpanded = false; // Tracks if the widget is expanded or not

  @override
  Widget build(BuildContext context) {
    // Format the date and time elegantly
    final DateFormat dateFormat = DateFormat('EEEE, MMMM d');
    final DateFormat timeFormat = DateFormat('hh:mm a');

    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded; // Toggle expanded state on tap
        });
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .7,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedContainer(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              duration: const Duration(milliseconds: 300), // Animation duration
              curve: Curves.easeInOut, // Smooth curve for animation
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.amber.shade50,
              ),
              width: MediaQuery.of(context).size.width * .7,
              // Animate height based on expanded state
              height: _isExpanded
                  ? 140
                  : 50, // Adjust height for expanded/compressed
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Header for Certificate Style
                      Text(
                        'Reporte Firmado',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade800,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // Use AnimatedOpacity to delay the content appearance until expansion is done
                  // AnimatedOpacity(
                  //   opacity: _isExpanded ? 1.0 : 0.0,
                  //   duration: const Duration(milliseconds: 300),
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       if (_isExpanded) ...[
                  //         const SizedBox(height: 40),
                  //         // Firma Name styled as signature
                  //         Text(
                  //           widget.firma.nombreFirma,
                  //           style: const TextStyle(
                  //             fontFamily:
                  //                 'Sacramento', // Custom font for signature style
                  //             fontSize: 35,
                  //             fontWeight: FontWeight.w400,
                  //             color: Colors.black87,
                  //             height: .6,
                  //           ),
                  //           textAlign: TextAlign.center,
                  //         ),
                  //         Divider(
                  //           color: Colors.grey.shade400,
                  //           thickness: 1.0,
                  //         ),
                  //         // Display Firma Date and Time
                  //         Text(
                  //           'Fecha: ${dateFormat.format(widget.firma.fechaFirma)}\nHora: ${timeFormat.format(widget.firma.fechaFirma)}',
                  //           style: TextStyle(
                  //             fontSize: 14,
                  //             color: Colors.grey.shade700,
                  //           ),
                  //           textAlign: TextAlign.center,
                  //         ),
                  //       ],
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
            AnimatedOpacity(
              opacity: _isExpanded ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: Visibility(
                visible: _isExpanded,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (true) ...[
                      const SizedBox(height: 40),
                      // Firma Name styled as signature
                      Text(
                        widget.firma.nombreFirma,
                        style: const TextStyle(
                          fontFamily:
                              'Sacramento', // Custom font for signature style
                          fontSize: 35,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87,
                          height: .6,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      // Divider(
                      //   color: Colors.grey.shade400,
                      //   thickness: 1.0,
                      // ),
                      // Display Firma Date and Time
                      Text(
                        'Fecha: ${dateFormat.format(widget.firma.fechaFirma)}\nHora: ${timeFormat.format(widget.firma.fechaFirma)}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FirmarReporteButton extends StatelessWidget {
  final NecesidadesParams params;
  final String tipoFirma;

  const FirmarReporteButton(
      {super.key, required this.params, required this.tipoFirma});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 20,
      ),
      child: PrimaryButton(
        minWidth: MediaQuery.of(context).size.width * .7,
        backgroundColor: Theme.of(context).colorScheme.primary,
        splashColor: Colors.blueAccent,
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: ConfirmFirmarReporteForm(
                  params: params,
                  tipoFirma: tipoFirma,
                ),
              );
            },
          );
        },
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.edit_note_rounded,
              color: Colors.white,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "Firmar Reporte",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
