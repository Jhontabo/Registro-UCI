import 'package:flutter/material.dart';
import 'package:registro_uci/common/components/form_fields/text_form_field.dart';
import 'package:registro_uci/features/firmas/domain/models/necesidades_params.dart';
import 'package:registro_uci/features/necesidades/domain/models/necesidad.dart';
import 'package:registro_uci/features/necesidades/presentation/widgets/components/buttons/update_necesidad_form_button.dart';

class UpdateNecesidadForm extends StatefulWidget {
  const UpdateNecesidadForm({
    super.key,
    required this.necesidad,
    required this.params,
  });

  final Necesidad necesidad;
  final ReporteParams params;

  @override
  State<UpdateNecesidadForm> createState() => _UpdateNecesidadFormState();
}

class _UpdateNecesidadFormState extends State<UpdateNecesidadForm> {
  late TextEditingController _nombreNecesidadController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nombreNecesidadController = TextEditingController(
      text: widget.necesidad.nombreNecesidad,
    );
  }

  @override
  void dispose() {
    _nombreNecesidadController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Title
            Text(
              "Actualizar Necesidad",
              style: Theme.of(context).textTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Input Field for Nombre Necesidad
            OutlinedTextFormField(
              controller: _nombreNecesidadController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, ingrese un nombre de necesidad.';
                }
                return null;
              },
            ),
            const SizedBox(height: 30),

            // Update Button
            UpdateNecesidadFormButton(
              idNecesidad: widget.necesidad.idNecesidad,
              params: widget.params,
              nombreNecesidadController: _nombreNecesidadController,
            ),
          ],
        ),
      ),
    );
  }
}
