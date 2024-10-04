import 'package:flutter/material.dart';
import 'package:registro_uci/common/components/form_fields/text_form_field.dart';
import 'package:registro_uci/features/necesidades/data/providers/necesidades_de_registro_provider.dart';
import 'package:registro_uci/features/necesidades/presentation/validators/nombre_necesidad_validator.dart';
import 'package:registro_uci/features/necesidades/presentation/widgets/components/buttons/create_necesidad_form_button.dart';

class CreateNecesidadForm extends StatefulWidget {
  final NecesidadesParams params;
  const CreateNecesidadForm({
    super.key,
    required this.params,
  });

  @override
  State<CreateNecesidadForm> createState() => _CreateNecesidadFormState();
}

class _CreateNecesidadFormState extends State<CreateNecesidadForm> {
  late TextEditingController _nombreNecesidadController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nombreNecesidadController = TextEditingController();
  }

  @override
  void dispose() {
    _nombreNecesidadController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .9,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 15),

            // SECCION NOMBRE DE LA NECESIDAD
            Column(
              children: [
                Text(
                  "Agregar nueva necesidad",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 30),
                OutlinedTextFormField(
                  controller: _nombreNecesidadController,
                  label: "Nombre",
                  validator: nombreNecesidadValidator,
                ),
              ],
            ),
            const SizedBox(height: 30),

            CreateNecesidadFormButton(
              formKey: _formKey,
              nombreNecesidadController: _nombreNecesidadController,
              params: widget.params,
            ),
          ],
        ),
      ),
    );
  }
}
