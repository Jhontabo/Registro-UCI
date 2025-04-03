import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../data/dto/create_sonda_dto.dart';
import '../../controllers/create_sonda_controller.dart';
import '../../../data/constants/constants.dart';

class CreateSondaForm extends ConsumerStatefulWidget {
  final String idIngreso;

  const CreateSondaForm({super.key, required this.idIngreso});

  @override
  ConsumerState<CreateSondaForm> createState() => _CreateSondaFormState();
}

class _CreateSondaFormState extends ConsumerState<CreateSondaForm> {
  final _formKey = GlobalKey<FormState>();
  String? regionSeleccionada;
  String? tipoSondaSeleccionado;
  DateTime fechaColocacion = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final createSondaState = ref.watch(createSondaControllerProvider);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          // ✅ DROPDOWN REGIÓN ANATÓMICA
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(labelText: "Región Anatómica"),
            value: regionSeleccionada,
            isExpanded: true, // ✅ Evita que el texto se corte
            items: sondasPorRegion.keys.map((region) {
              return DropdownMenuItem(
                value: region,
                child: Text(
                  region,
                  overflow:
                      TextOverflow.ellipsis, // ✅ Si es largo, muestra "..."
                  maxLines: 1, // ✅ Evita desbordamiento
                ),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                regionSeleccionada = value;
                tipoSondaSeleccionado = null; // ✅ Resetea el tipo de sonda
              });
            },
            validator: (value) =>
                value == null ? 'Seleccione una región anatómica' : null,
          ),

          const SizedBox(height: 10),

          // ✅ DROPDOWN TIPO DE SONDA
          if (regionSeleccionada != null)
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: "Tipo de Sonda"),
              value: tipoSondaSeleccionado,
              isExpanded: true, // ✅ Evita desbordamiento
              items: (sondasPorRegion[regionSeleccionada] ?? [])
                  .map((sonda) => DropdownMenuItem(
                        value: sonda,
                        child: Text(
                          sonda,
                          overflow: TextOverflow
                              .ellipsis, // ✅ Muestra "..." si es largo
                          maxLines: 1, // ✅ Mantiene el texto en una sola línea
                        ),
                      ))
                  .toList(),
              onChanged: (value) =>
                  setState(() => tipoSondaSeleccionado = value),
              validator: (value) =>
                  value == null ? 'Seleccione un tipo de sonda' : null,
            ),

          const SizedBox(height: 16),

          // ✅ BOTÓN DE CREACIÓN
          ElevatedButton(
            onPressed: createSondaState.isLoading
                ? null
                : () {
                    if (_formKey.currentState!.validate()) {
                      final dto = CreateSondaDto(
                        tipo: tipoSondaSeleccionado!,
                        regionAnatomica: regionSeleccionada!,
                        fechaColocacion: fechaColocacion,
                        idIngreso: widget.idIngreso,
                      );
                      ref
                          .read(createSondaControllerProvider.notifier)
                          .createSonda(dto)
                          .then((_) {
                        Navigator.pop(
                            context); // ✅ Cierra la pantalla después de crear
                      }).catchError((error) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text("Error al crear sonda: $error")),
                        );
                      });
                    }
                  },
            child: createSondaState.isLoading
                ? const CircularProgressIndicator()
                : const Text("Crear Sonda"),
          ),
        ],
      ),
    );
  }
}
