import 'package:flutter/material.dart';
import 'package:registro_uci/features/ingresos/domain/models/ingreso.dart';
import 'package:registro_uci/features/ingresos/presentation/widgets/create_ingreso_form.dart';
import 'package:registro_uci/features/ingresos/presentation/widgets/update_ingreso_form.dart';

class UpdateIngresoPage extends StatelessWidget {
  final Ingreso ingreso;
  const UpdateIngresoPage({
    super.key,
    required this.ingreso,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Actualizar Ingreso",
          // style: Theme.of(context)
          //     .textTheme
          //     .titleLarge!
          //     .copyWith(fontWeight: FontWeight.w500),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          UpdateIngresoForm(
            ingreso: ingreso,
          ),
        ],
      ),
    );
  }
}
