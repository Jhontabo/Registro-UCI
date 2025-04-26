import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/features/control_sedacion/data/providers/control_sedacion_provider.dart';
import 'package:registro_uci/features/control_sedacion/domain/models/control_sedacion.dart';

class ControlSedacionCard extends ConsumerWidget {
  final String idIngreso;
  final String idRegistroDiario;

  const ControlSedacionCard({
    super.key,
    required this.idIngreso,
    required this.idRegistroDiario,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final params = ControlSedacionParams(
      idIngreso: idIngreso,
      idRegistroDiario: idRegistroDiario,
    );
    final sedacionData = ref.watch(controlSedacionProvider(params));

    return Card(
      margin: const EdgeInsets.all(16.0),
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Control de Sedación',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12.0),
            sedacionData.when(
              data: (data) {
                final ultimoControl = data.isNotEmpty ? data.last : null;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Último RASS registrado: ${ultimoControl?.rass ?? 'Ninguno'}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Hora: ${_formatearHora(ultimoControl?.hora ?? -1)}',
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

  String _formatearHora(int hora) {
    if (hora < 0) return '--';
    final periodo = hora < 12 ? 'AM' : 'PM';
    final hora12 = hora == 0 ? 12 : (hora > 12 ? hora - 12 : hora);
    return '${hora.toString().padLeft(2, '0')}:00 ($hora12$periodo)';
  }

  List<Widget> _buildListaHoras(
    List<ControlSedacion> controles,
    BuildContext context,
    WidgetRef ref,
  ) {
    // Lista de horas de 8AM a 7AM (23 horas)
    final horas = [
      8,
      9,
      10,
      11,
      12,
      13,
      14,
      15,
      16,
      17,
      18,
      19,
      20,
      21,
      22,
      23,
      0,
      1,
      2,
      3,
      4,
      5,
      6,
      7
    ];

    return horas.map((hora) {
      final control = controles.firstWhere(
        (c) => c.hora == hora,
        orElse: () => const ControlSedacion(
          id: '',
          hora: 0,
          observacion: '',
          orden: 0,
          rass: 0,
        ),
      );

      final tieneRegistro = control.id.isNotEmpty;

      return Card(
        margin: const EdgeInsets.symmetric(vertical: 4.0),
        elevation: 2,
        child: InkWell(
          onTap: () => _mostrarDetalleControl(context, control, ref),
          borderRadius: BorderRadius.circular(8),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final useVerticalLayout = constraints.maxWidth < 300;

              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: useVerticalLayout
                    ? _buildVerticalLayout(
                        hora, tieneRegistro, control, context, ref)
                    : _buildHorizontalLayout(
                        hora, tieneRegistro, control, context, ref),
              );
            },
          ),
        ),
      );
    }).toList();
  }

  Widget _buildHorizontalLayout(
    int hora,
    bool tieneRegistro,
    ControlSedacion control,
    BuildContext context,
    WidgetRef ref,
  ) {
    return Row(
      children: [
        Icon(
          tieneRegistro ? Icons.check_circle : Icons.access_time,
          color: tieneRegistro ? Colors.green : Colors.grey,
        ),
        const SizedBox(width: 12),
        Text(
          _formatearHora(hora),
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: tieneRegistro ? Colors.green : Colors.grey[700],
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            tieneRegistro ? 'RASS: ${control.rass}' : 'Sin registro',
            style: TextStyle(
              color: tieneRegistro ? Colors.green : Colors.grey,
              fontStyle: tieneRegistro ? FontStyle.normal : FontStyle.italic,
            ),
          ),
        ),
        _buildActionButtons(tieneRegistro, hora, control, context, ref),
      ],
    );
  }

  Widget _buildVerticalLayout(
    int hora,
    bool tieneRegistro,
    ControlSedacion control,
    BuildContext context,
    WidgetRef ref,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              tieneRegistro ? Icons.check_circle : Icons.access_time,
              color: tieneRegistro ? Colors.green : Colors.grey,
            ),
            const SizedBox(width: 12),
            Text(
              _formatearHora(hora),
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: tieneRegistro ? Colors.green : Colors.grey[700],
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          tieneRegistro ? 'RASS: ${control.rass}' : 'Sin registro',
          style: TextStyle(
            color: tieneRegistro ? Colors.green : Colors.grey,
            fontStyle: tieneRegistro ? FontStyle.normal : FontStyle.italic,
          ),
        ),
        const SizedBox(height: 8),
        _buildActionButtons(tieneRegistro, hora, control, context, ref),
      ],
    );
  }

  Widget _buildActionButtons(
    bool tieneRegistro,
    int hora,
    ControlSedacion control,
    BuildContext context,
    WidgetRef ref,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          icon: Icon(
            Icons.add_circle_outline,
            color: !tieneRegistro ? Colors.green : Colors.grey,
          ),
          onPressed: !tieneRegistro
              ? () => _mostrarSelectorSedacion(
                    context,
                    ref,
                    horaInicial: hora,
                  )
              : null,
        ),
        IconButton(
          icon: Icon(
            Icons.edit_outlined,
            color: tieneRegistro ? Colors.blue : Colors.grey,
          ),
          onPressed: tieneRegistro
              ? () => _mostrarSelectorSedacion(
                    context,
                    ref,
                    horaInicial: hora,
                    idControlExistente: control.id,
                  )
              : null,
        ),
      ],
    );
  }

  void _mostrarDetalleControl(
    BuildContext context,
    ControlSedacion control,
    WidgetRef ref,
  ) {
    final tieneRegistro = control.id.isNotEmpty;

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
                'Detalle de Sedación',
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
                title: Text('Hora: ${_formatearHora(control.hora)}'),
                subtitle: Text('RASS: ${tieneRegistro ? control.rass : 'N/A'}'),
              ),
              const SizedBox(height: 10),
              ListTile(
                leading: const Icon(Icons.notes),
                title: const Text('Observación'),
                subtitle: Text(control.observacion),
              ),
              const SizedBox(height: 10),
              ListTile(
                leading: const Icon(Icons.sort),
                title: const Text('Orden'),
                subtitle: Text('${control.orden}'),
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

  void _mostrarSelectorSedacion(
    BuildContext context,
    WidgetRef ref, {
    int? horaInicial,
    String? idControlExistente,
  }) {
    showDialog(
      context: context,
      builder: (context) => _SelectorSedacionDialog(
        key: UniqueKey(),
        idIngreso: idIngreso,
        idRegistroDiario: idRegistroDiario,
        horaInicial: horaInicial,
        idControlExistente: idControlExistente,
      ),
    );
  }
}

