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
  DateTime? _fechaInsercion; // ✅ Ahora es seleccionable

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

  Future<void> _seleccionarFecha() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _fechaInsercion ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != _fechaInsercion) {
      setState(() {
        _fechaInsercion = picked;
      });
    }
  }

  Future<void> _guardarCateter() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      if (_fechaInsercion == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Debe seleccionar una fecha")),
        );
        return;
      }

      final nuevoCateter = CreateCateterDto(
        idIngreso: widget.idIngreso,
        tipo: _tipo!,
        sitio: _sitio!,
        fechaInsercion: _fechaInsercion!, // ✅ Ahora es `DateTime`, no `String`
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

    return AlertDialog(
      title: const Text("Agregar Catéter"),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButtonFormField(
              value: _tipo,
              items: tipos
                  .map((tipo) =>
                      DropdownMenuItem(value: tipo, child: Text(tipo)))
                  .toList(),
              onChanged: (value) => setState(() => _tipo = value),
              decoration: const InputDecoration(labelText: "Tipo de Catéter"),
              validator: (value) => value == null ? 'Seleccione un tipo' : null,
            ),
            DropdownButtonFormField(
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
            DropdownButtonFormField(
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
            ListTile(
              title: Text(_fechaInsercion == null
                  ? "Seleccione una fecha"
                  : "Fecha: ${DateFormat('yyyy-MM-dd').format(_fechaInsercion!)}"), // ✅ Formato corregido
              trailing: const Icon(Icons.calendar_today),
              onTap: _seleccionarFecha, // ✅ Permite seleccionar la fecha
            ),
            const SizedBox(height: 20),
            estado.when(
              data: (_) => ElevatedButton(
                onPressed: _guardarCateter,
                child: const Text("Guardar"),
              ),
              loading: () => const CircularProgressIndicator(),
              error: (e, _) =>
                  Text('Error: $e', style: const TextStyle(color: Colors.red)),
            ),
          ],
        ),
      ),
    );
  }
}
