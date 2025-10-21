import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/features/monitorias_hemodinamicas/domain/models/monitoria_hemodinamica.dart';
import 'package:registro_uci/features/monitorias_hemodinamicas/data/providers/monitoria_hemodinamica_provider.dart';

class GraphicsPage extends ConsumerWidget {
  final String idIngreso;
  final String idRegistroDiario;

  const GraphicsPage({
    super.key,
    required this.idIngreso,
    required this.idRegistroDiario,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Monitorización Hemodinámica'),
        elevation: 0,
      ),
      body: _buildBody(ref),
    );
  }

  Widget _buildBody(WidgetRef ref) {
    final monitoriasAsync = ref.watch(monitoriasHemodinamicasProvider(
      ParametrosMonitoriaHemodinamica(
        idIngreso: idIngreso,
        idRegistroDiario: idRegistroDiario,
      ),
    ));

    return monitoriasAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Error: $error')),
      data: (monitorias) {
        if (monitorias.isEmpty) {
          return const Center(child: Text('No hay datos registrados'));
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // GRÁFICOS DE PRESIÓN ARTERIAL
              _buildSectionTitle('Presión Arterial'),
              _buildLineChartCard(
                title: 'Presión Sistólica (PAS)',
                data: monitorias,
                getValue: (m) => m.pas?.toDouble(),
                color: Colors.red,
                unit: 'mmHg',
              ),
              const SizedBox(height: 20),
              _buildLineChartCard(
                title: 'Presión Diastólica (PAD)',
                data: monitorias,
                getValue: (m) => m.pad?.toDouble(),
                color: Colors.blue,
                unit: 'mmHg',
              ),
              const SizedBox(height: 20),
              _buildLineChartCard(
                title: 'Presión Media (PAM)',
                data: monitorias,
                getValue: (m) => m.pam?.toDouble(),
                color: Colors.purple,
                unit: 'mmHg',
              ),

              // GRÁFICOS DE SIGNOS VITALES BÁSICOS
              _buildSectionTitle('Signos Vitales'),
              _buildLineChartCard(
                title: 'Frecuencia Cardíaca (FC)',
                data: monitorias,
                getValue: (m) => m.fc?.toDouble(),
                color: Colors.green,
                unit: 'ppm',
              ),
              const SizedBox(height: 20),
              _buildLineChartCard(
                title: 'Frecuencia Respiratoria (FR)',
                data: monitorias,
                getValue: (m) => m.fr?.toDouble(),
                color: Colors.teal,
                unit: 'rpm',
              ),
              const SizedBox(height: 20),
              _buildLineChartCard(
                title: 'Temperatura',
                data: monitorias,
                getValue: (m) => m.t,
                color: Colors.orange,
                unit: '°C',
                decimalPlaces: 1,
              ),

              // GRÁFICOS DE OXIGENACIÓN
              _buildSectionTitle('Oxigenación'),
              _buildLineChartCard(
                title: 'Saturación de O₂',
                data: monitorias,
                getValue: (m) => m.saturacion?.toDouble(),
                color: Colors.blueAccent,
                unit: '%',
              ),
              const SizedBox(height: 20),
              _buildLineChartCard(
                title: 'FiO₂',
                data: monitorias,
                getValue: (m) => m.fio2?.toDouble(),
                color: Colors.lightBlue,
                unit: '%',
              ),

              // GRÁFICOS DE PRESIONES ESPECIALES
              _buildSectionTitle('Presiones Especiales'),
              _buildLineChartCard(
                title: 'Presión Venosa Central (PVC)',
                data: monitorias,
                getValue: (m) => m.pvc?.toDouble(),
                color: Colors.deepPurple,
                unit: 'mmHg',
              ),
              const SizedBox(height: 20),
              _buildLineChartCard(
                title: 'Presión Intraabdominal (PIA)',
                data: monitorias,
                getValue: (m) => m.pia?.toDouble(),
                color: Colors.brown,
                unit: 'mmHg',
              ),
              const SizedBox(height: 20),
              _buildLineChartCard(
                title: 'Presión Intracraneal (PIC)',
                data: monitorias,
                getValue: (m) => m.pic?.toDouble(),
                color: Colors.indigo,
                unit: 'mmHg',
              ),

              // GRÁFICOS METABÓLICOS
              _buildSectionTitle('Parámetros Metabólicos'),
              _buildLineChartCard(
                title: 'Glucometría',
                data: monitorias,
                getValue: (m) => m.glucometria?.toDouble(),
                color: Colors.pink,
                unit: 'mg/dL',
              ),
              const SizedBox(height: 20),
              _buildLineChartCard(
                title: 'Insulina',
                data: monitorias,
                getValue: (m) => m.insulina?.toDouble(),
                color: Colors.amber,
                unit: 'U',
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.blueGrey,
        ),
      ),
    );
  }

  Widget _buildLineChartCard({
    required String title,
    required List<MonitoriaHemodinamica> data,
    required double? Function(MonitoriaHemodinamica) getValue,
    required Color color,
    required String unit,
    int decimalPlaces = 0,
  }) {
    final datosFiltrados = data.where((m) => getValue(m) != null).toList()
      ..sort((a, b) => a.hora.compareTo(b.hora));

    if (datosFiltrados.isEmpty) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
              'No hay datos registrados para $title'), // Mensaje cuando no hay datos
        ),
      );
    }

    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: LineChart(
                LineChartData(
                  minX: 0,
                  maxX: datosFiltrados.isNotEmpty
                      ? (datosFiltrados.length - 1).toDouble()
                      : 1,
                  minY: 0,
                  maxY: _calculateMaxY(datosFiltrados, getValue),
                  gridData: const FlGridData(show: true),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          final index = value.toInt();
                          // Verifica si el índice es válido antes de usarlo
                          if (index < 0 || index >= datosFiltrados.length) {
                            return const Text(
                                ''); // Si el índice es inválido, no muestra nada
                          }
                          final hora = datosFiltrados[index].hora;
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            child: Text(
                              '${hora}h',
                              style: const TextStyle(fontSize: 10),
                            ),
                          );
                        },
                        reservedSize: 30,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            value.toInt().toString(),
                            style: const TextStyle(fontSize: 10),
                          );
                        },
                        reservedSize: 30,
                      ),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      spots: datosFiltrados.asMap().entries.map((entry) {
                        final valor = getValue(entry.value) ?? 0;
                        return FlSpot(entry.key.toDouble(), valor);
                      }).toList(),
                      isCurved: true,
                      color: color,
                      barWidth: 3,
                      isStrokeCapRound: true,
                      dotData: const FlDotData(show: true),
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                  lineTouchData: LineTouchData(
                    touchTooltipData: LineTouchTooltipData(
                      getTooltipItems: (List<LineBarSpot> touchedSpots) {
                        return touchedSpots.map((spot) {
                          final index = spot.x.toInt();
                          // Verifica si el índice es válido antes de usarlo
                          if (index < 0 || index >= datosFiltrados.length) {
                            return const LineTooltipItem(
                              'No hay datos disponibles',
                              TextStyle(color: Colors.black),
                            );
                          }
                          final hora = datosFiltrados[index].hora;
                          return LineTooltipItem(
                            '${hora}h: ${spot.y.toStringAsFixed(decimalPlaces)} $unit',
                            TextStyle(
                              color: color,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }).toList();
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double _calculateMaxY(List<MonitoriaHemodinamica> data,
      double? Function(MonitoriaHemodinamica) getValue) {
    final maxValue =
        data.map((m) => getValue(m) ?? 0).reduce((a, b) => a > b ? a : b);
    return maxValue * 1.2; // Añade 20% de espacio arriba
  }
}
