import 'package:flutter/material.dart';
import '../../../features/control_riesgos/presentation/widgets/create_control_riesgos_form.dart'; // Importamos el formulario

class CreateControlRiesgosPage extends StatelessWidget {
  final String idIngreso;
  final String idRegistroDiario;

  const CreateControlRiesgosPage({
    super.key,
    required this.idIngreso,
    required this.idRegistroDiario,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Control de Riesgos')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CreateControlRiesgosForm(
          idIngreso: idIngreso,
          idRegistroDiario:
              idRegistroDiario, // Pasamos los parámetros necesarios
        ),
      ),
    );
  }
}
