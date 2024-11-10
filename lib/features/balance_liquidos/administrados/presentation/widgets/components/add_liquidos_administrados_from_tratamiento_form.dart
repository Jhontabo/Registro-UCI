// ignore_for_file: unused_element, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/components/buttons/primary_button.dart';
import 'package:registro_uci/common/extensions/async_value_ui.dart';
import 'package:registro_uci/features/balance_liquidos/administrados/data/dto/create_liquido_administrado_dto.dart';
import 'package:registro_uci/features/balance_liquidos/administrados/data/providers/tratamientos_antibioticos_activos_provider.dart';
import 'package:registro_uci/features/balance_liquidos/administrados/presentation/controllers/create_many_liquidos_administrados_controller.dart';

class AddLiquidosAdministradosFromTratamientoForm extends StatefulWidget {
  final String idIngreso;
  final DateTime hora;
  final String idRegistroDiario;
  final String idBalanceLiquidos;

  const AddLiquidosAdministradosFromTratamientoForm({
    super.key,
    required this.idIngreso,
    required this.hora,
    required this.idRegistroDiario,
    required this.idBalanceLiquidos,
  });

  @override
  AddLiquidosAdministradosFromTratamientoFormState createState() =>
      AddLiquidosAdministradosFromTratamientoFormState();
}

class AddLiquidosAdministradosFromTratamientoFormState
    extends State<AddLiquidosAdministradosFromTratamientoForm> {
  final Set<CreateLiquidoAdministradoDto> _selectedTratamientos = {};
  bool _isSubmitting = false;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final tratamientosAsync = ref.watch(
          getTratamientosAntibioticosActivosProvider(
            TratamientosAntibioticosActivosParams(
              idIngreso: widget.idIngreso,
              hora: widget.hora,
            ),
          ),
        );

        return tratamientosAsync.when(
          data: (tratamientos) {
            return SizedBox(
              // height: MediaQuery.of(context).size.height * .5,
              width: MediaQuery.of(context).size.width * .9,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: tratamientos.length,
                    itemBuilder: (context, index) {
                      final tratamiento = tratamientos[index];
                      final isSelected =
                          _selectedTratamientos.contains(tratamiento);

                      return CheckboxListTile(
                        title: Text(tratamiento.medicamento),
                        subtitle: Text(
                          'Dosis: ${tratamiento.dosis} - Cantidad: ${tratamiento.cantidad}',
                        ),
                        value: isSelected,
                        onChanged: (bool? selected) {
                          setState(() {
                            if (selected == true) {
                              _selectedTratamientos.add(tratamiento);
                            } else {
                              _selectedTratamientos.remove(tratamiento);
                            }
                          });
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  if (_isSubmitting)
                    const CircularProgressIndicator()
                  else
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Consumer(
                          builder: (context, ref, child) {
                            final AsyncValue<void> state = ref.watch(
                                createManyLiquidosAdministradosControllerProvider);

                            ref.listen<AsyncValue<void>>(
                                createManyLiquidosAdministradosControllerProvider,
                                (prev, state) {
                              state.dialogOnError(context);
                              state.popOnSuccess(prev, context);
                            });
                            return PrimaryButton(
                              enabled: _selectedTratamientos.isNotEmpty,
                              isLoading: state.isLoading,
                              child: const Text("Aceptar"),
                              onTap: () {
                                final dtos = _selectedTratamientos.toList();
                                ref
                                    .read(
                                        createManyLiquidosAdministradosControllerProvider
                                            .notifier)
                                    .createManyLiquidosAdministrados(
                                      widget.idIngreso,
                                      widget.idRegistroDiario,
                                      widget.idBalanceLiquidos,
                                      dtos,
                                    );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                ],
              ),
            );
          },
          loading: () => const CircularProgressIndicator(),
          error: (error, stack) => Text(
            'Error: $error',
            style: const TextStyle(color: Colors.red),
          ),
        );
      },
    );
  }

  Future<void> _addSelectedTratamientos(WidgetRef ref) async {
    setState(() {
      _isSubmitting = true;
    });

    final dtos = _selectedTratamientos.toList();

    try {
      await ref
          .read(createManyLiquidosAdministradosControllerProvider.notifier)
          .createManyLiquidosAdministrados(
            widget.idIngreso,
            widget.idRegistroDiario,
            widget.idBalanceLiquidos,
            dtos,
          );
      Navigator.of(context).pop();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error al agregar tratamientos: $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        _isSubmitting = false;
      });
    }
  }
}
