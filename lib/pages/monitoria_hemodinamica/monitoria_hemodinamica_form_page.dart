import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
      rvc,
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
    'presion': true,
    'vitales': false,
    'oxigenacion': false,
    'especiales': false,
    'metabolicos': false,
  };

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    selectedHora = widget.horaInicial ?? 8;
    if (widget.idMonitoriaExistente != null) {
      _cargarDatosExistente();
    }
  }

  Future<void> _cargarDatosExistente() async {
    try {
      final doc = await FirebaseFirestore.instance
          .collection('monitorias_hemodinamicas')
          .doc(widget.idMonitoriaExistente)
          .get();

      if (doc.exists) {
        setState(() {
          selectedHora = doc['hora'] ?? 8;
          pas = doc['pas'];
          pad = doc['pad'];
          fc = doc['fc'];
          fr = doc['fr'];
          t = doc['temperatura']?.toDouble();
          pvc = doc['pvc'];
          fio2 = doc['fio2'];
          saturacion = doc['saturacion'];
          pia = doc['pia'];
          ppa = doc['ppa'];
          pic = doc['pic'];
          ppc = doc['ppc'];
          glucometria = doc['glucometria'];
          insulina = doc['insulina'];
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al cargar datos: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.idMonitoriaExistente == null
            ? 'Nueva Monitoría'
            : 'Editar Monitoría'),
        actions: [
          if (widget.idMonitoriaExistente != null)
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: _confirmarEliminacion,
            ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _buildHoraSelector(),
              const SizedBox(height: 20),
              _buildSection(
                title: 'Presión Arterial',
                icon: Icons.monitor_heart_outlined,
                isExpanded: _expandedSections['presion']!,
                onExpand: (e) =>
                    setState(() => _expandedSections['presion'] = e),
                children: _buildPressureFields(),
              ),
              _buildSection(
                title: 'Signos Vitales',
                icon: Icons.favorite_border,
                isExpanded: _expandedSections['vitales']!,
                onExpand: (e) =>
                    setState(() => _expandedSections['vitales'] = e),
                children: _buildVitalSignsFields(),
              ),
              _buildSection(
                title: 'Oxigenación',
                icon: Icons.air,
                isExpanded: _expandedSections['oxigenacion']!,
                onExpand: (e) =>
                    setState(() => _expandedSections['oxigenacion'] = e),
                children: _buildOxygenationFields(),
              ),
              _buildSection(
                title: 'Presiones Especiales',
                icon: Icons.science_outlined,
                isExpanded: _expandedSections['especiales']!,
                onExpand: (e) =>
                    setState(() => _expandedSections['especiales'] = e),
                children: _buildSpecialPressures(),
              ),
              _buildSection(
                title: 'Datos Metabólicos',
                icon: Icons.bloodtype_outlined,
                isExpanded: _expandedSections['metabolicos']!,
                onExpand: (e) =>
                    setState(() => _expandedSections['metabolicos'] = e),
                children: _buildMetabolicFields(),
              ),
              const SizedBox(height: 20),
              _buildActionButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHoraSelector() {
    final horas = List.generate(24, (index) => index);

    return DropdownButtonFormField<int>(
      value: selectedHora,
      decoration: InputDecoration(
        labelText: 'Hora de registro',
        border: OutlineInputBorder(),
      ),
      items: horas.map((hora) {
        return DropdownMenuItem(
          value: hora,
          child: Text(_formatearHora(hora)),
        );
      }).toList(),
      onChanged: (value) {
        if (value != null) setState(() => selectedHora = value);
      },
      validator: (value) => value == null ? 'Seleccione una hora' : null,
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
        _buildNumberField(
          label: 'PVC (mmHg)',
          value: pvc,
          onChanged: (v) => pvc = v,
          minValue: -10,
          maxValue: 50,
        ),
        const SizedBox(height: 12),
        _buildNumberField(
          label: 'PIA (mmH₂O)',
          value: pia,
          onChanged: (v) => pia = v,
          minValue: 0,
          maxValue: 50,
        ),
        const SizedBox(height: 12),
        _buildNumberField(
          label: 'PPA (mmHg)',
          value: ppa,
          onChanged: (v) => ppa = v,
          minValue: 0,
          maxValue: 300,
        ),
      ];

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
        border: OutlineInputBorder(),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        OutlinedButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancelar'),
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
        ),
        const SizedBox(width: 12),
        ElevatedButton(
          onPressed: _guardarMonitoria,
          child: Text('Guardar'),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
        ),
      ],
    );
  }

  Future<void> _guardarMonitoria() async {
    if (!_formKey.currentState!.validate()) return;

    try {
      final pam =
          pas != null && pad != null ? ((pas! + 2 * pad!) / 3).round() : null;

      final data = {
        'idIngreso': widget.idIngreso,
        'idRegistroDiario': widget.idRegistroDiario,
        'hora': selectedHora,
        'fecha': FieldValue.serverTimestamp(),
        'pas': pas,
        'pad': pad,
        'pam': pam,
        'fc': fc,
        'fr': fr,
        'temperatura': t,
        'pvc': pvc,
        'fio2': fio2,
        'saturacion': saturacion,
        'pia': pia,
        'ppa': ppa,
        'pic': pic,
        'ppc': ppc,
        'glucometria': glucometria,
        'insulina': insulina,
      };

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => Center(child: CircularProgressIndicator()),
      );

      final firestore = FirebaseFirestore.instance;
      if (widget.idMonitoriaExistente != null) {
        await firestore
            .collection('monitorias_hemodinamicas')
            .doc(widget.idMonitoriaExistente)
            .update(data);
      } else {
        await firestore.collection('monitorias_hemodinamicas').add(data);
      }

      if (mounted) {
        Navigator.pop(context); // Cierra el loading
        Navigator.pop(context, true); // Cierra el formulario
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Monitoría guardada exitosamente')),
        );
      }
    } catch (e) {
      if (mounted) {
        Navigator.pop(context); // Cierra el loading
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al guardar: $e')),
        );
      }
    }
  }

  Future<void> _confirmarEliminacion() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Confirmar eliminación'),
        content: Text('¿Está seguro de eliminar esta monitoría?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text('Eliminar', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirm == true) {
      try {
        await FirebaseFirestore.instance
            .collection('monitorias_hemodinamicas')
            .doc(widget.idMonitoriaExistente)
            .delete();

        if (mounted) {
          Navigator.pop(context, true);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Monitoría eliminada')),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error al eliminar: $e')),
          );
        }
      }
    }
  }

  String _formatearHora(int hora) {
    final periodo = hora < 12 ? 'AM' : 'PM';
    final hora12 = hora == 0 ? 12 : (hora > 12 ? hora - 12 : hora);
    return '${hora.toString().padLeft(2, '0')}:00 ($hora12$periodo)';
  }
}
