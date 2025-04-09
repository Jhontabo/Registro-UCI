import 'package:flutter/material.dart';
import 'package:registro_uci/common/components/form_fields/dropdown_button_form_field.dart';
import 'package:registro_uci/common/components/form_fields/text_form_field.dart';
import 'package:registro_uci/common/validators/default_validator.dart';
import 'package:registro_uci/features/balance_liquidos_administrados/data/providers/liquidos_administrados_provider.dart';
import 'package:registro_uci/features/balance_liquidos_administrados/presentation/widgets/components/buttons/create_liquido_administrado_form_button.dart';

const medicamentos = [
  'Paracetamol',
  'Ibuprofeno',
  'Ranitidina',
  'Amoxicilina',
  'Other'
];

class CreateLiquidoAdministradoForm extends StatefulWidget {
  final LiquidosAdministradosParams params;

  const CreateLiquidoAdministradoForm({super.key, required this.params});

  @override
  State<CreateLiquidoAdministradoForm> createState() =>
      _CreateLiquidoAdministradoFormState();
}

class _CreateLiquidoAdministradoFormState
    extends State<CreateLiquidoAdministradoForm> {
  late TextEditingController _cantidadController;
  late TextEditingController _comentarioController;
  late TextEditingController _dosisController;
  late TextEditingController _otherMedicamentoController;
  String? _selectedMedicamento;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _cantidadController = TextEditingController();
    _comentarioController = TextEditingController();
    _dosisController = TextEditingController();
    _otherMedicamentoController = TextEditingController();
  }

  @override
  void dispose() {
    _cantidadController.dispose();
    _comentarioController.dispose();
    _dosisController.dispose();
    _otherMedicamentoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dateString = widget.params.idRegistroDiario;
    final hourString = widget.params.idBalanceLiquidos;

    final dateParts = dateString.split('-');
    final year = int.parse(dateParts[0]);
    final month = int.parse(dateParts[1]);
    final day = int.parse(dateParts[2]);
    final hour = int.parse(hourString);
    final dateTime = DateTime(year, month, day, hour);

    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 15),

          // Medicamento Dropdown field
          EnumDropdownButtonFormField(
            value: _selectedMedicamento,
            label: "Medicamento",
            values: medicamentos,
            onSelected: (newValue) {
              setState(() {
                _selectedMedicamento = newValue;
              });
            },
            validator: (value) =>
                value == null ? 'Seleccione un medicamento' : null,
          ),

          // Conditional visibility for "Other" medication input
          Visibility(
            visible: _selectedMedicamento == 'Other',
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: OutlinedTextFormField(
                controller: _otherMedicamentoController,
                label: "Especificar Medicamento",
                prefixIcon: const Icon(Icons.edit_outlined),
                validator: (value) => value != null && value.isEmpty
                    ? 'Especifique el medicamento'
                    : null,
              ),
            ),
          ),
          const SizedBox(height: 15),

          // Cantidad field
          OutlinedTextFormField(
            controller: _cantidadController,
            label: "Cantidad (ml)",
            prefixIcon: const Icon(Icons.local_drink_outlined, size: 25),
            textInputType: TextInputType.number,
            validator: defaultValidator,
          ),
          const SizedBox(height: 15),

          // Dosis field
          OutlinedTextFormField(
            controller: _dosisController,
            label: "Dosis",
            prefixIcon: const Icon(Icons.medication_outlined, size: 25),
            validator: defaultValidator,
          ),
          const SizedBox(height: 15),

          // Comentario field (optional)
          OutlinedTextFormField(
            controller: _comentarioController,
            label: "Comentario",
            prefixIcon: const Icon(Icons.comment_outlined, size: 25),
          ),
          const SizedBox(height: 30),

          // Create button
          CreateLiquidoAdministradoFormButton(
            formKey: _formKey,
            selectedMedicamento: _selectedMedicamento,
            otherMedicamentoController: _otherMedicamentoController,
            cantidadController: _cantidadController,
            comentarioController: _comentarioController,
            dosisController: _dosisController,
            params: widget.params,
            hora: dateTime,
          ),
        ],
      ),
    );
  }
}
