import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/features/control_cambio_posicion/data/providers/cambio_posicion_provider.dart';
import 'package:registro_uci/features/control_cambio_posicion/domain/models/cambio_posicion.dart';

class CambioPosicionCard extends ConsumerWidget {
  final String idIngreso;
  final String idRegistroDiario;

  const CambioPosicionCard({
    super.key,
    required this.idIngreso,
    required this.idRegistroDiario,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final params = CambioPosicionParams(
      idIngreso: idIngreso,
      idRegistroDiario: idRegistroDiario,
    );
    final cambiosData = ref.watch(cambioPosicionProvider(params));

    return Card(
      margin: const EdgeInsets.all(16.0),
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Cambios de Posición',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12.0),
            cambiosData.when(
              data: (data) {
                final ultimoCambio = data.isNotEmpty ? data.last : null;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Última posición registrada: ${ultimoCambio?.posicion ?? 'Ninguna'}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Hora: ${ultimoCambio?.hora ?? '--'}:00',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () => _mostrarSelectorPosicion(context, ref),
                      child: const Text('Registrar Cambio'),
                    ),
                    const SizedBox(height: 16.0),
                    ..._buildListaHoras(data, context),
                  ],
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, _) => Text('Error: $error'),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildListaHoras(
      List<CambioDePosicion> cambios, BuildContext context) {
    return List.generate(9, (index) {
      final hora = 8 + index;
      final cambio = cambios.firstWhere(
        (c) => c.hora == hora,
        orElse: () => const CambioDePosicion(
          idCambioDePosicion: '',
          hora: 0,
          posicion: '',
          orden: 0,
        ), // Objeto vacío como valor por defecto
      );

      final tieneRegistro = cambio.posicion.isNotEmpty;

      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          children: [
            Text(
              'Hora: $hora:00',
              style: const TextStyle(fontSize: 16),
            ),
            const Spacer(),
            Text(
              tieneRegistro ? cambio.posicion : 'Sin registro',
              style: TextStyle(
                color: tieneRegistro ? Colors.green : Colors.grey,
              ),
            ),
            const SizedBox(width: 8.0),
            IconButton(
              icon: const Icon(Icons.chevron_right),
              onPressed: () => _editarPosicion(context, hora),
            ),
          ],
        ),
      );
    });
  }

  void _mostrarSelectorPosicion(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => _SelectorPosicionDialog(
        idIngreso: idIngreso,
        idRegistroDiario: idRegistroDiario,
      ),
    );
  }

  void _editarPosicion(BuildContext context, int hora) {
    showDialog(
      context: context,
      builder: (context) => _SelectorPosicionDialog(
        idIngreso: idIngreso,
        idRegistroDiario: idRegistroDiario,
        horaInicial: hora,
      ),
    );
  }
}

class _SelectorPosicionDialog extends ConsumerStatefulWidget {
  final String idIngreso;
  final String idRegistroDiario;
  final int? horaInicial;

  const _SelectorPosicionDialog({
    required this.idIngreso,
    required this.idRegistroDiario,
    this.horaInicial,
  });

  @override
  _SelectorPosicionDialogState createState() => _SelectorPosicionDialogState();
}

class _SelectorPosicionDialogState
    extends ConsumerState<_SelectorPosicionDialog> {
  late int selectedHora;
  String selectedPosicion = 'Decúbito dorsal';

  @override
  void initState() {
    super.initState();
    selectedHora = widget.horaInicial ?? DateTime.now().hour;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.horaInicial != null
          ? 'Editar posición para las ${widget.horaInicial}:00'
          : 'Seleccionar posición'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.horaInicial == null) ...[
            DropdownButtonFormField<int>(
              value: selectedHora,
              decoration: const InputDecoration(
                labelText: 'Hora',
                border: OutlineInputBorder(),
              ),
              items: List.generate(16, (i) => i + 8) // Horas de 8 a 23
                  .map((hora) => DropdownMenuItem(
                        value: hora,
                        child: Text('$hora:00'),
                      ))
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() => selectedHora = value);
                }
              },
            ),
            const SizedBox(height: 16),
          ],
          DropdownButtonFormField<String>(
            value: selectedPosicion,
            decoration: const InputDecoration(
              labelText: 'Posición',
              border: OutlineInputBorder(),
            ),
            items: [
              'Decúbito dorsal',
              'Decúbito lateral',
              'Prono',
              'Sentado',
              'Fowler',
            ]
                .map((pos) => DropdownMenuItem(
                      value: pos,
                      child: Text(pos),
                    ))
                .toList(),
            onChanged: (value) {
              if (value != null) {
                setState(() => selectedPosicion = value);
              }
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: () => _guardarCambio(context),
          child: const Text('Guardar'),
        ),
      ],
    );
  }

  Future<void> _guardarCambio(BuildContext context) async {
    try {
      await ref.read(guardarCambioPosicionProvider(
        GuardarCambioPosicionParams(
          idIngreso: widget.idIngreso,
          idRegistroDiario: widget.idRegistroDiario,
          hora: selectedHora,
          posicion: selectedPosicion,
        ),
      ).future);

      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cambio de posición registrado')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }
}
