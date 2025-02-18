import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/components/buttons/primary_button.dart';
import 'package:registro_uci/common/extensions/async_value_ui.dart';
import 'package:registro_uci/common/extensions/string_to_date.dart';
import 'package:registro_uci/features/ingresos/data/dto/create_ingreso_dto.dart';
import 'package:registro_uci/features/ingresos/presentation/controllers/create_ingreso_controller.dart';

class CreateIngresoFormButton extends ConsumerWidget {
  const CreateIngresoFormButton({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController nombrePacienteController,
    required TextEditingController fechaNacimientoPacienteController,
    required TextEditingController epsOArlController,
    required TextEditingController identificacionPacienteController,
    required TextEditingController carpetaController,
    required TextEditingController nombreFamiliarController,
    required this.selectedParentescoFamiliar,
    required TextEditingController otherParentescoFamiliarController,
    required TextEditingController otherEpsArlController, // Cambiado aquí
    required TextEditingController telefonoFamiliarController,
    required TextEditingController diagnosticoIngresoController,
    required TextEditingController pesoController,
    required TextEditingController tallaController,
    required TextEditingController camaController,
    required TextEditingController alergiasController,
    required this.selectedEpsArl,
    required this.sala,
  })  : _formKey = formKey,
        _nombrePacienteController = nombrePacienteController,
        _fechaNacimientoPacienteController = fechaNacimientoPacienteController,
        _epsOArlController = epsOArlController,
        _identificacionPacienteController = identificacionPacienteController,
        _carpetaController = carpetaController,
        _nombreFamiliarController = nombreFamiliarController,
        _otherParentescoFamiliarController = otherParentescoFamiliarController,
        _otherEpsArlController = otherEpsArlController, // Agregado
        _telefonoFamiliarController = telefonoFamiliarController,
        _diagnosticoIngresoController = diagnosticoIngresoController,
        _pesoController = pesoController,
        _tallaController = tallaController,
        _camaController = camaController,
        _alergiasController = alergiasController;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _nombrePacienteController;
  final TextEditingController _fechaNacimientoPacienteController;
  final TextEditingController _epsOArlController;
  final TextEditingController _identificacionPacienteController;
  final TextEditingController _carpetaController;
  final TextEditingController _nombreFamiliarController;
  final String? selectedParentescoFamiliar;
  final String? sala;
  final String? selectedEpsArl;
  final TextEditingController _otherParentescoFamiliarController;
  final TextEditingController _otherEpsArlController; // Agregado aquí
  final TextEditingController _telefonoFamiliarController;
  final TextEditingController _diagnosticoIngresoController;
  final TextEditingController _pesoController;
  final TextEditingController _tallaController;
  final TextEditingController _camaController;
  final TextEditingController _alergiasController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<void> state = ref.watch(createIngresoControllerProvider);

    ref.listen<AsyncValue<void>>(createIngresoControllerProvider,
        (prev, state) {
      state.dialogOnError(context);
      state.dialogOnSuccess(prev, "Ingreso creado exitosamente", context);
    });

    return PrimaryButton(
      isLoading: state.isLoading,
      enabled: !state.isLoading,
      child: Text(
        "CREAR INGRESO",
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
      ),
      onTap: () {
        if (_formKey.currentState!.validate()) {
          final now = DateTime.now();

          final day = now.day;
          final month = now.month;
          final year = now.year;

          final dto = CreateIngresoDto(
            nombrePaciente: _nombrePacienteController.text,
            fechaNacimientoPaciente:
                _fechaNacimientoPacienteController.text.toDateTime(),
            epsOArl: selectedEpsArl == 'Otro'
                ? _otherEpsArlController.text
                : selectedEpsArl!,
            identificacionPaciente: _identificacionPacienteController.text,
            carpeta: _carpetaController.text,
            fechaIngreso: DateTime(year, month, day),
            nombreFamiliar: _nombreFamiliarController.text,
            parentescoFamiliar: selectedParentescoFamiliar == 'Otro'
                ? _otherParentescoFamiliarController.text
                : selectedParentescoFamiliar!,
            telefonoFamiliar: _telefonoFamiliarController.text,
            diagnosticoIngreso: _diagnosticoIngresoController.text,
            diagnosticoActual: _diagnosticoIngresoController.text,
            peso: int.parse(_pesoController.text),
            talla: int.parse(_tallaController.text),
            cama: _camaController.text,
            alergias: _alergiasController.text,
            sala: sala!,
            selectedEpsArl: selectedEpsArl!,
          );

          ref.read(createIngresoControllerProvider.notifier).createIngreso(dto);
        }
      },
    );
  }
}
