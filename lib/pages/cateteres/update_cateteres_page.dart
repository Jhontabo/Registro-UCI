import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:registro_uci/features/cateteres/data/constants/constants.dart';
import 'package:registro_uci/features/cateteres/data/dto/update_cateter_dto.dart';
import 'package:registro_uci/features/cateteres/data/providers/cateteres_providers.dart';
import 'package:registro_uci/features/cateteres/domain/models/cateter.dart';

class EditCateterPage extends ConsumerStatefulWidget {
  final String idIngreso;
  final Cateter cateter;

  const EditCateterPage({
    super.key,
    required this.idIngreso,
    required this.cateter,
  });

  @override
  _EditCateterPageState createState() => _EditCateterPageState();
}

class _EditCateterPageState extends ConsumerState<EditCateterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TextEditingController fechaInsercionController;
  late TextEditingController fechaRetiroController;
  String? selectedTipo;
  String? selectedSitio;
  String? selectedLugarProcedencia;

  @override
  void initState() {
    super.initState();
    fechaInsercionController = TextEditingController(
        text: DateFormat('yyyy-MM-dd').format(widget.cateter.fechaInsercion));
    fechaRetiroController = TextEditingController(
        text: widget.cateter.fechaRetiro != null
            ? DateFormat('yyyy-MM-dd').format(widget.cateter.fechaRetiro!)
            : "");

    selectedTipo =
        tiposCateter.contains(widget.cateter.tipo) ? widget.cateter.tipo : null;
    selectedSitio = sitiosCateter.contains(widget.cateter.sitio)
        ? widget.cateter.sitio
        : null;
    selectedLugarProcedencia =
        lugaresProcedenciaCateter.contains(widget.cateter.lugarProcedencia)
            ? widget.cateter.lugarProcedencia
            : null;
  }

  @override
  void dispose() {
    fechaInsercionController.dispose();
    fechaRetiroController.dispose();
    super.dispose();
  }

  Future<void> _seleccionarFecha(TextEditingController controller) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      setState(() {
        controller.text = DateFormat('yyyy-MM-dd').format(picked!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Editar Catéter")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // **Tipo de catéter**
              DropdownButtonFormField<String>(
                initialValue: selectedTipo,
                onChanged: (value) => setState(() => selectedTipo = value),
                items: tiposCateter.map((tipo) {
                  return DropdownMenuItem(value: tipo, child: Text(tipo));
                }).toList(),
                decoration: const InputDecoration(labelText: "Tipo de Catéter"),
                validator: (value) =>
                    value == null ? "Seleccione un tipo de catéter" : null,
              ),
              const SizedBox(height: 16),

              // **Sitio de inserción**
              DropdownButtonFormField<String>(
                initialValue: selectedSitio,
                onChanged: (value) => setState(() => selectedSitio = value),
                items: sitiosCateter.map((sitio) {
                  return DropdownMenuItem(value: sitio, child: Text(sitio));
                }).toList(),
                decoration:
                    const InputDecoration(labelText: "Sitio de Inserción"),
                validator: (value) =>
                    value == null ? "Seleccione un sitio de inserción" : null,
              ),
              const SizedBox(height: 16),

              // **Lugar de procedencia**
              DropdownButtonFormField<String>(
                initialValue: selectedLugarProcedencia,
                onChanged: (value) =>
                    setState(() => selectedLugarProcedencia = value),
                items: lugaresProcedenciaCateter.map((lugar) {
                  return DropdownMenuItem(value: lugar, child: Text(lugar));
                }).toList(),
                decoration:
                    const InputDecoration(labelText: "Lugar de Procedencia"),
                validator: (value) =>
                    value == null ? "Seleccione un lugar de procedencia" : null,
              ),
              const SizedBox(height: 16),

              // **Fecha de inserción**
              TextFormField(
                controller: fechaInsercionController,
                decoration:
                    const InputDecoration(labelText: "Fecha de Inserción"),
                readOnly: true,
                onTap: () => _seleccionarFecha(fechaInsercionController),
                validator: (value) =>
                    value!.isEmpty ? "Seleccione una fecha de inserción" : null,
              ),
              const SizedBox(height: 16),

              // **Fecha de retiro**
              TextFormField(
                controller: fechaRetiroController,
                decoration: const InputDecoration(labelText: "Fecha de Retiro"),
                readOnly: true,
                onTap: () => _seleccionarFecha(fechaRetiroController),
              ),
              const SizedBox(height: 16),

              // **Botón de actualizar**
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final dto = UpdateCateterDto(
                      tipo: selectedTipo,
                      sitio: selectedSitio,
                      fechaInsercion: fechaInsercionController.text.isNotEmpty
                          ? DateTime.parse(fechaInsercionController.text)
                          : null,
                      fechaRetiro: fechaRetiroController.text.isNotEmpty
                          ? DateTime.parse(fechaRetiroController.text)
                          : null,
                      lugarProcedencia: selectedLugarProcedencia,
                    );

                    await ref.read(actualizarCateterProvider((
                      idIngreso: widget.idIngreso,
                      idCateter: widget.cateter.id,
                      dto: dto,
                    )).future);

                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("✅ Catéter actualizado exitosamente."),
                        ),
                      );
                      Navigator.pop(context);
                    }
                  }
                },
                child: const Text("Guardar Cambios"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
