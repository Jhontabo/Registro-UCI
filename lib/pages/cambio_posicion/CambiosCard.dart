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
                    ..._buildListaHoras(data, context, ref),
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
    List<CambioDePosicion> cambios,
    BuildContext context,
    WidgetRef ref,
  ) {
    return List.generate(16, (index) {
      final hora = 8 + index;
      final cambio = cambios.firstWhere(
        (c) => c.hora == hora,
        orElse: () => const CambioDePosicion(
          idCambioDePosicion: '',
          hora: 0,
          posicion: '',
          orden: 0,
        ),
      );

      final tieneRegistro = cambio.posicion.isNotEmpty;

      return Card(
        margin: const EdgeInsets.symmetric(vertical: 4.0),
        elevation: 2,
        child: InkWell(
          onTap: () => _mostrarDetalleCambio(context, cambio, ref),
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Icon(
                  tieneRegistro ? Icons.check_circle : Icons.access_time,
                  color: tieneRegistro ? Colors.green : Colors.grey,
                ),
                const SizedBox(width: 12),
                Text(
                  '$hora:00',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: tieneRegistro ? Colors.green : Colors.grey[700],
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      tieneRegistro ? cambio.posicion : 'Sin registro',
                      style: TextStyle(
                        color: tieneRegistro ? Colors.green : Colors.grey,
                        fontStyle:
                            tieneRegistro ? FontStyle.normal : FontStyle.italic,
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: Icon(
                        Icons.add_circle_outline,
                        size: 20,
                        color: !tieneRegistro ? Colors.green : Colors.grey,
                      ),
                      onPressed: !tieneRegistro
                          ? () => _mostrarSelectorPosicion(
                                context,
                                ref,
                                horaInicial: hora,
                              )
                          : null,
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: Icon(
                        Icons.edit_outlined,
                        size: 20,
                        color: !tieneRegistro ? Colors.blue : Colors.grey,
                      ),
                      onPressed: !tieneRegistro
                          ? () => _mostrarSelectorPosicion(
                                context,
                                ref,
                                horaInicial: hora,
                              )
                          : null,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  void _mostrarDetalleCambio(
    BuildContext context,
    CambioDePosicion cambio,
    WidgetRef ref,
  ) {
    final tieneRegistro = cambio.posicion.isNotEmpty;

    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Detalle de posición',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              ListTile(
                leading: Icon(
                  tieneRegistro ? Icons.check_circle : Icons.info_outline,
                  color: tieneRegistro ? Colors.green : Colors.blue,
                ),
                title: Text('Hora: ${cambio.hora}:00'),
                subtitle: Text(
                    'Posición: ${tieneRegistro ? cambio.posicion : 'Sin registro'}'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cerrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _mostrarSelectorPosicion(
    BuildContext context,
    WidgetRef ref, {
    int? horaInicial,
  }) {
    showDialog(
      context: context,
      builder: (context) => _SelectorPosicionDialog(
        key: UniqueKey(),
        idIngreso: idIngreso,
        idRegistroDiario: idRegistroDiario,
        horaInicial: horaInicial,
      ),
    );
  }
}

class _SelectorPosicionDialog extends ConsumerStatefulWidget {
  final String idIngreso;
  final String idRegistroDiario;
  final int? horaInicial;

  const _SelectorPosicionDialog({
    super.key,
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
  late String selectedPosicion;
  String? idCambioExistente;

  @override
  void initState() {
    super.initState();
    selectedHora = widget.horaInicial?.clamp(8, 23) ?? 8;

    if (widget.horaInicial != null) {
      final cambios = ref.read(cambioPosicionProvider(CambioPosicionParams(
        idIngreso: widget.idIngreso,
        idRegistroDiario: widget.idRegistroDiario,
      )));

      final data = cambios.asData?.value ?? [];
      final cambioExistente = data.firstWhere(
        (c) => c.hora == widget.horaInicial && c.idCambioDePosicion.isNotEmpty,
        orElse: () => const CambioDePosicion(
          idCambioDePosicion: '',
          hora: 0,
          posicion: '',
          orden: 0,
        ),
      );

      idCambioExistente = cambioExistente.idCambioDePosicion.isNotEmpty
          ? cambioExistente.idCambioDePosicion
          : null;
      selectedPosicion = cambioExistente.posicion.isNotEmpty
          ? cambioExistente.posicion
          : 'Decúbito dorsal';
    } else {
      selectedPosicion = 'Decúbito dorsal';
      idCambioExistente = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.horaInicial != null
                  ? 'Editando posición de las ${widget.horaInicial}:00'
                  : 'Nuevo registro de posición',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            if (widget.horaInicial == null) ...[
              _buildHoraSelector(),
              const SizedBox(height: 20),
            ],
            _buildPosicionSelector(),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancelar'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _guardarCambio(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                  ),
                  child: const Text('Guardar',
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHoraSelector() {
    final horasDisponibles = List.generate(16, (i) => i + 8);

    return DropdownButtonFormField<int>(
      value: horasDisponibles.contains(selectedHora) ? selectedHora : 8,
      decoration: InputDecoration(
        labelText: 'Hora',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        prefixIcon: const Icon(Icons.access_time),
      ),
      items: horasDisponibles
          .map((hora) => DropdownMenuItem(
                value: hora,
                child: Text('$hora:00'),
              ))
          .toList(),
      onChanged: (value) {
        if (value != null) setState(() => selectedHora = value);
      },
    );
  }

  Widget _buildPosicionSelector() {
    return DropdownButtonFormField<String>(
      value: selectedPosicion,
      decoration: InputDecoration(
        labelText: 'Posición',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        prefixIcon: const Icon(Icons.airline_seat_recline_normal),
      ),
      items: [
        'Decúbito dorsal',
        'Decúbito lateral',
        'Prono',
        'Sentado',
        'Fowler',
      ].map((pos) => DropdownMenuItem(value: pos, child: Text(pos))).toList(),
      onChanged: (value) {
        if (value != null) setState(() => selectedPosicion = value);
      },
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
          idCambioPosicion: idCambioExistente,
        ),
      ).future);

      ref.invalidate(cambioPosicionProvider(CambioPosicionParams(
        idIngreso: widget.idIngreso,
        idRegistroDiario: widget.idRegistroDiario,
      )));

      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(idCambioExistente != null
              ? 'Cambio actualizado correctamente'
              : 'Nuevo registro creado'),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }
}
