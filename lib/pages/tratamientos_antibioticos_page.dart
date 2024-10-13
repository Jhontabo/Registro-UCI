import 'package:flutter/material.dart';
import 'package:registro_uci/features/antibioticos/domain/models/tratamiento_antibiotico.dart';
import 'package:registro_uci/features/antibioticos/presentation/widgets/components/buttons/create_tratamiento_antibiotico_floating_button.dart';
import 'package:registro_uci/features/antibioticos/presentation/widgets/tratamientos_antibioticos_list.dart';

class TratamientosAntibioticosPage extends StatelessWidget {
  final String idIngreso;

  TratamientosAntibioticosPage({
    super.key,
    required this.idIngreso,
  });

  final List<TratamientoAntibiotico> tratamientos = [
    TratamientoAntibiotico(
      idTratamientoAntibiotico: '1',
      antibiotico: 'Meropenem',
      cantidad: 12,
      frecuenciaEn24h: 4,
      fechaInicio: DateTime(2024, 5, 12),
      fechaFin: null, // Active treatment
    ),
    TratamientoAntibiotico(
      idTratamientoAntibiotico: '2',
      antibiotico: 'Dexametasona',
      cantidad: 12,
      frecuenciaEn24h: 4,
      fechaInicio: DateTime(2024, 5, 12),
      fechaFin: DateTime(2024, 4, 15), // Finalized treatment
    ),
    TratamientoAntibiotico(
      idTratamientoAntibiotico: '3',
      antibiotico: 'Amoxicilina',
      cantidad: 8,
      frecuenciaEn24h: 3,
      fechaInicio: DateTime(2024, 6, 1),
      fechaFin: null, // Active treatment
    ),
    TratamientoAntibiotico(
      idTratamientoAntibiotico: '4',
      antibiotico: 'Ceftriaxona',
      cantidad: 20,
      frecuenciaEn24h: 2,
      fechaInicio: DateTime(2024, 3, 22),
      fechaFin: DateTime(2024, 3, 28), // Finalized treatment
    ),
    TratamientoAntibiotico(
      idTratamientoAntibiotico: '5',
      antibiotico: 'Azitromicina',
      cantidad: 10,
      frecuenciaEn24h: 1,
      fechaInicio: DateTime(2024, 7, 5),
      fechaFin: null, // Active treatment
    ),
    TratamientoAntibiotico(
      idTratamientoAntibiotico: '6',
      antibiotico: 'Vancomicina',
      cantidad: 15,
      frecuenciaEn24h: 2,
      fechaInicio: DateTime(2024, 2, 10),
      fechaFin: DateTime(2024, 2, 20), // Finalized treatment
    ),
    TratamientoAntibiotico(
      idTratamientoAntibiotico: '7',
      antibiotico: 'Ciprofloxacino',
      cantidad: 18,
      frecuenciaEn24h: 2,
      fechaInicio: DateTime(2024, 4, 8),
      fechaFin: null, // Active treatment
    ),
    TratamientoAntibiotico(
      idTratamientoAntibiotico: '8',
      antibiotico: 'Clindamicina',
      cantidad: 6,
      frecuenciaEn24h: 3,
      fechaInicio: DateTime(2024, 1, 10),
      fechaFin: DateTime(2024, 1, 20), // Finalized treatment
    ),
    TratamientoAntibiotico(
      idTratamientoAntibiotico: '9',
      antibiotico: 'Levofloxacino',
      cantidad: 12,
      frecuenciaEn24h: 4,
      fechaInicio: DateTime(2024, 5, 20),
      fechaFin: null, // Active treatment
    ),
    TratamientoAntibiotico(
      idTratamientoAntibiotico: '10',
      antibiotico: 'Metronidazol',
      cantidad: 10,
      frecuenciaEn24h: 3,
      fechaInicio: DateTime(2024, 3, 15),
      fechaFin: DateTime(2024, 3, 22), // Finalized treatment
    ),
  ];

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
