import 'package:flutter/material.dart';
import 'package:registro_uci/features/antibioticos/presentation/widgets/components/buttons/create_tratamiento_antibiotico_floating_button.dart';
import 'package:registro_uci/features/antibioticos/presentation/widgets/tratamientos_antibioticos_list.dart';

class TratamientosAntibioticosPage extends StatelessWidget {
  final String idIngreso;

  const TratamientosAntibioticosPage({
    super.key,
    required this.idIngreso,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tratamientos Antibioticos'),
      ),
      body: TratamientosAntibioticosList(idIngreso: idIngreso),
      floatingActionButton: CreateTratamientoAntibioticoFAB(
        idIngreso: idIngreso,
      ),
    );
  }
}
