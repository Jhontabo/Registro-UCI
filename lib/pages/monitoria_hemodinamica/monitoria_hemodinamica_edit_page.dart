import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/features/monitorias_hemodinamicas/data/providers/monitoria_hemodinamica_provider.dart';

class EditMonitoriaScreen extends ConsumerStatefulWidget {
  final String idIngreso;
  final String idRegistroDiario;
  final int? horaInicial;
  final String? idMonitoriaExistente;

  const EditMonitoriaScreen({
    Key? key,
    required this.idIngreso,
    required this.idRegistroDiario,
    required this.idMonitoriaExistente,
    required this.horaInicial,
  }) : super(key: key);

  @override
  EditMonitoriaScreenState createState() => EditMonitoriaScreenState();
}

class EditMonitoriaScreenState extends ConsumerState<EditMonitoriaScreen> {
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

  final _formKey = GlobalKey<FormState>();
  bool _dataLoaded = false;
  bool _isSaving = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    selectedHora = widget.horaInicial ?? 8;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadInitialData();
    });
  }

  Future<void> _loadInitialData() async {
    if (_isLoading) return;
    if (!mounted) return;

    setState(() => _isLoading = true);

    try {
      if (widget.idMonitoriaExistente != null) {
        await _cargarDatosExistente();
      } else {
        setState(() => _dataLoaded = true);
      }
    } catch (e, stack) {
      debugPrint('Error loading initial data: $e\n$stack');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al cargar datos: ${e.toString()}')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _cargarDatosExistente() async {
    try {
      final params = ParametrosMonitoriaHemodinamica(
        idIngreso: widget.idIngreso,
        idRegistroDiario: widget.idRegistroDiario,
        idMonitoria: widget.idMonitoriaExistente!,
      );

      final monitorias =
          await ref.read(monitoriasHemodinamicasProvider(params).future);

      if (monitorias.isEmpty) {
        throw Exception('Monitoría no encontrada');
      }

      final monitoria = monitorias.first;

      if (mounted) {
        setState(() {
          selectedHora = monitoria.hora;
          pas = monitoria.pas;
          pad = monitoria.pad;
          fc = monitoria.fc;
          fr = monitoria.fr;
          t = monitoria.t;
          pvc = monitoria.pvc;
          fio2 = monitoria.fio2;
          pia = monitoria.pia;
          ppa = monitoria.ppa;
          pic = monitoria.pic;
          ppc = monitoria.ppc;
          glucometria = monitoria.glucometria;
          insulina = monitoria.insulina;
          saturacion = monitoria.saturacion;
          _dataLoaded = true;
        });
      }
    } catch (e) {
      debugPrint('Error loading existing data: $e');
      rethrow;
    }
  }

  Future<void> _actualizarMonitoria() async {
    if (_isSaving || !mounted) return;
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSaving = true);

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

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Monitoría actualizada correctamente')),
        );
        Navigator.of(context).pop(true);
      }
    } catch (e, stack) {
      debugPrint('Error saving data: $e\n$stack');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al guardar: ${e.toString()}')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isSaving = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Monitoría'),
        actions: [
          if (_isSaving)
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: CircularProgressIndicator(),
            ),
        ],
      ),
      body: _dataLoaded
          ? _buildFormulario()
          : const Center(child: CircularProgressIndicator()),
    );
  }

  Widget _buildFormulario() {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Sección de Presión Arterial
            Card(
              margin: const EdgeInsets.only(bottom: 16),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text(
                      'Presión Arterial',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: _buildNumberField(
                            label: 'PAS (mmHg)',
                            value: pas,
                            onChanged: (v) => setState(() => pas = v),
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
                            onChanged: (v) => setState(() => pad = v),
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
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                  ],
                ),
              ),
            ),

            // Sección de Signos Vitales
            Card(
              margin: const EdgeInsets.only(bottom: 16),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text(
                      'Signos Vitales',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: _buildNumberField(
                            label: 'FC (lpm)',
                            value: fc,
                            onChanged: (v) => setState(() => fc = v),
                            minValue: 0,
                            maxValue: 300,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _buildNumberField(
                            label: 'FR (rpm)',
                            value: fr,
                            onChanged: (v) => setState(() => fr = v),
                            minValue: 0,
                            maxValue: 100,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildNumberField(
                      label: 'Temperatura (°C)',
                      value: t?.round(),
                      onChanged: (v) => setState(() => t = v?.toDouble()),
                      minValue: 20,
                      maxValue: 45,
                      decimal: true,
                    ),
                  ],
                ),
              ),
            ),

            // Sección de Parámetros Hemodinámicos
            Card(
              margin: const EdgeInsets.only(bottom: 16),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text(
                      'Parámetros Hemodinámicos',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    _buildNumberField(
                      label: 'PVC (mmHg)',
                      value: pvc,
                      onChanged: (v) => setState(() => pvc = v),
                      minValue: 0,
                      maxValue: 50,
                    ),
                    const SizedBox(height: 16),
                    _buildNumberField(
                      label: 'FiO2 (%)',
                      value: fio2,
                      onChanged: (v) => setState(() => fio2 = v),
                      minValue: 21,
                      maxValue: 100,
                    ),
                    const SizedBox(height: 16),
                    _buildNumberField(
                      label: 'PIA (mmHg)',
                      value: pia,
                      onChanged: (v) => setState(() => pia = v),
                      minValue: 0,
                      maxValue: 100,
                    ),
                    const SizedBox(height: 16),
                    _buildNumberField(
                      label: 'PPA (mmHg)',
                      value: ppa,
                      onChanged: (v) => setState(() => ppa = v),
                      minValue: 0,
                      maxValue: 100,
                    ),
                    const SizedBox(height: 16),
                    _buildNumberField(
                      label: 'PIC (mmHg)',
                      value: pic,
                      onChanged: (v) => setState(() => pic = v),
                      minValue: 0,
                      maxValue: 100,
                    ),
                    const SizedBox(height: 16),
                    _buildNumberField(
                      label: 'PPC (mmHg)',
                      value: ppc,
                      onChanged: (v) => setState(() => ppc = v),
                      minValue: 0,
                      maxValue: 100,
                    ),
                  ],
                ),
              ),
            ),

            // Sección de Monitoreo Metabólico
            Card(
              margin: const EdgeInsets.only(bottom: 16),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text(
                      'Monitoreo Metabólico',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    _buildNumberField(
                      label: 'Glucometría (mg/dL)',
                      value: glucometria,
                      onChanged: (v) => setState(() => glucometria = v),
                      minValue: 0,
                      maxValue: 1000,
                    ),
                    const SizedBox(height: 16),
                    _buildNumberField(
                      label: 'Insulina (UI/h)',
                      value: insulina,
                      onChanged: (v) => setState(() => insulina = v),
                      minValue: 0,
                      maxValue: 100,
                    ),
                    const SizedBox(height: 16),
                    _buildNumberField(
                      label: 'Saturación (%)',
                      value: saturacion,
                      onChanged: (v) => setState(() => saturacion = v),
                      minValue: 0,
                      maxValue: 100,
                    ),
                  ],
                ),
              ),
            ),

            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

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
      onChanged: (v) {
        if (v.isEmpty) {
          onChanged(null);
        } else {
          final parsed =
              decimal ? double.tryParse(v)?.round() : int.tryParse(v);
          onChanged(parsed);
        }
      },
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
          onPressed: _isSaving ? null : () => Navigator.pop(context),
          child: const Text('Cancelar'),
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
        ),
        const SizedBox(width: 12),
        ElevatedButton(
          onPressed: _isSaving ? null : _actualizarMonitoria,
          child: const Text('Guardar Cambios'),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
        ),
      ],
    );
  }
}
