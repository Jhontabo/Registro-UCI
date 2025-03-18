import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../data/dto/update_sonda_dto.dart';
import '../../../domain/models/sonda.dart';
import '../../controllers/update_sonda_controller.dart';
import '../../../data/constants/constants.dart';

class UpdateSondaForm extends ConsumerStatefulWidget {
  final Sonda sonda;
  final String idIngreso; // ✅ Nuevo parámetro

  const UpdateSondaForm({
    super.key,
    required this.sonda,
    required this.idIngreso,
  });

  @override
  ConsumerState<UpdateSondaForm> createState() => _UpdateSondaFormState();
}

class _UpdateSondaFormState extends ConsumerState<UpdateSondaForm> {
  final _formKey = GlobalKey<FormState>();
  late String tipo;
  late String regionAnatomica;

  @override
  void initState() {
    super.initState();

    // ✅ Asegura que la región seleccionada es válida
    regionAnatomica =
        sondasPorRegion.keys.contains(widget.sonda.regionAnatomica)
            ? widget.sonda.regionAnatomica
            : sondasPorRegion.keys.first;

    // ✅ Asegura que el tipo seleccionado es válido
    tipo =
        sondasPorRegion[regionAnatomica]?.contains(widget.sonda.tipo) ?? false
            ? widget.sonda.tipo
            : sondasPorRegion[regionAnatomica]?.first ?? "";
  }

  @override
  Widget build(BuildContext context) {
    final updateSondaState = ref.watch(updateSondaControllerProvider);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          // ✅ DROPDOWN REGIÓN ANATÓMICA
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(labelText: "Región Anatómica"),
            value: regionAnatomica.isNotEmpty ? regionAnatomica : null,
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
                regionAnatomica = value!;
                tipo = sondasPorRegion[regionAnatomica]?.first ?? "";
              });
            },
          ),

          const SizedBox(height: 10),

          // ✅ DROPDOWN TIPO DE SONDA
          if (regionAnatomica.isNotEmpty &&
              sondasPorRegion[regionAnatomica] != null)
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: "Tipo de Sonda"),
              value: sondasPorRegion[regionAnatomica]!.contains(tipo)
                  ? tipo
                  : sondasPorRegion[regionAnatomica]!
                      .first, // ✅ Asegura un valor válido
              isExpanded: true, // ✅ Evita desbordamiento
              items: sondasPorRegion[regionAnatomica]!
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
              onChanged: (value) => setState(() => tipo = value!),
            ),

          const SizedBox(height: 16),

          // ✅ BOTÓN DE ACTUALIZACIÓN
          ElevatedButton(
            onPressed: updateSondaState.isLoading
                ? null
                : () async {
                    if (_formKey.currentState!.validate()) {
                      final dto = UpdateSondaDto(
                        tipo: tipo,
                        regionAnatomica: regionAnatomica,
                      );
                      try {
                        await ref
                            .read(updateSondaControllerProvider.notifier)
                            .updateSonda(
                                widget.sonda.id, widget.idIngreso, dto);
                        Navigator.pop(
                            context); // ✅ Cierra la pantalla después de actualizar
                      } catch (error) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content:
                                  Text("Error al actualizar la sonda: $error")),
                        );
                      }
                    }
                  },
            child: updateSondaState.isLoading
                ? const CircularProgressIndicator()
                : const Text('Actualizar Sonda'),
          ),
        ],
      ),
    );
  }
}
