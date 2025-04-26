import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/features/monitorias_hemodinamicas/data/providers/monitoria_hemodinamica_provider.dart';
import 'package:registro_uci/features/monitorias_hemodinamicas/domain/models/monitoria_hemodinamica.dart';

class MonitoriaHemodinamicaCard extends ConsumerWidget {
  final String idIngreso;
  final String idRegistroDiario;

  const MonitoriaHemodinamicaCard({
    super.key,
    required this.idIngreso,
    required this.idRegistroDiario,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final params = ParametrosMonitoriaHemodinamica(
      idIngreso: idIngreso,
      idRegistroDiario: idRegistroDiario,
    );
    final monitoriasData = ref.watch(monitoriasHemodinamicasProvider(params));

    return Card(
      margin: const EdgeInsets.all(16.0),
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Monitoría Hemodinámica',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12.0),
            monitoriasData.when(
              data: (data) {
                final ultimaMonitoria = data.isNotEmpty ? data.last : null;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Últimos parámetros registrados:',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8.0),
                    if (ultimaMonitoria != null) ...[
                      Text(
                          'PA: ${ultimaMonitoria.pas}/${ultimaMonitoria.pad} mmHg'),
                      Text('FC: ${ultimaMonitoria.fc} ppm'),
                      Text('FR: ${ultimaMonitoria.fr} rpm'),
                      Text('Temp: ${ultimaMonitoria.t}°C'),
                    ],
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
    List<MonitoriaHemodinamica> monitorias,
    BuildContext context,
    WidgetRef ref,
  ) {
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
      final monitoria = monitorias.firstWhere(
        (m) => m.hora == hora,
        orElse: () => const MonitoriaHemodinamica(
          idMonitoria: '',
          hora: 0,
          orden: 0,
        ),
      );

      final tieneRegistro = monitoria.idMonitoria.isNotEmpty;

      return Card(
        margin: const EdgeInsets.symmetric(vertical: 4.0),
        elevation: 2,
        child: InkWell(
          onTap: () => _mostrarDetalleMonitoria(context, monitoria, ref),
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: _buildHorizontalLayout(
                hora, tieneRegistro, monitoria, context, ref),
          ),
        ),
      );
    }).toList();
  }

  Widget _buildHorizontalLayout(
    int hora,
    bool tieneRegistro,
    MonitoriaHemodinamica monitoria,
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
            tieneRegistro
                ? 'PA: ${monitoria.pas}/${monitoria.pad}'
                : 'Sin registro',
            style: TextStyle(
              color: tieneRegistro ? Colors.green : Colors.grey,
              fontStyle: tieneRegistro ? FontStyle.normal : FontStyle.italic,
            ),
          ),
        ),
        _buildActionButtons(tieneRegistro, hora, monitoria, context, ref),
      ],
    );
  }

  Widget _buildActionButtons(
    bool tieneRegistro,
    int hora,
    MonitoriaHemodinamica monitoria,
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
              ? () => _mostrarFormularioMonitoria(
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
              ? () => _mostrarFormularioMonitoria(
                    context,
                    ref,
                    horaInicial: hora,
                    idMonitoriaExistente: monitoria.idMonitoria,
                  )
              : null,
        ),
      ],
    );
  }

  void _mostrarDetalleMonitoria(
    BuildContext context,
    MonitoriaHemodinamica monitoria,
    WidgetRef ref,
  ) {
    final tieneRegistro = monitoria.idMonitoria.isNotEmpty;

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Detalle Hemodinámico',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              if (tieneRegistro) ...[
                _buildDetailItem('Hora', _formatearHora(monitoria.hora)),
                _buildDetailItem('Presión Arterial',
                    '${monitoria.pas}/${monitoria.pad} mmHg'),
                _buildDetailItem('PAM', '${monitoria.pam} mmHg'),
                _buildDetailItem('Frecuencia Cardíaca', '${monitoria.fc} ppm'),
                _buildDetailItem(
                    'Frecuencia Respiratoria', '${monitoria.fr} rpm'),
                _buildDetailItem('Temperatura', '${monitoria.t}°C'),
                _buildDetailItem('PVC', '${monitoria.pvc} mmHg'),
                _buildDetailItem('Sat O₂', '${monitoria.saturacion}%'),
              ],
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

  Widget _buildDetailItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value),
        ],
      ),
    );
  }

  void _mostrarFormularioMonitoria(
    BuildContext context,
    WidgetRef ref, {
    int? horaInicial,
    String? idMonitoriaExistente,
  }) {
    showDialog(
      context: context,
      builder: (context) => _MonitoriaHemodinamicaFormDialog(
        key: UniqueKey(),
        idIngreso: idIngreso,
        idRegistroDiario: idRegistroDiario,
        horaInicial: horaInicial,
        idMonitoriaExistente: idMonitoriaExistente,
      ),
    );
  }
}

