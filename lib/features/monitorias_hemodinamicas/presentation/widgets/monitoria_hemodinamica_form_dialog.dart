import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MonitoriaHemodinamicaFormDialog extends ConsumerStatefulWidget {
  final String idIngreso;
  final String idRegistroDiario;
  final int? horaInicial;
  final String? idMonitoriaExistente;

  const MonitoriaHemodinamicaFormDialog({
    super.key,
    required this.idIngreso,
    required this.idRegistroDiario,
    this.horaInicial,
    this.idMonitoriaExistente,
  });

  @override
  MonitoriaHemodinamicaFormDialogState createState() =>
      MonitoriaHemodinamicaFormDialogState();
}

class MonitoriaHemodinamicaFormDialogState
    extends ConsumerState<MonitoriaHemodinamicaFormDialog> {
  late int selectedHora;
  int? pas;
  int? pad;
  int? fc;
  int? fr;
  double? t;
  int? pvc;
  int? rvc;
  int? fio2;
  int? pia;
  int? ppa;
  int? pic;
  int? ppc;
  int? glucometria;
  int? insulina;
  int? saturacion;

  // Control de secciones expandidas
  final Map<String, bool> _expandedSections = {
    'presion': true,
    'vitales': false,
    'oxigenacion': false,
    'especiales': false,
    'metabolicos': false,
  };

  @override
  void initState() {
    super.initState();
    selectedHora = widget.horaInicial ?? 8;

    if (widget.idMonitoriaExistente != null) {
      _cargarDatosExistente();
    }
  }

  Future<void> _cargarDatosExistente() async {
    // Lógica para cargar datos existentes
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.9,
          maxHeight: MediaQuery.of(context).size.height * 0.85,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Encabezado
            _buildHeader(),

            // Contenido con scroll
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    // Sección de Presión Arterial
                    _buildSection(
                      title: 'Presión Arterial',
                      icon: Icons.monitor_heart_outlined,
                      isExpanded: _expandedSections['presion']!,
                      onExpand: (expanded) => setState(
                          () => _expandedSections['presion'] = expanded),
                      children: _buildPressureFields(),
                    ),

                    // Sección de Signos Vitales
                    _buildSection(
                      title: 'Signos Vitales',
                      icon: Icons.favorite_border,
                      isExpanded: _expandedSections['vitales']!,
                      onExpand: (expanded) => setState(
                          () => _expandedSections['vitales'] = expanded),
                      children: _buildVitalSignsFields(),
                    ),

                    // Sección de Oxigenación
                    _buildSection(
                      title: 'Oxigenación',
                      icon: Icons.air,
                      isExpanded: _expandedSections['oxigenacion']!,
                      onExpand: (expanded) => setState(
                          () => _expandedSections['oxigenacion'] = expanded),
                      children: _buildOxygenationFields(),
                    ),

                    // Sección de Presiones Especiales
                    _buildSection(
                      title: 'Presiones Especiales',
                      icon: Icons.science_outlined,
                      isExpanded: _expandedSections['especiales']!,
                      onExpand: (expanded) => setState(
                          () => _expandedSections['especiales'] = expanded),
                      children: _buildSpecialPressures(),
                    ),

                    // Sección Metabólica
                    _buildSection(
                      title: 'Datos Metabólicos',
                      icon: Icons.bloodtype_outlined,
                      isExpanded: _expandedSections['metabolicos']!,
                      onExpand: (expanded) => setState(
                          () => _expandedSections['metabolicos'] = expanded),
                      children: _buildMetabolicFields(),
                    ),
                  ],
                ),
              ),
            ),

            // Botones de acción
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.1),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ), // Este paréntesis estaba faltando
      child: Row(
        children: [
          Icon(Icons.monitor_heart, color: Theme.of(context).primaryColor),
          const SizedBox(width: 12),
          Text(
            widget.horaInicial != null
                ? 'Monitoría ${_formatearHora(widget.horaInicial!)}'
                : 'Nueva Monitoría Hemodinámica',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: Colors.grey.shade200,
          width: 1,
        ),
      ),
      child: ExpansionTile(
        leading: Icon(icon, color: Theme.of(context).primaryColor),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        initiallyExpanded: isExpanded,
        onExpansionChanged: onExpand,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: children,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          OutlinedButton(
            onPressed: () => Navigator.pop(context),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              side: BorderSide(color: Theme.of(context).primaryColor),
            ),
            child: Text('Cancelar',
                style: TextStyle(color: Theme.of(context).primaryColor)),
          ),
          const SizedBox(width: 12),
          ElevatedButton(
            onPressed: () => _guardarMonitoria(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('Guardar', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  // Métodos para construir los campos de formulario
  List<Widget> _buildPressureFields() {
    return [
      const SizedBox(height: 8),
      Row(
        children: [
          Expanded(
            child: _buildNumberField(
              label: 'PAS (mmHg)',
              value: pas,
              onChanged: (value) => pas = value,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: _buildNumberField(
              label: 'PAD (mmHg)',
              value: pad,
              onChanged: (value) => pad = value,
            ),
          ),
        ],
      ),
    ];
  }

  List<Widget> _buildVitalSignsFields() {
    return [
      const SizedBox(height: 8),
      Row(
        children: [
          Expanded(
            child: _buildNumberField(
              label: 'FC (ppm)',
              value: fc,
              onChanged: (value) => fc = value,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: _buildNumberField(
              label: 'FR (rpm)',
              value: fr,
              onChanged: (value) => fr = value,
            ),
          ),
        ],
      ),
      const SizedBox(height: 12),
      _buildNumberField(
        label: 'Temperatura (°C)',
        value: t?.toInt(),
        onChanged: (value) => t = value?.toDouble(),
        isDouble: true,
      ),
    ];
  }

  List<Widget> _buildOxygenationFields() {
    return [
      const SizedBox(height: 8),
      Row(
        children: [
          Expanded(
            child: _buildNumberField(
              label: 'FiO₂ (%)',
              value: fio2,
              onChanged: (value) => fio2 = value,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: _buildNumberField(
              label: 'Sat O₂ (%)',
              value: saturacion,
              onChanged: (value) => saturacion = value,
            ),
          ),
        ],
      ),
    ];
  }

  List<Widget> _buildSpecialPressures() {
    return [
      const SizedBox(height: 8),
      _buildNumberField(
        label: 'PVC (mmHg)',
        value: pvc,
        onChanged: (value) => pvc = value,
      ),
      const SizedBox(height: 12),
      _buildNumberField(
        label: 'PIA (mmH₂O)',
        value: pia,
        onChanged: (value) => pia = value,
      ),
      const SizedBox(height: 12),
      _buildNumberField(
        label: 'PPA (mmHg)',
        value: ppa,
        onChanged: (value) => ppa = value,
      ),
      const SizedBox(height: 12),
      _buildNumberField(
        label: 'PIC (mmHg)',
        value: pic,
        onChanged: (value) => pic = value,
      ),
      const SizedBox(height: 12),
      _buildNumberField(
        label: 'PPC (mmHg)',
        value: ppc,
        onChanged: (value) => ppc = value,
      ),
    ];
  }

  List<Widget> _buildMetabolicFields() {
    return [
      const SizedBox(height: 8),
      Row(
        children: [
          Expanded(
            child: _buildNumberField(
              label: 'Glucemia (mg/dL)',
              value: glucometria,
              onChanged: (value) => glucometria = value,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: _buildNumberField(
              label: 'Insulina (U)',
              value: insulina,
              onChanged: (value) => insulina = value,
            ),
          ),
        ],
      ),
    ];
  }

  Widget _buildNumberField({
    required String label,
    required int? value,
    required Function(int?) onChanged,
    bool isDouble = false,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      ),
      keyboardType: TextInputType.number,
      onChanged: (value) => onChanged(int.tryParse(value)),
      initialValue: value?.toString(),
    );
  }

  // Métodos auxiliares
  String _formatearHora(int hora) {
    final periodo = hora < 12 ? 'AM' : 'PM';
    final hora12 = hora == 0 ? 12 : (hora > 12 ? hora - 12 : hora);
    return '${hora.toString().padLeft(2, '0')}:00 ($hora12$periodo)';
  }

  Future<void> _guardarMonitoria(BuildContext context) async {
    try {
      // Calcular PAM (Presión Arterial Media)
      final pam = ((2 * pad! + pas!) / 3).round();

      // Preparar datos para Firestore
      final monitoriaData = {
        'idIngreso': widget.idIngreso,
        'idRegistroDiario': widget.idRegistroDiario,
        'hora': selectedHora,
        'fecha': FieldValue.serverTimestamp(), // Usar timestamp del servidor
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
        'ultimaActualizacion': FieldValue.serverTimestamp(),
      };

      // Obtener referencia a Firestore
      final firestore = FirebaseFirestore.instance;

      // Mostrar indicador de carga
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()),
      );

      // Operación de guardado
      if (widget.idMonitoriaExistente != null) {
        // Actualizar documento existente
        await firestore
            .collection('monitorias_hemodinamicas')
            .doc(widget.idMonitoriaExistente)
            .update(monitoriaData);
      } else {
        // Crear nuevo documento
        await firestore
            .collection('monitorias_hemodinamicas')
            .add(monitoriaData);
      }

      // Cerrar indicador de carga
      if (mounted) Navigator.pop(context);

      // Mostrar mensaje de éxito
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('✅ Monitoría guardada exitosamente'),
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 2),
          ),
        );
      }

      // Cerrar el diálogo
      if (mounted) Navigator.pop(context, true);
    } catch (e) {
      // Cerrar indicador de carga si hay error
      if (mounted) Navigator.pop(context);

      // Mostrar mensaje de error
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('❌ Error: ${e.toString()}'),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 3),
          ),
        );
      }

      // Log para debugging
      debugPrint('Error al guardar monitoría: $e');
    }
  }
}
