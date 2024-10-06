
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/components/buttons/primary_button.dart';
import 'package:registro_uci/common/components/form_fields/date_form_field.dart';
import 'package:registro_uci/common/extensions/async_value_ui.dart';
import 'package:registro_uci/common/extensions/string_to_date.dart';
import 'package:registro_uci/common/utils/date_picker.dart';
import 'package:registro_uci/features/registros_diarios/data/dto/create_registro_diario_dto.dart';
import 'package:registro_uci/features/registros_diarios/presentation/controllers/add_registro_diario_to_ingreso_controller.dart';
import 'package:registro_uci/features/registros_diarios/presentation/widgets/validators/fecha_registro_validator.dart';

class CreateRegistroDiarioForm extends StatefulWidget {
  const CreateRegistroDiarioForm({
    super.key,
    required this.idIngreso,
  });
  final String idIngreso;

  @override
  State<CreateRegistroDiarioForm> createState() =>
      _CreateRegistroDiarioFormState();
}

class _CreateRegistroDiarioFormState extends State<CreateRegistroDiarioForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TextEditingController _fechaRegistroController;

  @override
  void initState() {
    final today = DateTime.now();
    _fechaRegistroController = TextEditingController();
    _fechaRegistroController.text = today.toString().split(" ")[0];
    super.initState();
  }

  @override
  void dispose() {
    _fechaRegistroController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        width: MediaQuery.of(context).size.width * .9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Crear Registro Diario",
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            DateFormField(
              label: 'Fecha de registro',
              controller: _fechaRegistroController,
              onTap: () {
                _selectDate(_fechaRegistroController, context);
              },
              validator: fechaRegistroValidator,
            ),
            const SizedBox(height: 30),
            CreateRegistroFormButton(
              formKey: _formKey,
              idIngreso: widget.idIngreso,
              fechaRegistroController: _fechaRegistroController,
            )
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(
    TextEditingController controller,
    BuildContext context,
  ) async {
    final initialDate = controller.text.toDateTime();
    DateTime? pickedDate = await pickDate(initialDate, context);
    if (pickedDate != null) {
      setState(() {
        controller.text = pickedDate.toString().split(" ")[0];
      });
    }
  }
}

class CreateRegistroFormButton extends ConsumerWidget {
  const CreateRegistroFormButton({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController fechaRegistroController,
    required this.idIngreso,
  })  : _formKey = formKey,
        _fechaRegistroController = fechaRegistroController;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _fechaRegistroController;
  final String idIngreso;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<void> state =
        ref.watch(addRegistroDiarioToIngresoControllerProvider);

    ref.listen<AsyncValue<void>>(addRegistroDiarioToIngresoControllerProvider,
        (prev, state) {
      state.dialogOnError(context);
      state.dialogOnSuccess(prev, "Ingreso creado exitosamente", context);
    });

    return PrimaryButton(
      isLoading: state.isLoading,
      enabled: !state.isLoading,
      onTap: () {
        if (_formKey.currentState!.validate()) {
          final dto = CreateRegistroDiarioDto(
            fechaRegistro: _fechaRegistroController.text.toDateTime()!,
          );

          ref
              .read(addRegistroDiarioToIngresoControllerProvider.notifier)
              .addRegistroDiarioToIngreso(idIngreso, dto);
        }
      },
      child: Text(
        "CREAR REGISTRO DIARIO",
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }
}
