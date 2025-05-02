import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/features/monitorias_hemodinamicas/data/providers/monitoria_hemodinamica_provider.dart';
import 'package:registro_uci/features/monitorias_hemodinamicas/domain/models/monitoria_hemodinamica.dart';
import 'package:registro_uci/pages/monitoria_hemodinamica/monitoria_hemodinamica_form_page.dart';
import 'package:registro_uci/pages/monitoria_hemodinamica/monitoria_hemodinamica_edit_page.dart';

class MonitoriaHemodinamicaCard extends ConsumerWidget {
  final String idIngreso;
  final String idRegistroDiario;

  const MonitoriaHemodinamicaCard({
    Key? key,
    required this.idIngreso,
    required this.idRegistroDiario,
  }) : super(key: key);

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
            _buildHeader(context),
            const SizedBox(height: 12.0),
            _buildContent(monitoriasData, context, ref),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Text(
      'Monitoría Hemodinámica',
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
    );
  }

  Widget _buildContent(
    AsyncValue<List<MonitoriaHemodinamica>> monitoriasData,
    BuildContext context,
    WidgetRef ref,
  ) {
    return monitoriasData.when(
      data: (data) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLastParameters(data),
          const SizedBox(height: 16.0),
          ..._buildTimeList(data, context, ref),
        ],
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Text(
        'Error al cargar los datos: ${error.toString()}',
        style: const TextStyle(color: Colors.red),
      ),
    );
  }

  Widget _buildLastParameters(List<MonitoriaHemodinamica> data) {
    final lastRecord = data.isNotEmpty ? data.last : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Última hora registrada:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8.0),
        if (lastRecord != null)
          Text(
            'Hora: ${_formatHour(lastRecord.hora)}',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          )
        else
          const Text(
            'No hay registros disponibles',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
      ],
    );
  }

  Widget _buildParameterRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
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

  List<Widget> _buildTimeList(
    List<MonitoriaHemodinamica> monitorias,
    BuildContext context,
    WidgetRef ref,
  ) {
    const hours = [
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
      7,
    ];

    return hours.map((hour) {
      final record = monitorias.firstWhere(
        (m) => m.hora == hour,
        orElse: () => const MonitoriaHemodinamica(
          idMonitoria: '',
          hora: 0,
          orden: 0,
        ),
      );
      final hasRecord = record.idMonitoria.isNotEmpty;

      return _buildTimeCard(
        context,
        hour: hour,
        hasRecord: hasRecord,
        record: record,
      );
    }).toList();
  }

  Widget _buildTimeCard(
    BuildContext context, {
    required int hour,
    required bool hasRecord,
    required MonitoriaHemodinamica record,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      elevation: 2,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () => _showDetails(context, record),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              _buildStatusIcon(hasRecord),
              const SizedBox(width: 12),
              _buildTimeLabel(hour, hasRecord),
              const SizedBox(width: 12),
              const Spacer(),
              _buildActionButtons(context, hour, hasRecord, record.idMonitoria),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusIcon(bool hasRecord) {
    return Icon(
      hasRecord ? Icons.check_circle : Icons.access_time,
      color: hasRecord ? Colors.green : Colors.grey,
    );
  }

  Widget _buildTimeLabel(int hour, bool hasRecord) {
    return Text(
      _formatHour(hour),
      style: TextStyle(
        fontWeight: FontWeight.w500,
        color: hasRecord ? Colors.green : Colors.grey[700],
      ),
    );
  }

  Widget _buildActionButtons(
    BuildContext context,
    int hour,
    bool hasRecord,
    String idMonitoria,
  ) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(
            Icons.add_circle_outline,
            color: !hasRecord ? Colors.green : Colors.grey,
          ),
          onPressed: !hasRecord ? () => _showForm(context, hour: hour) : null,
          tooltip: 'Agregar registro',
        ),
        IconButton(
          icon: Icon(
            Icons.edit_outlined,
            color: hasRecord ? Colors.blue : Colors.grey,
          ),
          onPressed: hasRecord
              ? () => _editForm(
                    context,
                    hour: hour,
                    idMonitoria: idMonitoria,
                  )
              : null,
          tooltip: 'Editar registro',
        ),
        IconButton(
          icon: Icon(
            Icons.bar_chart,
            color: hasRecord ? Colors.blue : Colors.grey,
          ),
          onPressed: hasRecord
              ? () => _showForm(
                    context,
                    hour: hour,
                    idMonitoria: idMonitoria,
                  )
              : null,
          tooltip: 'Editar registro',
        ),
      ],
    );
  }

  String _formatHour(int hour) {
    final period = hour < 12 ? 'AM' : 'PM';
    final hour12 = hour == 0 ? 12 : (hour > 12 ? hour - 12 : hour);
    return '${hour.toString().padLeft(2, '0')}:00 ($hour12$period)';
  }

  void _showDetails(BuildContext context, MonitoriaHemodinamica record) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Detalles de Monitoría Hemodinámica'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildDetailItem('Hora', _formatHour(record.hora)),
              _buildDetailItem('PA', '${record.pas}/${record.pad} mmHg'),
              if (record.pam != null)
                _buildDetailItem('PAM', '${record.pam} mmHg'),
              _buildDetailItem('FC', '${record.fc} ppm'),
              _buildDetailItem('FR', '${record.fr} rpm'),
              _buildDetailItem('Temperatura', '${record.t}°C'),
              if (record.pvc != null)
                _buildDetailItem('PVC', '${record.pvc} mmHg'),
              if (record.saturacion != null)
                _buildDetailItem('Sat O₂', '${record.saturacion}%'),
              // Agregar más campos según sea necesario
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cerrar'),
          ),
        ],
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

  void _createForm(
    BuildContext context, {
    required int hour,
    String? idMonitoria,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => FormularioMonitoriaScreen(
          idIngreso: idIngreso,
          idRegistroDiario: idRegistroDiario,
          horaInicial: hour,
          idMonitoriaExistente: idMonitoria,
        ),
        fullscreenDialog: true,
      ),
    );
  }

  void _editForm(
    BuildContext context, {
    required int hour,
    String? idMonitoria,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => EditMonitoriaScreen(
          idIngreso: idIngreso,
          idRegistroDiario: idRegistroDiario,
          horaInicial: hour,
          idMonitoriaExistente: idMonitoria,
        ),
        fullscreenDialog: true,
      ),
    );
  }

  void _showForm(
    BuildContext context, {
    required int hour,
    String? idMonitoria,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => FormularioMonitoriaScreen(
          idIngreso: idIngreso,
          idRegistroDiario: idRegistroDiario,
          horaInicial: hour,
          idMonitoriaExistente: idMonitoria,
        ),
        fullscreenDialog: true,
      ),
    );
  }
}
