// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/features/registros_diarios/balance_liquidos/administrados/data/dto/create_liquido_administrado_dto.dart';
import 'package:registro_uci/features/registros_diarios/balance_liquidos/administrados/data/providers/liquidos_administrados_provider.dart';
import 'package:registro_uci/features/registros_diarios/balance_liquidos/administrados/data/providers/tratamientos_antibioticos_activos_provider.dart';
import 'package:registro_uci/features/registros_diarios/balance_liquidos/administrados/domain/models/liquido_administrado.dart';
import 'package:registro_uci/features/registros_diarios/balance_liquidos/administrados/presentation/controllers/create_many_liquidos_administrados_controller.dart';
import 'package:registro_uci/features/registros_diarios/balance_liquidos/administrados/presentation/widgets/components/add_liquidos_administrados_from_tratamiento_form.dart';
import 'package:registro_uci/features/registros_diarios/balance_liquidos/administrados/presentation/widgets/components/confirm_delete_liquido_administrado_form.dart';
import 'package:registro_uci/features/registros_diarios/balance_liquidos/administrados/presentation/widgets/components/create_liquido_administrado_form.dart';
import 'package:registro_uci/features/registros_diarios/balance_liquidos/administrados/presentation/widgets/components/liquido_administrado_tile.dart';
import 'package:registro_uci/features/registros_diarios/balance_liquidos/administrados/presentation/widgets/components/update_liquido_administrado_form.dart';
import 'package:registro_uci/features/registros_diarios/balance_liquidos/administrados/presentation/widgets/liquido_administrado_details_dialog.dart';

class LiquidosAdministradosScreen extends ConsumerWidget {
  final LiquidosAdministradosParams params;
  const LiquidosAdministradosScreen({super.key, required this.params});

  @override
  Widget build(BuildContext context, ref) {
    final liquidos = ref.watch(liquidosAdministradosProvider(params));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Liquidos Administrados'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Registro ${params.idBalanceLiquidos}:00 a.m.\n${params.idRegistroDiario}\n",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: liquidos.when(
              data: (data) {
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final liquido = data[index];
                    return LiquidoAdministradoTile(
                      liquido: liquido,
                      onDetailsTap: () => _showLiquidoDetails(context, liquido),
                      onEditTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: UpdateLiquidoAdministradoForm(
                                params: params,
                                liquidoAdministrado: liquido,
                              ),
                            );
                          },
                        );
                      },
                      onDeleteTap: () => _showConfirmDelete(
                        context,
                        params,
                        liquido,
                      ),
                    );
                  },
                );
              },
              error: (error, stackTrace) => Text(error.toString()),
              loading: () => const CircularProgressIndicator(),
            ),
          ),
        ],
      ),
      floatingActionButton: _buildFabMenu(context),
    );
  }

  void _showLiquidoDetails(BuildContext context, LiquidoAdministrado liquido) {
    showDialog(
      context: context,
      builder: (context) => LiquidoAdministradoDetailsDialog(liquido: liquido),
    );
  }

  void _showConfirmDelete(
    BuildContext context,
    LiquidosAdministradosParams params,
    LiquidoAdministrado liquido,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: ConfirmDeleteLiquidoAdministrado(
            idLiquidoAdministrado: liquido.idLiquidoAdministrado,
            params: params,
          ),
        );
      },
    );
  }

  Widget _buildFabMenu(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        // Show options dialog for new actions
        showModalBottomSheet(
          context: context,
          builder: (context) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.add),
                title: const Text("Nuevo liquido administrado"),
                onTap: () {
                  Navigator.of(context).pop();
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: CreateLiquidoAdministradoForm(params: params),
                      );
                    },
                  );
                }, // Add functionality
              ),
              ListTile(
                leading: const Icon(Icons.medication),
                title: const Text("Tratamiento antibiotico"),
                onTap: () {
                  final dateString = params.idRegistroDiario;
                  final hourString = params.idBalanceLiquidos;
                  final dateParts = dateString.split('-');
                  final year = int.parse(dateParts[0]);
                  final month = int.parse(dateParts[1]);
                  final day = int.parse(dateParts[2]);
                  final hour = int.parse(hourString);

                  final idIngreso = params.idIngreso;
                  final hora = DateTime(year, month, day, hour);

                  showDialog(
                    context: context,
                    builder: (context) {
                      return Consumer(
                        builder: (context, ref, _) {
                          // Watch for active antibiotic treatments
                          final tratamientosAsyncValue = ref.watch(
                              getTratamientosAntibioticosActivosProvider(
                                  TratamientosAntibioticosActivosParams(
                                      idIngreso: idIngreso, hora: hora)));
                          final controller = ref.watch(
                              createManyLiquidosAdministradosControllerProvider
                                  .notifier);

                          // Holds selected treatments
                          final selectedTratamientos =
                              <CreateLiquidoAdministradoDto>{};

                          return AlertDialog(
                            title: const Text(
                                "Seleccione Tratamientos Antibioticos"),
                            content:
                                AddLiquidosAdministradosFromTratamientoForm(
                              idIngreso: idIngreso,
                              hora: hora,
                              idRegistroDiario: params.idRegistroDiario,
                              idBalanceLiquidos: params.idBalanceLiquidos,
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.lightbulb_rounded),
                title: const Text("Sugerencias"),
                onTap: () {}, // Add functionality
              ),
            ],
          ),
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
