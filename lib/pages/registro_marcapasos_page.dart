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
  final TextEditingController salidaController = TextEditingController();

  String? selectedModo;
  String? selectedVia;

  // Listas de opciones actualizadas
  final List<String> modos = [
    'Modo VVI',
    'Modo AAI',
    'Modo DDD',
    'Modo VOO',
    'Modo AOO',
    'Modo DOO',
  ];

  final List<String> vias = [
    'Vena yugular interna',
    'Vena yugular externa (izquierda/derecha)',
    'Vena subclavia (derecha/izquierda)',
    'Vena femoral (izquierda/derecha)',
    'Vena basílica (izquierda/derecha)',
  ];

  final List<int> frecuencias = [
    for (int i = 30; i <= 180; i += 5) i,
  ];

  final List<double> sensibilidades = [20, 10, 5, 3, 2, 1, 0.5];
  final List<double> salidas = [0.1, 0.2, 0.5, 1, 2, 5, 7, 10, 15, 20];

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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Registro de Marcapaso",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
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
              // Campo de frecuencia usando lista predefinida
              DropdownButtonFormField<int>(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Frecuencia",
                ),
                hint: const Text("Frecuencia"),
                value: frecuenciaController.text.isNotEmpty
                    ? int.tryParse(frecuenciaController.text)
                    : null,
                onChanged: (int? newValue) {
                  setState(() {
                    frecuenciaController.text = newValue?.toString() ?? '';
                  });
                },
                items: frecuencias.map((int freq) {
                  return DropdownMenuItem<int>(
                    value: freq,
                    child: Text(freq.toString()),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              // Campo para Sensibilidad (lista predefinida)
              DropdownButtonFormField<double>(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Sensibilidad",
                ),
                hint: const Text("Sensibilidad"),
                value: sensibilidadController.text.isNotEmpty
                    ? double.tryParse(sensibilidadController.text)
                    : null,
                onChanged: (double? newValue) {
                  setState(() {
                    sensibilidadController.text = newValue?.toString() ?? '';
                  });
                },
                items: sensibilidades.map((double s) {
                  return DropdownMenuItem<double>(
                    value: s,
                    child: Text(s.toString()),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              // Campo para Salida (lista predefinida)
              DropdownButtonFormField<double>(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Salida",
                ),
                hint: const Text("Salida"),
                value: salidaController.text.isNotEmpty
                    ? double.tryParse(salidaController.text)
                    : null,
                onChanged: (double? newValue) {
                  setState(() {
                    salidaController.text = newValue?.toString() ?? '';
                  });
                },
                items: salidas.map((double s) {
                  return DropdownMenuItem<double>(
                    value: s,
                    child: Text(s.toString()),
                  );
                }).toList(),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
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
            ],
          ),
        ),
      ),
    );
  }
}
