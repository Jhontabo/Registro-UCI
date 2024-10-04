import 'package:flutter/material.dart';
import 'package:registro_uci/features/registros_diarios/presentation/widgets/create_registro_diario_form.dart';

class CreateRegistroDiarioPage extends StatelessWidget {
  final String idIngreso;
  const CreateRegistroDiarioPage({
    super.key,
    required this.idIngreso,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Crear Registro Diario",
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          CreateRegistroDiarioForm(
            idIngreso: idIngreso,
          ),
        ],
      ),
    );
  }
}
