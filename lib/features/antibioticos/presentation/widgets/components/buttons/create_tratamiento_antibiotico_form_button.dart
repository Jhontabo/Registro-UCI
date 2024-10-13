import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/components/buttons/primary_button.dart';
import 'package:registro_uci/common/extensions/async_value_ui.dart';
import 'package:registro_uci/features/antibioticos/data/dto/create_tratamiento_antibiotico_dto.dart';
import 'package:registro_uci/features/antibioticos/presentation/controllers/create_tratamiento_antibiotico_controller.dart';

class CreateTratamientoAntibioticoFormButton extends ConsumerWidget {
  final String idIngreso;
  final GlobalKey<FormState> _formKey;
  final String _antibiotico;
  final TextEditingController _cantidadController;
  final int _frecuencia;
  final TextEditingController _dosisController;
  final DateTime? _fechaInicio;
  final TimeOfDay? _horaInicio;

  const CreateTratamientoAntibioticoFormButton({
    super.key,
    required this.idIngreso,
    required GlobalKey<FormState> formKey,
    required String antibiotico,
    required TextEditingController cantidadController,
    required int frecuencia,
    required DateTime? fechaInicio,
    required TimeOfDay? horaInicio,
    required TextEditingController dosisController,
  })  : _formKey = formKey,
        _antibiotico = antibiotico,
        _cantidadController = cantidadController,
        _frecuencia = frecuencia,
        _fechaInicio = fechaInicio,
        _horaInicio = horaInicio,
        _dosisController = dosisController;

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
            antibiotico: _antibiotico,
            cantidad: int.parse(_cantidadController.text),
            frecuenciaEn24h: _frecuencia,
            fechaInicio: inicio,
            dosis: _dosisController.text,
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
