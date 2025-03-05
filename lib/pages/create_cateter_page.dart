import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../features/cateteres/presentation/widgets/components/create_cateter_form.dart';

class CreateCateterPage extends StatelessWidget {
  final String idIngreso;

  const CreateCateterPage({super.key, required this.idIngreso});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Registrar Catéter")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CreateCateterForm(idIngreso: idIngreso),
      ),
    );
  }
}
