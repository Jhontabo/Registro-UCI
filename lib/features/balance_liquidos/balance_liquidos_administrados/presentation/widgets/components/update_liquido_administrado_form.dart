import 'package:flutter/material.dart';
import 'package:registro_uci/common/components/form_fields/dropdown_button_form_field.dart';
import 'package:registro_uci/common/components/form_fields/text_form_field.dart';
import 'package:registro_uci/common/validators/default_validator.dart';
import 'package:registro_uci/features/balance_liquidos/balance_liquidos_administrados/data/providers/liquidos_administrados_provider.dart';
import 'package:registro_uci/features/balance_liquidos/balance_liquidos_administrados/domain/models/liquido_administrado.dart';
import 'package:registro_uci/features/balance_liquidos/balance_liquidos_administrados/presentation/widgets/components/buttons/update_liquido_administrado_form_button.dart';

const medicamentos = [
  'Paracetamol',
  'Ibuprofeno',
  'Ranitidina',
  'Amoxicilina',
  'Other'
];

class UpdateLiquidoAdministradoForm extends StatefulWidget {
  final LiquidosAdministradosParams params;
  final LiquidoAdministrado liquidoAdministrado;

  const UpdateLiquidoAdministradoForm({
    super.key,
    required this.params,
    required this.liquidoAdministrado,
  });

  @override
  State<UpdateLiquidoAdministradoForm> createState() =>
      _UpdateLiquidoAdministradoFormState();
}

class _UpdateLiquidoAdministradoFormState
    extends State<UpdateLiquidoAdministradoForm> {
  late TextEditingController _cantidadController;
  late TextEditingController _comentarioController;
  late TextEditingController _dosisController;
  late TextEditingController _otherMedicamentoController;
  String? _selectedMedicamento;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _cantidadController = TextEditingController(
        text: widget.liquidoAdministrado.cantidad.toString());
    _comentarioController = TextEditingController(
        text: widget.liquidoAdministrado.comentario ?? '');
    _dosisController =
        TextEditingController(text: widget.liquidoAdministrado.dosis ?? '');
    _otherMedicamentoController = TextEditingController(
        text: widget.liquidoAdministrado.medicamento == 'Other'
            ? widget.liquidoAdministrado.medicamento
            : '');

    // Pre-select the medicamento if it exists in the list or set it to 'Other'
    _selectedMedicamento =
        medicamentos.contains(widget.liquidoAdministrado.medicamento)
            ? widget.liquidoAdministrado.medicamento
            : 'Other';
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
    final dateTime = widget.liquidoAdministrado.hora;

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

          // Update button
          UpdateLiquidoAdministradoFormbutton(
            formKey: _formKey,
            selectedMedicamento: _selectedMedicamento,
            otherMedicamentoController: _otherMedicamentoController,
            cantidadController: _cantidadController,
            comentarioController: _comentarioController,
            dosisController: _dosisController,
            params: widget.params,
            hora: dateTime,
            idLiquidoAdministrado:
                widget.liquidoAdministrado.idLiquidoAdministrado,
          ),
        ],
      ),
    );
  }
}
