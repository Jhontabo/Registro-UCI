import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart'; // ✅ Importar para formatear la fecha
import '../../../data/dto/create_cateter_dto.dart';
import '../../../presentation/controllers/create_cateter_controller.dart';

class CreateCateterForm extends ConsumerStatefulWidget {
  final String idIngreso;
  const CreateCateterForm({super.key, required this.idIngreso});

  @override
  _CreateCateterFormState createState() => _CreateCateterFormState();
}

class _CreateCateterFormState extends ConsumerState<CreateCateterForm> {
  final _formKey = GlobalKey<FormState>();
  String? _tipo, _sitio, _lugarProcedencia;
  DateTime _fechaInsercion = DateTime.now(); // ✅ Ahora es seleccionable

  late TextEditingController fechaController; // Definir el controlador
  final List<String> tipos = [
    "Venoso central",
    "Venoso periférico",
    "Arterial"
  ];
  final List<String> sitios = [
    "Yugular derecho",
    "Yugular izquierdo",
    "Radial derecho",
    "Radial izquierdo",
    "Femoral derecho",
    "Femoral izquierdo"
  ];
  final List<String> lugares = [
    "Hospitalización",
    "Urgencias",
    "Quirófano",
    "Cuidado intermedio"
  ];

  @override
  void initState() {
    super.initState();
    fechaController = TextEditingController(
      text: DateFormat('yyyy-MM-dd')
          .format(_fechaInsercion), // Asigna la fecha de inserción inicial
    );
  }

  Future<void> _seleccionarFecha() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _fechaInsercion,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        _fechaInsercion = picked;
        fechaController.text = DateFormat('yyyy-MM-dd').format(
            _fechaInsercion); // Actualiza el texto con la fecha seleccionada
      });
    }
  }

  Future<void> _guardarCateter() async {
    if (_formKey.currentState!.validate()) {
      final nuevoCateter = CreateCateterDto(
        idIngreso: widget.idIngreso,
        tipo: _tipo!,
        sitio: _sitio!,
        fechaInsercion: _fechaInsercion, // ✅ Ahora es `DateTime`, no `String`
        lugarProcedencia: _lugarProcedencia!,
      );

      await ref
          .read(createCateterControllerProvider.notifier)
          .createCateter(nuevoCateter);
      if (mounted) Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final estado = ref.watch(createCateterControllerProvider);

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 20),
              // 🔥 Mejor manejo de la fecha seleccionada
              TextFormField(
                controller: fechaController,
                decoration: const InputDecoration(
                  labelText: "Fecha de colocación",
                  border: OutlineInputBorder(),
                ),
                readOnly: true,
                onTap: _seleccionarFecha,
              ),

              // **Dropdown Tipo de Catéter**
              DropdownButtonFormField<String>(
                value: _tipo,
                items: tipos
                    .map((tipo) =>
                        DropdownMenuItem(value: tipo, child: Text(tipo)))
                    .toList(),
                onChanged: (value) => setState(() => _tipo = value),
                decoration: const InputDecoration(labelText: "Tipo de Catéter"),
                validator: (value) =>
                    value == null ? 'Seleccione un tipo' : null,
              ),
              const SizedBox(height: 16),

              // **Dropdown Sitio**
              DropdownButtonFormField<String>(
                value: _sitio,
                items: sitios
                    .map((sitio) =>
                        DropdownMenuItem(value: sitio, child: Text(sitio)))
                    .toList(),
                onChanged: (value) => setState(() => _sitio = value),
                decoration: const InputDecoration(labelText: "Sitio"),
                validator: (value) =>
                    value == null ? 'Seleccione un sitio' : null,
              ),
              const SizedBox(height: 16),

              // **Dropdown Lugar de Procedencia**
              DropdownButtonFormField<String>(
                value: _lugarProcedencia,
                items: lugares
                    .map((lugar) =>
                        DropdownMenuItem(value: lugar, child: Text(lugar)))
                    .toList(),
                onChanged: (value) => setState(() => _lugarProcedencia = value),
                decoration:
                    const InputDecoration(labelText: "Lugar de Procedencia"),
                validator: (value) =>
                    value == null ? 'Seleccione un lugar' : null,
              ),
              const SizedBox(height: 20),

              // 🔥 Deshabilitar el botón de "Guardar" mientras está cargando
              estado.when(
                data: (_) => ElevatedButton(
                  onPressed: _guardarCateter,
                  child: const Text("Guardar"),
                ),
                loading: () => const CircularProgressIndicator(),
                error: (e, _) => Column(
                  children: [
                    Text('Error: $e',
                        style: const TextStyle(color: Colors.red)),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: _guardarCateter,
                      child: const Text("Reintentar"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
