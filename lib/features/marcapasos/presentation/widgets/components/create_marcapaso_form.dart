import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/components/buttons/primary_button.dart';
import 'package:registro_uci/features/marcapasos/data/dto/create_marcapaso_dto.dart';
import 'package:registro_uci/features/marcapasos/data/providers/marcapasos_provider.dart';
import 'package:intl/intl.dart';
import 'package:registro_uci/features/marcapasos/data/constants/constants.dart'; // 🔥 Importamos las constantes

class CreateMarcapasoForm extends ConsumerStatefulWidget {
  final String idIngreso; // 🔥 Asociado al paciente

  const CreateMarcapasoForm({super.key, required this.idIngreso});

  @override
  _CreateMarcapasoFormState createState() => _CreateMarcapasoFormState();
}

class _CreateMarcapasoFormState extends ConsumerState<CreateMarcapasoForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TextEditingController fechaController;
  String? selectedModo;
  String? selectedVia;
  int? selectedFrecuencia;
  double? selectedSensibilidad;
  double? selectedSalida;

  @override
  void initState() {
    super.initState();
    fechaController = TextEditingController(
      text: DateFormat('yyyy-MM-dd').format(DateTime.now()),
    );
  }

  @override
  void dispose() {
    fechaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Registro de Marcapaso",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // **Fecha de colocación**
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
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                  });
                }
              },
            ),
            const SizedBox(height: 16),

            // **Dropdown Modo** (Usando las constantes)
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Modo",
              ),
              value: selectedModo,
              onChanged: (value) => setState(() => selectedModo = value),
              items: modosMarcapaso.map((modo) {
                return DropdownMenuItem(value: modo, child: Text(modo));
              }).toList(),
            ),
            const SizedBox(height: 16),

            // **Dropdown Vía** (Usando las constantes)
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Vía",
              ),
              value: selectedVia,
              onChanged: (value) => setState(() => selectedVia = value),
              items: viasMarcapaso.map((via) {
                return DropdownMenuItem(value: via, child: Text(via));
              }).toList(),
            ),
            const SizedBox(height: 16),

            // **Dropdown Frecuencia** (Usando las constantes)
            DropdownButtonFormField<int>(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Frecuencia",
              ),
              value: selectedFrecuencia,
              onChanged: (value) => setState(() => selectedFrecuencia = value),
              items: frecuenciasMarcapaso.map((freq) {
                return DropdownMenuItem(value: freq, child: Text("$freq"));
              }).toList(),
            ),
            const SizedBox(height: 16),

            // **Dropdown Sensibilidad** (Usando las constantes)
            DropdownButtonFormField<double>(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Sensibilidad",
              ),
              value: selectedSensibilidad,
              onChanged: (value) =>
                  setState(() => selectedSensibilidad = value),
              items: sensibilidadesMarcapaso.map((sens) {
                return DropdownMenuItem(value: sens, child: Text("$sens"));
              }).toList(),
            ),
            const SizedBox(height: 16),

            // **Dropdown Salida** (Usando las constantes)
            DropdownButtonFormField<double>(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Salida",
              ),
              value: selectedSalida,
              onChanged: (value) => setState(() => selectedSalida = value),
              items: salidasMarcapaso.map((salida) {
                return DropdownMenuItem(value: salida, child: Text("$salida"));
              }).toList(),
            ),
            const SizedBox(height: 16),

            // **Botón de Registro**
            PrimaryButton(
              onTap: () async {
                if (_formKey.currentState!.validate()) {
                  final dto = CreateMarcapasoDto(
                    idIngreso: widget.idIngreso, // 🔥 Se asocia al paciente
                    fechaColocacion: fechaController.text,
                    modo: selectedModo ?? "No definido",
                    via: selectedVia ?? "No definida",
                    frecuencia: selectedFrecuencia ?? 0,
                    sensibilidad: selectedSensibilidad ?? 0,
                    salida: selectedSalida ?? 0,
                  );

                  try {
                    await ref.read(registrarMarcapasoProvider(dto).future);
                    if (mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content:
                                Text("✅ Marcapaso registrado exitosamente.")),
                      );
                    }
                  } catch (e) {
                    if (mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("⚠ Error al registrar: $e")),
                      );
                    }
                  }
                }
              },
              child: const Text("REGISTRAR MARCAPASO"),
            ),
          ],
        ),
      ),
    );
  }
}
