import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../features/cateteres/data/repositories/cateteres_repository.dart';
import 'package:registro_uci/features/cateteres/domain/models/cateter.dart';
import 'package:intl/intl.dart';

class EditCateterPage extends ConsumerStatefulWidget {
  final String idIngreso;
  final Cateter cateter;

  const EditCateterPage({
    super.key,
    required this.idIngreso,
    required this.cateter,
  });

  @override
  ConsumerState<EditCateterPage> createState() => _EditCateterPageState();
}

class _EditCateterPageState extends ConsumerState<EditCateterPage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _tipoController;
  late TextEditingController _fechaColocacionController;
  late TextEditingController _ubicacionController;
  late TextEditingController _duracionController;

  @override
  void initState() {
    super.initState();

    _tipoController = TextEditingController(text: widget.cateter.tipo);

    // ✅ Convierte `DateTime` a String en formato 'yyyy-MM-dd'
    _fechaColocacionController = TextEditingController(
      text: DateFormat('yyyy-MM-dd').format(widget.cateter.fechaInsercion),
    );

    _ubicacionController = TextEditingController(text: widget.cateter.sitio);

    // ✅ Manejo seguro de `fechaRetiro`
    if (widget.cateter.fechaRetiro != null) {
      DateTime fechaInsercion =
          widget.cateter.fechaInsercion; // ✅ Ya es DateTime
      DateTime fechaRetiro = widget.cateter.fechaRetiro!; // ✅ Ya es DateTime

      int diasDuracion = fechaRetiro.difference(fechaInsercion).inDays;

      _duracionController =
          TextEditingController(text: diasDuracion.toString());
    } else {
      _duracionController = TextEditingController(text: 'No retirado');
    }
  }

  @override
  void dispose() {
    _tipoController.dispose();
    _fechaColocacionController.dispose();
    _ubicacionController.dispose();
    _duracionController.dispose();
    super.dispose();
  }

  Future<void> _guardarCambios() async {
    if (_formKey.currentState!.validate()) {
      final nuevoCateter = Cateter(
        id: widget.cateter.id,
        tipo: _tipoController.text,
        sitio: _ubicacionController.text,

        // ✅ Mantener fechaInsercion como DateTime
        fechaInsercion: _fechaColocacionController.text.isNotEmpty
            ? DateTime.parse(
                _fechaColocacionController.text) // ✅ Usa DateTime directamente
            : DateTime.now(),

        fechaRetiro: null, // Puedes agregar otro campo si es necesario
        lugarProcedencia: "Hospitalización",
      );

      await ref
          .read(cateteresRepositoryProvider)
          .agregarCateter(widget.idIngreso, nuevoCateter);

      ref.invalidate(cateteresByIngresoProvider);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Catéter actualizado correctamente")),
      );

      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Editar Catéter")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _tipoController,
                decoration: const InputDecoration(labelText: "Tipo de catéter"),
                validator: (value) =>
                    value!.isEmpty ? "Campo obligatorio" : null,
              ),
              TextFormField(
                controller: _fechaColocacionController,
                decoration:
                    const InputDecoration(labelText: "Fecha de colocación"),
                validator: (value) =>
                    value!.isEmpty ? "Campo obligatorio" : null,
              ),
              TextFormField(
                controller: _ubicacionController,
                decoration: const InputDecoration(labelText: "Ubicación"),
                validator: (value) =>
                    value!.isEmpty ? "Campo obligatorio" : null,
              ),
              TextFormField(
                controller: _duracionController,
                decoration: const InputDecoration(
                    labelText: "Duración estimada (días)"),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value!.isEmpty ? "Campo obligatorio" : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _guardarCambios,
                child: const Text("Guardar cambios"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
