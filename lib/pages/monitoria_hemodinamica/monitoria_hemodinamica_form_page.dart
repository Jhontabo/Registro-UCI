import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/features/monitorias_hemodinamicas/data/providers/monitoria_hemodinamica_provider.dart';

class FormularioMonitoriaScreen extends ConsumerStatefulWidget {
  final String idIngreso;
  final String idRegistroDiario;
  final int? horaInicial;
  final String? idMonitoriaExistente;

  const FormularioMonitoriaScreen({
    Key? key,
    required this.idIngreso,
    required this.idRegistroDiario,
    this.horaInicial,
    this.idMonitoriaExistente,
  }) : super(key: key);

  @override
  FormularioMonitoriaScreenState createState() =>
      FormularioMonitoriaScreenState();
}

class FormularioMonitoriaScreenState
    extends ConsumerState<FormularioMonitoriaScreen> {
  late int selectedHora;
  int? pas,
      pad,
      fc,
      fr,
      pvc,
      fio2,
      pia,
      ppa,
      pic,
      ppc,
      glucometria,
      insulina,
      saturacion;
  double? t;

  final Map<String, bool> _expandedSections = {
    'presion': false,
    'vitales': false,
    'oxigenacion': false,
    'especiales': false,
    'metabolicos': false,
  };

  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    selectedHora = widget.horaInicial ?? 8;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.idMonitoriaExistente == null
            ? 'Nueva Monitoría'
            : 'Editar Monitoría'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Form(
              key: _formKey,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          _buildSection(
                            title: 'Presión Arterial',
                            icon: Icons.monitor_heart_outlined,
                            isExpanded: _expandedSections['presion']!,
                            onExpand: (e) => setState(
                                () => _expandedSections['presion'] = e),
                            children: _buildPressureFields(),
                          ),
                          _buildSection(
                            title: 'Signos Vitales',
                            icon: Icons.favorite_border,
                            isExpanded: _expandedSections['vitales']!,
                            onExpand: (e) => setState(
                                () => _expandedSections['vitales'] = e),
                            children: _buildVitalSignsFields(),
                          ),
                          _buildSection(
                            title: 'Oxigenación',
                            icon: Icons.air,
                            isExpanded: _expandedSections['oxigenacion']!,
                            onExpand: (e) => setState(
                                () => _expandedSections['oxigenacion'] = e),
                            children: _buildOxygenationFields(),
                          ),
                          _buildSection(
                            title: 'Presiones Especiales',
                            icon: Icons.science_outlined,
                            isExpanded: _expandedSections['especiales']!,
                            onExpand: (e) => setState(
                                () => _expandedSections['especiales'] = e),
                            children: _buildSpecialPressures(),
                          ),
                          _buildSection(
                            title: 'Datos Metabólicos',
                            icon: Icons.bloodtype_outlined,
                            isExpanded: _expandedSections['metabolicos']!,
                            onExpand: (e) => setState(
                                () => _expandedSections['metabolicos'] = e),
                            children: _buildMetabolicFields(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  _buildActionButtons(), // Botones en la parte inferior
                ],
              ),
            ),
    );
  }

  Widget _buildSection({
    required String title,
    required IconData icon,
    required bool isExpanded,
    required Function(bool) onExpand,
    required List<Widget> children,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      child: ExpansionTile(
        leading: Icon(icon, color: Theme.of(context).primaryColor),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        initiallyExpanded: isExpanded,
        onExpansionChanged: onExpand,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Column(children: children),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildPressureFields() => [
        Row(
          children: [
            Expanded(
              child: _buildNumberField(
                label: 'PAS (mmHg)',
                value: pas,
                onChanged: (v) => pas = v,
                minValue: 0,
                maxValue: 300,
                isRequired: true,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildNumberField(
                label: 'PAD (mmHg)',
                value: pad,
                onChanged: (v) => pad = v,
                minValue: 0,
                maxValue: 200,
                isRequired: true,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        if (pas != null && pad != null)
          Text(
            'PAM: ${((pas! + 2 * pad!) / 3).toStringAsFixed(1)} mmHg',
            style:
                TextStyle(fontSize: 16, color: Theme.of(context).primaryColor),
          ),
      ];

  List<Widget> _buildVitalSignsFields() => [
        _buildNumberField(
          label: 'FC (ppm)',
          value: fc,
          onChanged: (v) => fc = v,
          minValue: 0,
          maxValue: 300,
        ),
        const SizedBox(height: 12),
        _buildNumberField(
          label: 'FR (rpm)',
          value: fr,
          onChanged: (v) => fr = v,
          minValue: 0,
          maxValue: 60,
        ),
        const SizedBox(height: 12),
        _buildNumberField(
          label: 'Temperatura (°C)',
          value: t?.toInt(),
          onChanged: (v) => t = v?.toDouble(),
          minValue: 30,
          maxValue: 45,
          decimal: true,
        ),
      ];

  List<Widget> _buildOxygenationFields() => [
        _buildNumberField(
          label: 'FiO₂ (%)',
          value: fio2,
          onChanged: (v) => fio2 = v,
          minValue: 21,
          maxValue: 100,
        ),
        const SizedBox(height: 12),
        _buildNumberField(
          label: 'Sat O₂ (%)',
          value: saturacion,
          onChanged: (v) => saturacion = v,
          minValue: 0,
          maxValue: 100,
        ),
      ];

  List<Widget> _buildSpecialPressures() => [
        const SizedBox(height: 16),
        const Text(
          'Presiones Especiales',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        _buildPressureRow(
          left: _buildNumberField(
            label: 'PVC (mmHg)',
            value: pvc,
            onChanged: (v) => pvc = v,
            minValue: -10,
            maxValue: 50,
          ),
          right: _buildNumberField(
            label: 'PIA (mmH₂O)',
            value: pia,
            onChanged: (v) => pia = v,
            minValue: 0,
            maxValue: 50,
          ),
        ),
        const SizedBox(height: 12),
        _buildPressureRow(
          left: _buildNumberField(
            label: 'PPA (mmHg)',
            value: ppa,
            onChanged: (v) => ppa = v,
            minValue: 0,
            maxValue: 300,
          ),
          right: _buildNumberField(
            label: 'PIC (mmHg)',
            value: pic,
            onChanged: (v) => pic = v,
            minValue: 0,
            maxValue: 50,
          ),
        ),
        const SizedBox(height: 12),
        _buildNumberField(
          label: 'PPC (mmHg)',
          value: ppc,
          onChanged: (v) => ppc = v,
          minValue: 0,
          maxValue: 150,
        ),
      ];

  Widget _buildPressureRow({required Widget left, required Widget right}) {
    return Row(
      children: [
        Expanded(child: left),
        const SizedBox(width: 16),
        Expanded(child: right),
      ],
    );
  }

  List<Widget> _buildMetabolicFields() => [
        Row(
          children: [
            Expanded(
              child: _buildNumberField(
                label: 'Glucemia (mg/dL)',
                value: glucometria,
                onChanged: (v) => glucometria = v,
                minValue: 0,
                maxValue: 1000,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildNumberField(
                label: 'Insulina (U)',
                value: insulina,
                onChanged: (v) => insulina = v,
                minValue: 0,
                maxValue: 100,
              ),
            ),
          ],
        ),
      ];

  Widget _buildNumberField({
    required String label,
    required int? value,
    required Function(int?) onChanged,
    int minValue = 0,
    int maxValue = 999,
    bool decimal = false,
    bool isRequired = false,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        suffixText: label.contains('°C') ? '°C' : null,
      ),
      keyboardType: TextInputType.numberWithOptions(decimal: decimal),
      initialValue: value?.toString(),
      onChanged: (v) => onChanged(v.isNotEmpty ? int.tryParse(v) : null),
      validator: (value) {
        if (isRequired && (value == null || value.isEmpty)) {
          return 'Campo requerido';
        }
        if (value != null && value.isNotEmpty) {
          final numValue =
              decimal ? double.tryParse(value) : int.tryParse(value);
          if (numValue == null) return 'Valor inválido';
          if (numValue < minValue || numValue > maxValue) {
            return 'Entre $minValue y $maxValue';
          }
        }
        return null;
      },
    );
  }

  Widget _buildActionButtons() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          OutlinedButton(
            onPressed: _isLoading ? null : () => Navigator.pop(context),
            child: const Text('Cancelar'),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
          ),
          const SizedBox(width: 12),
          ElevatedButton(
            onPressed: _isLoading ? null : _guardarMonitoria,
            child: Text(widget.idMonitoriaExistente == null
                ? 'Crear Registro'
                : 'Guardar Cambios'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _guardarMonitoria() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final pam =
          pas != null && pad != null ? ((pas! + 2 * pad!) / 3).round() : null;

      await ref.read(guardarMonitoriaHemodinamicaProvider(
        ParametrosGuardarMonitoria(
          idIngreso: widget.idIngreso,
          idRegistroDiario: widget.idRegistroDiario,
          idMonitoria: widget.idMonitoriaExistente,
          hora: selectedHora,
          pas: pas,
          pad: pad,
          pam: pam,
          fc: fc,
          fr: fr,
          t: t,
          pvc: pvc,
          fio2: fio2,
          pia: pia,
          ppa: ppa,
          pic: pic,
          ppc: ppc,
          glucometria: glucometria,
          insulina: insulina,
          saturacion: saturacion,
        ),
      ).future);

      ref.invalidate(monitoriasHemodinamicasProvider(
        ParametrosMonitoriaHemodinamica(
          idIngreso: widget.idIngreso,
          idRegistroDiario: widget.idRegistroDiario,
        ),
      ));

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(widget.idMonitoriaExistente == null
                ? 'Monitoría creada correctamente'
                : 'Monitoría actualizada correctamente'),
          ),
        );
        Navigator.pop(context, true);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al guardar: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }
}
