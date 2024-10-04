import 'package:flutter/material.dart';
import 'package:registro_uci/features/ingresos/presentation/widgets/create_ingreso_form.dart';

class CreateIngresoPage extends StatelessWidget {
  const CreateIngresoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Crear Ingreso",
          // style: Theme.of(context)
          //     .textTheme
          //     .titleLarge!
          //     .copyWith(fontWeight: FontWeight.w500),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: const [
          CreateIngresoForm(),
        ],
      ),
    );
  }
}
