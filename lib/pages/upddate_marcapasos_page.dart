import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:registro_uci/features/marcapasos/data/dto/update_marcapaso_dto.dart';
import 'package:registro_uci/features/marcapasos/data/providers/marcapasos_provider.dart';
import 'package:registro_uci/features/marcapasos/domain/models/marcapaso.dart';
import 'package:intl/intl.dart';
import '../features/marcapasos/data/constants/constants.dart'; // Importación de las constantes

class EditMarcapasoPage extends ConsumerStatefulWidget {
  final String idIngreso;
  final Marcapaso marcapaso;

  const EditMarcapasoPage({
    super.key,
    required this.idIngreso,
    required this.marcapaso,
  });

  @override
  _EditMarcapasoPageState createState() => _EditMarcapasoPageState();
}

class _EditMarcapasoPageState extends ConsumerState<EditMarcapasoPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TextEditingController fechaController;
  late TextEditingController frecuenciaController;
  late TextEditingController sensibilidadController;
  late TextEditingController salidaController;
  String? selectedModo;
  String? selectedVia;
  int? selectedFrecuencia;
  double? selectedSensibilidad;
  double? selectedSalida;

  @override
  void initState() {
    super.initState();
    fechaController =
        TextEditingController(text: widget.marcapaso.fechaColocacion);
    frecuenciaController =
        TextEditingController(text: widget.marcapaso.frecuencia.toString());
    sensibilidadController =
        TextEditingController(text: widget.marcapaso.sensibilidad.toString());
    salidaController =
        TextEditingController(text: widget.marcapaso.salida.toString());

    // Asegurar que el valor seleccionado exista en la lista de opciones
    selectedModo = modosMarcapaso.contains(widget.marcapaso.modo)
        ? widget.marcapaso.modo
        : null;
    selectedVia = viasMarcapaso.contains(widget.marcapaso.via)
        ? widget.marcapaso.via
        : null;
    selectedFrecuencia =
        frecuenciasMarcapaso.contains(widget.marcapaso.frecuencia)
            ? widget.marcapaso.frecuencia
            : null;
    selectedSensibilidad =
        sensibilidadesMarcapaso.contains(widget.marcapaso.sensibilidad)
            ? widget.marcapaso.sensibilidad
            : null;
    selectedSalida = salidasMarcapaso.contains(widget.marcapaso.salida)
        ? widget.marcapaso.salida
        : null;
  }

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
    return Scaffold(
      appBar: AppBar(title: const Text("Editar Marcapaso")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // **Fecha de colocación**
              TextFormField(
                controller: fechaController,
                decoration:
                    const InputDecoration(labelText: "Fecha de colocación"),
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

              // **Modo**
              DropdownButtonFormField<String>(
                value: selectedModo,
                onChanged: (value) => setState(() => selectedModo = value),
                items: modosMarcapaso.map((modo) {
                  return DropdownMenuItem(value: modo, child: Text(modo));
                }).toList(),
                decoration: const InputDecoration(labelText: "Modo"),
              ),
              const SizedBox(height: 16),

              // **Vía**
              DropdownButtonFormField<String>(
                value: selectedVia,
                onChanged: (value) => setState(() => selectedVia = value),
                items: viasMarcapaso.map((via) {
                  return DropdownMenuItem(value: via, child: Text(via));
                }).toList(),
                decoration: const InputDecoration(labelText: "Vía"),
                hint: const Text("Seleccione una vía"),
              ),
              const SizedBox(height: 16),

              // **Frecuencia**
              DropdownButtonFormField<int>(
                value: selectedFrecuencia,
                onChanged: (value) =>
                    setState(() => selectedFrecuencia = value),
                items: frecuenciasMarcapaso.map((frecuencia) {
                  return DropdownMenuItem(
                      value: frecuencia, child: Text(frecuencia.toString()));
                }).toList(),
                decoration: const InputDecoration(labelText: "Frecuencia"),
              ),
              const SizedBox(height: 16),

              // **Sensibilidad**
              DropdownButtonFormField<double>(
                value: selectedSensibilidad,
                onChanged: (value) =>
                    setState(() => selectedSensibilidad = value),
                items: sensibilidadesMarcapaso.map((sensibilidad) {
                  return DropdownMenuItem(
                      value: sensibilidad,
                      child: Text(sensibilidad.toString()));
                }).toList(),
                decoration: const InputDecoration(labelText: "Sensibilidad"),
              ),
              const SizedBox(height: 16),

              // **Salida**
              DropdownButtonFormField<double>(
                value: selectedSalida,
                onChanged: (value) => setState(() => selectedSalida = value),
                items: salidasMarcapaso.map((salida) {
                  return DropdownMenuItem(
                      value: salida, child: Text(salida.toString()));
                }).toList(),
                decoration: const InputDecoration(labelText: "Salida"),
              ),
              const SizedBox(height: 16),

              // **Botón de guardar**
              ElevatedButton(
                onPressed: () async {
                  final dto = UpdateMarcapasoDto(
                    fechaColocacion: fechaController.text,
                    modo: selectedModo,
                    via: selectedVia,
                    frecuencia: selectedFrecuencia ??
                        0, // Se debe asignar un valor predeterminado si es null
                    sensibilidad: selectedSensibilidad ?? 0.0,
                    salida: selectedSalida ?? 0.0,
                  );

                  await ref.read(actualizarMarcapasoProvider((
                    idIngreso: widget.idIngreso,
                    idMarcapaso: widget.marcapaso.id,
                    dto: dto,
                  )).future);

                  Navigator.of(context).pop();
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