class _SelectorSedacionDialog extends ConsumerStatefulWidget {
  final String idIngreso;
  final String idRegistroDiario;
  final int? horaInicial;
  final String? idControlExistente;

  const _SelectorSedacionDialog({
    super.key,
    required this.idIngreso,
    required this.idRegistroDiario,
    this.horaInicial,
    this.idControlExistente,
  });

  @override
  _SelectorSedacionDialogState createState() => _SelectorSedacionDialogState();
}

class _SelectorSedacionDialogState
    extends ConsumerState<_SelectorSedacionDialog> {
  late int selectedHora;
  late int selectedRass;
  late String observacion;
  late int? selectedOrden;

  @override
  void initState() {
    super.initState();
    selectedHora = widget.horaInicial ?? 8;
    selectedRass = 0; // Valor inicial neutral
    observacion = '';
    selectedOrden = null;

    if (widget.idControlExistente != null) {
      _cargarDatosExistente();
    }
  }

  Future<void> _cargarDatosExistente() async {
    final controles = ref.read(controlSedacionProvider(ControlSedacionParams(
      idIngreso: widget.idIngreso,
      idRegistroDiario: widget.idRegistroDiario,
    )));

    final data = controles.asData?.value ?? [];
    final controlExistente = data.firstWhere(
      (c) => c.id == widget.idControlExistente,
      orElse: () => const ControlSedacion(
        id: '',
        hora: 0,
        observacion: '',
        orden: 0,
        rass: 0,
      ),
    );

    if (controlExistente.id.isNotEmpty) {
      setState(() {
        selectedHora = controlExistente.hora;
        selectedRass = controlExistente.rass;
        observacion = controlExistente.observacion;
        selectedOrden = controlExistente.orden;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.horaInicial != null
                    ? 'Editando sedación de las ${_formatearHora(widget.horaInicial!)}'
                    : 'Nuevo registro de sedación',
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
              _buildRassSelector(),
              const SizedBox(height: 20),
              _buildObservacionField(),
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
                    onPressed: () => _guardarControl(context),
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
      ),
    );
  }

  String _formatearHora(int hora) {
    final periodo = hora < 12 ? 'AM' : 'PM';
    final hora12 = hora == 0 ? 12 : (hora > 12 ? hora - 12 : hora);
    return '${hora.toString().padLeft(2, '0')}:00 ($hora12$periodo)';
  }

  Widget _buildHoraSelector() {
    final horasDisponibles = [
      8,
      9,
      10,
      11,
      12,
      13,
      14,
      15,
      16,
      17,
      18,
      19,
      20,
      21,
      22,
      23,
      0,
      1,
      2,
      3,
      4,
      5,
      6,
      7
    ];

    return DropdownButtonFormField<int>(
      value: horasDisponibles.contains(selectedHora) ? selectedHora : 8,
      decoration: InputDecoration(
        labelText: 'Hora',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        prefixIcon: const Icon(Icons.access_time),
      ),
      items: horasDisponibles.map((hora) {
        return DropdownMenuItem(
          value: hora,
          child: Text(_formatearHora(hora)),
        );
      }).toList(),
      onChanged: (value) {
        if (value != null) setState(() => selectedHora = value);
      },
    );
  }

  Widget _buildRassSelector() {
    return DropdownButtonFormField<int>(
      value: selectedRass,
      decoration: InputDecoration(
        labelText: 'Escala RASS',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        prefixIcon: const Icon(Icons.medical_services),
      ),
      items: const [
        DropdownMenuItem(
          value: 4,
          child: Text('+4 - COMBATIVO. ANSIOSO, VIOLENTO'),
        ),
        DropdownMenuItem(
          value: 3,
          child: Text('+3 - MUY AGITADO'),
        ),
        DropdownMenuItem(
          value: 2,
          child: Text('+2 - AGITADO'),
        ),
        DropdownMenuItem(
          value: 1,
          child: Text('+1 - ANSIOSO'),
        ),
        DropdownMenuItem(
          value: 0,
          child: Text('0 - ALERTA Y TRANQUILO'),
        ),
        DropdownMenuItem(
          value: -1,
          child: Text('-1 - ADORMILADO'),
        ),
        DropdownMenuItem(
          value: -2,
          child: Text('-2 - SEDACIÓN LIGERA'),
        ),
        DropdownMenuItem(
          value: -3,
          child: Text('-3 - SEDACIÓN MODERADA'),
        ),
        DropdownMenuItem(
          value: -4,
          child: Text('-4 - SEDACIÓN PROFUNDA'),
        ),
        DropdownMenuItem(
          value: -5,
          child: Text('-5 - SEDACIÓN MUY PROFUNDA'),
        ),
      ],
      onChanged: (value) {
        if (value != null) setState(() => selectedRass = value);
      },
      isExpanded: true,
    );
  }

  Widget _buildObservacionField() {
    return TextFormField(
      initialValue: observacion,
      decoration: InputDecoration(
        labelText: 'Observación',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        prefixIcon: const Icon(Icons.notes),
      ),
      maxLines: 3,
      onChanged: (value) => observacion = value,
    );
  }

  Future<void> _guardarControl(BuildContext context) async {
    try {
      await ref.read(guardarControlSedacionProvider(
        GuardarControlSedacionParams(
          idIngreso: widget.idIngreso,
          idRegistroDiario: widget.idRegistroDiario,
          hora: selectedHora,
          observacion: observacion,
          rass: selectedRass,
          idControlSedacion: widget.idControlExistente,
          orden: selectedOrden,
        ),
      ).future);

      ref.invalidate(controlSedacionProvider(ControlSedacionParams(
        idIngreso: widget.idIngreso,
        idRegistroDiario: widget.idRegistroDiario,
      )));

      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(widget.idControlExistente != null
              ? 'Control actualizado correctamente'
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