class _MonitoriaHemodinamicaFormDialog extends ConsumerStatefulWidget {
  final String idIngreso;
  final String idRegistroDiario;
  final int? horaInicial;
  final String? idMonitoriaExistente;

  const _MonitoriaHemodinamicaFormDialog({
    super.key,
    required this.idIngreso,
    required this.idRegistroDiario,
    this.horaInicial,
    this.idMonitoriaExistente,
  });

  @override
  _MonitoriaHemodinamicaFormDialogState createState() =>
      _MonitoriaHemodinamicaFormDialogState();
}

class _MonitoriaHemodinamicaFormDialogState
    extends ConsumerState<_MonitoriaHemodinamicaFormDialog> {
  late int selectedHora;
  int? pas;
  int? pad;
  int? fc;
  int? fr;
  double? temperatura;
  int? pvc;
  int? saturacion;

  @override
  void initState() {
    super.initState();
    selectedHora = widget.horaInicial ?? 8;

    if (widget.idMonitoriaExistente != null) {
      _cargarDatosExistente();
    }
  }

  Future<void> _cargarDatosExistente() async {
    final monitorias = ref.read(monitoriasHemodinamicasProvider(
      ParametrosMonitoriaHemodinamica(
        idIngreso: widget.idIngreso,
        idRegistroDiario: widget.idRegistroDiario,
      ),
    ));

    final data = monitorias.asData?.value ?? [];
    final monitoriaExistente = data.firstWhere(
      (m) => m.idMonitoria == widget.idMonitoriaExistente,
      orElse: () => const MonitoriaHemodinamica(
        idMonitoria: '',
        hora: 0,
        orden: 0,
      ),
    );

    if (monitoriaExistente.idMonitoria.isNotEmpty) {
      setState(() {
        selectedHora = monitoriaExistente.hora;
        pas = monitoriaExistente.pas;
        pad = monitoriaExistente.pad;
        fc = monitoriaExistente.fc;
        fr = monitoriaExistente.fr;
        temperatura = monitoriaExistente.t;
        pvc = monitoriaExistente.pvc;
        saturacion = monitoriaExistente.saturacion;
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
                    ? 'Monitoría ${_formatearHora(widget.horaInicial!)}'
                    : 'Nueva Monitoría Hemodinámica',
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
              _buildPressureFields(),
              const SizedBox(height: 16),
              _buildVitalSignsFields(),
              const SizedBox(height: 16),
              _buildOtherParameters(),
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
                    onPressed: () => _guardarMonitoria(context),
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

  Widget _buildPressureFields() {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              labelText: 'PAS (mmHg)',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            ),
            keyboardType: TextInputType.number,
            onChanged: (value) => pas = int.tryParse(value),
            initialValue: pas?.toString(),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              labelText: 'PAD (mmHg)',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            ),
            keyboardType: TextInputType.number,
            onChanged: (value) => pad = int.tryParse(value),
            initialValue: pad?.toString(),
          ),
        ),
      ],
    );
  }

  Widget _buildVitalSignsFields() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'FC (ppm)',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) => fc = int.tryParse(value),
                initialValue: fc?.toString(),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'FR (rpm)',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) => fr = int.tryParse(value),
                initialValue: fr?.toString(),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Temp (°C)',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
          keyboardType: TextInputType.number,
          onChanged: (value) => temperatura = double.tryParse(value),
          initialValue: temperatura?.toString(),
        ),
      ],
    );
  }

  Widget _buildOtherParameters() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'PVC (mmHg)',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) => pvc = int.tryParse(value),
                initialValue: pvc?.toString(),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Sat O₂ (%)',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) => saturacion = int.tryParse(value),
                initialValue: saturacion?.toString(),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _guardarMonitoria(BuildContext context) async {
    try {
      // Calcular PAM automáticamente si tenemos PAS y PAD
      final pam =
          (pas != null && pad != null) ? ((2 * pad! + pas!) / 3).round() : null;

      await ref.read(guardarMonitoriaHemodinamicaProvider(
        ParametrosGuardarMonitoria(
          idIngreso: widget.idIngreso,
          idRegistroDiario: widget.idRegistroDiario,
          hora: selectedHora,
          pas: pas,
          pad: pad,
          pam: pam,
          fc: fc,
          fr: fr,
          t: temperatura,
          pvc: pvc,
          saturacion: saturacion,
          idMonitoria: widget.idMonitoriaExistente,
        ),
      ).future);

      ref.invalidate(
          monitoriasHemodinamicasProvider(ParametrosMonitoriaHemodinamica(
        idIngreso: widget.idIngreso,
        idRegistroDiario: widget.idRegistroDiario,
      )));

      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(widget.idMonitoriaExistente != null
              ? 'Monitoría actualizada correctamente'
              : 'Nueva monitoría registrada'),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }
}
