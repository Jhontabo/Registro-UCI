import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:registro_uci/features/marcapasos/data/dto/create_marcapaso_dto.dart';
import 'package:registro_uci/features/marcapasos/presentation/controllers/registrar_marcapaso_controller.dart';
import '../../../data/constants/constants.dart'; // Importa las listas

class CreateMarcapasoForm extends ConsumerStatefulWidget {
  const CreateMarcapasoForm({super.key});

  @override
  _CreateMarcapasoFormState createState() => _CreateMarcapasoFormState();
}

class _CreateMarcapasoFormState extends ConsumerState<CreateMarcapasoForm> {
  final TextEditingController fechaController = TextEditingController();
  final TextEditingController frecuenciaController = TextEditingController();
  final TextEditingController sensibilidadController = TextEditingController();
  final TextEditingController salidaController = TextEditingController();

  String? selectedModo;
  String? selectedVia;

  @override
  void dispose() {
    fechaController.dispose();
    frecuenciaController.dispose();
    sensibilidadController.dispose();
    salidaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final registrarController = ref.watch(registrarMarcapasoControllerProvider);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Registro de Marcapaso",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Dropdown para modo
            DropdownButtonFormField<String>(
              value: selectedModo,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Modo",
              ),
              hint: const Text("Seleccione modo"),
              onChanged: (String? newValue) {
                setState(() {
                  selectedModo = newValue;
                });
              },
              items: modosMarcapaso.map((mode) {
                return DropdownMenuItem<String>(
                  value: mode,
                  child: Text(mode),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),

            // Dropdown para vía
            DropdownButtonFormField<String>(
              value: selectedVia,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Vía",
              ),
              hint: const Text("Seleccione vía"),
              onChanged: (String? newValue) {
                setState(() {
                  selectedVia = newValue;
                });
              },
              items: viasMarcapaso.map((via) {
                return DropdownMenuItem<String>(
                  value: via,
                  child: Text(via),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),

            // Dropdown para frecuencia
            DropdownButtonFormField<int>(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Frecuencia",
              ),
              hint: const Text("Seleccione frecuencia"),
              value: frecuenciaController.text.isNotEmpty
                  ? int.tryParse(frecuenciaController.text)
                  : null,
              onChanged: (int? newValue) {
                setState(() {
                  frecuenciaController.text = newValue?.toString() ?? '';
                });
              },
              items: frecuenciasMarcapaso.map((freq) {
                return DropdownMenuItem<int>(
                  value: freq,
                  child: Text(freq.toString()),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),

            // Dropdown para sensibilidad
            DropdownButtonFormField<double>(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Sensibilidad",
              ),
              hint: const Text("Seleccione sensibilidad"),
              value: sensibilidadController.text.isNotEmpty
                  ? double.tryParse(sensibilidadController.text)
                  : null,
              onChanged: (double? newValue) {
                setState(() {
                  sensibilidadController.text = newValue?.toString() ?? '';
                });
              },
              items: sensibilidadesMarcapaso.map((s) {
                return DropdownMenuItem<double>(
                  value: s,
                  child: Text(s.toString()),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),

            // Dropdown para salida
            DropdownButtonFormField<double>(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Salida",
              ),
              hint: const Text("Seleccione salida"),
              value: salidaController.text.isNotEmpty
                  ? double.tryParse(salidaController.text)
                  : null,
              onChanged: (double? newValue) {
                setState(() {
                  salidaController.text = newValue?.toString() ?? '';
                });
              },
              items: salidasMarcapaso.map((s) {
                return DropdownMenuItem<double>(
                  value: s,
                  child: Text(s.toString()),
                );
              }).toList(),
            ),
            const SizedBox(height: 26),

            // Botón de registrar
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  await registrarController.registrarMarcapaso(
                    CreateMarcapasoDto(
                      fechaColocacion: fechaController.text,
                      modo: selectedModo ?? "",
                      via: selectedVia ?? "",
                      frecuencia: int.tryParse(frecuenciaController.text) ?? 0,
                      sensibilidad:
                          double.tryParse(sensibilidadController.text) ?? 0,
                      salida: double.tryParse(salidaController.text) ?? 0,
                    ),
                  );
                },
                child: const Text("REGISTRAR MARCAPASO"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
