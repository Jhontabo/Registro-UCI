import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/components/buttons/primary_button.dart';
import 'package:registro_uci/common/extensions/async_value_ui.dart';
import 'package:registro_uci/features/marcapasos/data/dto/create_marcapaso_dto.dart';
import 'package:registro_uci/features/marcapasos/presentation/controllers/create_marcapaso_controller.dart';

class CreateMarcapasoFormButton extends ConsumerWidget {
  const CreateMarcapasoFormButton({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController fechaController,
    required String idIngreso,
    required String? selectedModo,
    required String? selectedVia,
    required int? selectedFrecuencia,
    required double? selectedSensibilidad,
    required double? selectedSalida,
  })  : _formKey = formKey,
        _fechaController = fechaController,
        _idIngreso = idIngreso,
        _selectedModo = selectedModo,
        _selectedVia = selectedVia,
        _selectedFrecuencia = selectedFrecuencia,
        _selectedSensibilidad = selectedSensibilidad,
        _selectedSalida = selectedSalida;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _fechaController;
  final String _idIngreso;
  final String? _selectedModo;
  final String? _selectedVia;
  final int? _selectedFrecuencia;
  final double? _selectedSensibilidad;
  final double? _selectedSalida;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<void> state = ref.watch(createMarcapasoControllerProvider);

    ref.listen<AsyncValue<void>>(createMarcapasoControllerProvider,
        (prev, state) {
      state.dialogOnError(context);
      state.dialogOnSuccess(prev, "Marcapaso registrado exitosamente", context);
    });

    return PrimaryButton(
      isLoading: state.isLoading,
      enabled: !state.isLoading,
      child: Text(
        "REGISTRAR MARCAPASO",
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
      ),
      onTap: () {
        if (_formKey.currentState!.validate()) {
          final dto = CreateMarcapasoDto(
            idIngreso: _idIngreso,
            fechaColocacion: _fechaController.text,
            modo: _selectedModo ?? "No definido",
            via: _selectedVia ?? "No definida",
            frecuencia: _selectedFrecuencia ?? 0,
            sensibilidad: _selectedSensibilidad ?? 0.0,
            salida: _selectedSalida ?? 0.0,
          );

          ref
              .read(createMarcapasoControllerProvider.notifier)
              .createMarcapaso(dto);
        }
      },
    );
  }
}
