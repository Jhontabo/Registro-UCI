import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:registro_uci/features/marcapasos/data/dto/create_marcapaso_dto.dart';
import 'package:registro_uci/features/marcapasos/presentation/controllers/registrar_marcapaso_controller.dart';

class RegistroMarcapasosPage extends ConsumerStatefulWidget {
  const RegistroMarcapasosPage({super.key});

  @override
  RegistroMarcapasosPageState createState() => RegistroMarcapasosPageState();
}

class RegistroMarcapasosPageState
    extends ConsumerState<RegistroMarcapasosPage> {
  final TextEditingController fechaController = TextEditingController();
  final TextEditingController frecuenciaController = TextEditingController();
  final TextEditingController sensibilidadController = TextEditingController();
  String? selectedModo;
  String? selectedVia;

  final List<String> modos = ["Modo 1", "Modo 2", "Modo 3"];
  final List<String> vias = ["Vía 1", "Vía 2", "Vía 3"];

  @override
  Widget build(BuildContext context) {
    final registrarController = ref.watch(registrarMarcapasoControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Registrar nuevo marcapaso"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Registro de Marcapaso",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            TextFormField(
              controller: fechaController,
              decoration: const InputDecoration(
                labelText: "Fecha de colocación",
                border: OutlineInputBorder(),
              ),
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (pickedDate != null) {
                  setState(() {
                    fechaController.text =
                        pickedDate.toLocal().toString().split(' ')[0];
                  });
                }
              },
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: selectedModo,
              decoration: const InputDecoration(border: OutlineInputBorder()),
              hint: const Text("Modo"),
              onChanged: (String? newValue) {
                setState(() {
                  selectedModo = newValue;
                });
              },
              items: modos.map((String mode) {
                return DropdownMenuItem<String>(
                  value: mode,
                  child: Text(mode),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: selectedVia,
              decoration: const InputDecoration(border: OutlineInputBorder()),
              hint: const Text("Vía"),
              onChanged: (String? newValue) {
                setState(() {
                  selectedVia = newValue;
                });
              },
              items: vias.map((String via) {
                return DropdownMenuItem<String>(
                  value: via,
                  child: Text(via),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: frecuenciaController,
              decoration: const InputDecoration(
                labelText: "Frecuencia",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: sensibilidadController,
              decoration: const InputDecoration(
                labelText: "Sensibilidad Salida",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () async {
                await registrarController.registrarMarcapaso(CreateMarcapasoDto(
                  fechaColocacion: fechaController.text,
                  modo: selectedModo ?? "",
                  via: selectedVia ?? "",
                  frecuencia: int.tryParse(frecuenciaController.text) ?? 0,
                  sensibilidadSalida:
                      int.tryParse(sensibilidadController.text) ?? 0,
                ));
              },
              child: const Text("REGISTRAR MARCAPASO"),
            ),
          ],
        ),
      ),
    );
  }
}
