import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/components/buttons/secondary_button.dart';
import 'package:registro_uci/constants/intervenciones.dart';
import 'package:registro_uci/features/firmas/domain/models/reporte_params.dart';
import 'package:registro_uci/features/intervenciones/data/providers/intervenciones_de_registro_provider.dart';
import 'package:registro_uci/features/intervenciones/presentation/widgets/components/buttons/add_intervenciones_to_registro_form_button.dart';

class AddIntervencionesForm extends ConsumerStatefulWidget {
  final ReporteParams params;
  const AddIntervencionesForm({
    super.key,
    required this.params,
  });

  @override
  ConsumerState<AddIntervencionesForm> createState() =>
      _AddIntervencionesFormState();
}

class _AddIntervencionesFormState extends ConsumerState<AddIntervencionesForm> {
  // Map to track the selection of each Intervencion
  final Map<String, bool> _selectedItems = {};

  @override
  void initState() {
    super.initState();
    // Initialize all items as unselected based on the mapaIntervenciones
    mapaIntervenciones.forEach((idNIC, intervencion) {
      _selectedItems[idNIC] = false;
    });
  }

  // Function to check if any item is selected
  bool _isAnyItemSelected() {
    return _selectedItems.values.contains(true);
  }

  // Function to handle button press
  List<String> _getIntervencionesIds() {
    return _selectedItems.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final intervencionesAsync =
        ref.watch(intervencionesDeRegistroProvider(widget.params));

    return SizedBox(
      height: screenHeight * 0.6,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Título
            Text(
              "Agregar Intervenciones",
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Manejo de estados del provider
            intervencionesAsync.when(
              loading: () => const Expanded(
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (error, stackTrace) => Expanded(
                child: Center(child: Text('Error: ${error.toString()}')),
              ),
              data: (intervenciones) {
                final filteredIntervenciones = mapaIntervenciones.values
                    .where(
                      (intervencion) => !intervenciones
                          .any((i) => i.idNIC == intervencion.idNIC),
                    )
                    .toList();

                if (filteredIntervenciones.isEmpty) {
                  return Expanded(
                    child: Center(
                      child: Text(
                        'No hay intervenciones disponibles para agregar',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  );
                }

                return Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children:
                                filteredIntervenciones.map((intervencion) {
                              return CheckboxListTile(
                                key: ValueKey(intervencion.idNIC),
                                title: RichText(
                                  text: TextSpan(
                                    text: '${intervencion.idNIC}  ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                    children: [
                                      TextSpan(
                                        text: intervencion.nombre,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                value:
                                    _selectedItems[intervencion.idNIC] ?? false,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _selectedItems[intervencion.idNIC] =
                                        value ?? false;
                                  });
                                },
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                              );
                            }).toList(),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Botones de acción
                      AddIntervencionesToRegistroFormButton(
                        enabled: _isAnyItemSelected(),
                        intervencionesIds: _getIntervencionesIds(),
                        params: widget.params,
                      ),
                      const SizedBox(height: 10),
                      SecondaryButton(
                        child: const Text("Cancelar"),
                        onTap: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
