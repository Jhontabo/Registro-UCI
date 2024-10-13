import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/components/buttons/primary_button.dart';
import 'package:registro_uci/common/extensions/async_value_ui.dart';
import 'package:registro_uci/features/antibioticos/data/dto/create_tratamiento_antibiotico_dto.dart';
import 'package:registro_uci/features/antibioticos/presentation/controllers/create_tratamiento_antibiotico_controller.dart';

class CreateTratamientoAntibioticoFormButton extends ConsumerWidget {
  final String idIngreso;
  final GlobalKey<FormState> _formKey;
  final TextEditingController _antibioticoController;
  final TextEditingController _cantidadController;
  final TextEditingController _frecuenciaController;
  final DateTime? _fechaInicio;
  final TimeOfDay? _horaInicio;

  const CreateTratamientoAntibioticoFormButton({
    super.key,
    required this.idIngreso,
    required GlobalKey<FormState> formKey,
    required TextEditingController antibioticoController,
    required TextEditingController cantidadController,
    required TextEditingController frecuenciaController,
    required DateTime? fechaInicio,
    required TimeOfDay? horaInicio,
  })  : _formKey = formKey,
        _antibioticoController = antibioticoController,
        _cantidadController = cantidadController,
        _frecuenciaController = frecuenciaController,
        _fechaInicio = fechaInicio,
        _horaInicio = horaInicio;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<void> state =
        ref.watch(createTratamientoAntibioticoControllerProvider);

    ref.listen<AsyncValue<void>>(createTratamientoAntibioticoControllerProvider,
        (prev, state) {
      state.dialogOnError(context);
      state.popOnSuccess(prev, context);
    });

    return PrimaryButton(
      isLoading: state.isLoading,
      enabled: !state.isLoading && _fechaInicio != null,
      child: Text(
        "Crear Tratamiento Antibiotico",
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
      ),
      onTap: () async {
        if (_formKey.currentState?.validate() ?? false) {
          final inicio = DateTime(
            _fechaInicio!.year,
            _fechaInicio.month,
            _fechaInicio.day,
            _horaInicio!.hour,
            _horaInicio.minute,
          );
          // Create the DTO instance
          final dto = CreateTratamientoAntibioticoDto(
            antibiotico: _antibioticoController.text,
            cantidad: int.parse(_cantidadController.text),
            frecuenciaEn24h: int.parse(_frecuenciaController.text),
            fechaInicio: inicio,
          );

          ref
              .read(createTratamientoAntibioticoControllerProvider.notifier)
              .createTratamientoAntibiotico(idIngreso, dto);

          _formKey.currentState?.reset();
        }
      },
    );
  }
}
