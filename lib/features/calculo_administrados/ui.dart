// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart'; // For formatting the date
import 'package:registro_uci/features/calculo_administrados/providers.dart';

class BalanceCard extends ConsumerWidget {
  final String idIngreso;
  final String idRegistroDiario;

  const BalanceCard({
    super.key,
    required this.idIngreso,
    required this.idRegistroDiario,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Retrieve the current balance data
    final balanceParams =
        BalanceParams(idIngreso: idIngreso, idRegistroDiario: idRegistroDiario);
    final balanceData = ref.watch(totalBalanceProvider(balanceParams));

    return Card(
      margin: const EdgeInsets.all(16.0),
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Balance Acumulado',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8.0),
            balanceData.when(
              data: (data) {
                // Format fechaCalculoTotalAdministrados if it exists
                final fechaCalculoTotalAdministrados =
                    data['fechaCalculoTotalAdministrados'] != null
                        ? DateFormat.yMd().add_jm().format(
                            (data['fechaCalculoTotalAdministrados']
                                    as Timestamp)
                                .toDate())
                        : 'No disponible';
                final totalAdministrados = data['totalAdministrados'] ?? 0;
                final totalUntil =
                    data['totalAdministradoCalculatedUntil'] ?? 0;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Total Administrados: $totalAdministrados'),
                    Text('Fecha de Cálculo: $fechaCalculoTotalAdministrados'),
                    Text('Cálculo Hasta la Hora: $totalUntil'),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        _showUpdateDialog(context, ref);
                      },
                      child: const Text('Actualizar Cálculo'),
                    ),
                  ],
                );
              },
              loading: () => const CircularProgressIndicator(),
              error: (error, _) => Text('Error: $error'),
            ),
          ],
        ),
      ),
    );
  }

  // Method to show the update dialog
  void _showUpdateDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Selecciona la Hora'),
          content: UpdateCalculationDialogContent(
            idIngreso: idIngreso,
            idRegistroDiario: idRegistroDiario,
          ),
        );
      },
    );
  }
}

class UpdateCalculationDialogContent extends ConsumerStatefulWidget {
  final String idIngreso;
  final String idRegistroDiario;

  const UpdateCalculationDialogContent({
    super.key,
    required this.idIngreso,
    required this.idRegistroDiario,
  });

  @override
  _UpdateCalculationDialogContentState createState() =>
      _UpdateCalculationDialogContentState();
}

class _UpdateCalculationDialogContentState
    extends ConsumerState<UpdateCalculationDialogContent> {
  int selectedHora = 8; // Default starting hour

  @override
  Widget build(BuildContext context) {
    final orderedHours = List<int>.generate(
      24,
      (i) => ((i + 8) % 24 == 0) ? 24 : (i + 8) % 24,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DropdownButton<int>(
          value: selectedHora,
          items: orderedHours
              .map((hora) => DropdownMenuItem(
                    value: hora,
                    child: Text('Hora $hora'),
                  ))
              .toList(),
          onChanged: (value) {
            if (value != null) {
              setState(() {
                selectedHora = value;
              });
            }
          },
        ),
        const SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () async {
                await _calculateBalance(ref);
                Navigator.of(context).pop();
              },
              child: const Text('Calcular'),
            ),
          ],
        ),
      ],
    );
  }

  // Method to calculate balance and refresh the UI
  Future<void> _calculateBalance(WidgetRef ref) async {
    final calculateParams = CalculateParams(
      idIngreso: widget.idIngreso,
      idRegistroDiario: widget.idRegistroDiario,
      hora: selectedHora,
    );

    // Trigger the calculation
    await ref.read(calculateBalanceProvider(calculateParams).future);

    // Invalidate the provider to refresh the data
    ref.invalidate(totalBalanceProvider(BalanceParams(
      idIngreso: widget.idIngreso,
      idRegistroDiario: widget.idRegistroDiario,
    )));
  }
}
