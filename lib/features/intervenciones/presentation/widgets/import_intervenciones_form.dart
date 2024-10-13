import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:registro_uci/features/intervenciones/presentation/widgets/components/buttons/import_intervenciones_form_button.dart';
import 'package:registro_uci/features/registros_diarios/data/providers/registros_diarios_de_ingreso_provider.dart'; // For formatting the date

class ImportIntervencionesForm extends ConsumerStatefulWidget {
  final String idIngreso;
  final String idRegistroToOmit;

  const ImportIntervencionesForm({
    super.key,
    required this.idIngreso,
    required this.idRegistroToOmit,
  });

  @override
  ConsumerState<ImportIntervencionesForm> createState() =>
      _SelectRegistroDiarioFormState();
}

class _SelectRegistroDiarioFormState
    extends ConsumerState<ImportIntervencionesForm> {
  String? _selectedFechaRegistro;

  // Function to handle button press
  void _confirmSelection() {
    if (_selectedFechaRegistro != null) {
      print("Registro Diario seleccionado: $_selectedFechaRegistro");
      // Handle further actions
    }
  }

  bool _isEnabled() {
    if (_selectedFechaRegistro != null) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    print(widget.idRegistroToOmit);

    final screenHeight = MediaQuery.of(context).size.height;
    final registrosDiariosAsync = ref.watch(
      registrosDiariosDeIngresoProvider(widget.idIngreso),
    );

    return SizedBox(
      height:
          screenHeight * 0.6, // Set the form height to 60% of the screen height
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Title
            Text(
              "Seleccionar Registro Diario",
              style: Theme.of(context).textTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Check if registrosDiarios data is loaded
            registrosDiariosAsync.when(
              data: (registrosDiarios) {
                // Filter out the record with idRegistroToOmit
                final filteredRegistros = registrosDiarios
                    .where((registro) =>
                        registro.idRegistroDiario != widget.idRegistroToOmit)
                    .toList();

                return Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: filteredRegistros.map((registro) {
                        final formattedDate = DateFormat('dd/MM/yyyy')
                            .format(registro.fechaRegistro);
                        return RadioListTile<String>(
                          title: Text(formattedDate),
                          value:
                              registro.idRegistroDiario, // Use the id as value
                          groupValue: _selectedFechaRegistro,
                          onChanged: (String? value) {
                            setState(() {
                              _selectedFechaRegistro = value;
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ),
                );
              },
              loading: () => const CircularProgressIndicator(),
              error: (err, stack) => Text('Error: $err'),
            ),
            const SizedBox(height: 20),

            ImportIntervencionesFormButton(
              idIngreso: widget.idIngreso,
              originRegistroId: _selectedFechaRegistro ?? '',
              targetRegistroId: widget.idRegistroToOmit,
              enabled: _isEnabled(),
            ),
            // Confirm Button
            // ElevatedButton(
            //   onPressed:
            //       _selectedFechaRegistro != null ? _confirmSelection : null,
            //   child: const Text(
            //     "CONFIRMAR",
            //     style: TextStyle(color: Colors.white),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
