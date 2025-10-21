import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/features/monitorias_hemodinamicas/data/providers/monitoria_hemodinamica_provider.dart';

class EditMonitoriaScreen extends ConsumerStatefulWidget {
  final String idIngreso;
  final String idRegistroDiario;
  final int? horaInicial;
  final String? idMonitoriaExistente;

  const EditMonitoriaScreen({
    super.key,
    required this.idIngreso,
    required this.idRegistroDiario,
    required this.idMonitoriaExistente,
    required this.horaInicial,
  });

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
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    if (_isLoading) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 20),
              Text(
                'Cargando datos...',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: colors.onSurface.withOpacity(0.8),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Monitoría Hemodinámica'),
        centerTitle: true,
        actions: [
          if (_isSaving)
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Row(
                children: [
                  Text(
                    'Guardando',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colors.onPrimary,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  ),
                ],
              ),
            ),
        ],
      ),
      body: _dataLoaded
          ? _buildFormulario(theme, colors)
          : const Center(child: CircularProgressIndicator()),
    );
  }

  Widget _buildFormulario(ThemeData theme, ColorScheme colors) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildPressureCard(theme, colors),
            const SizedBox(height: 16),
            _buildVitalSignsCard(theme, colors),
            const SizedBox(height: 16),
            _buildHemodynamicCard(theme, colors),
            const SizedBox(height: 16),
            _buildMetabolicCard(theme, colors),
            const SizedBox(height: 24),
            _buildActionButtons(theme),
          ],
        ),
      ),
    );
  }

  Widget _buildPressureCard(ThemeData theme, ColorScheme colors) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'PRESIÓN ARTERIAL',
              style: theme.textTheme.titleMedium?.copyWith(
                color: colors.primary,
                fontWeight: FontWeight.bold,
              ),
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
                    icon: Icons.monitor_heart_outlined,
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
                    icon: Icons.monitor_heart_outlined,
                  ),
                ),
              ],
            ),
            if (pas != null && pad != null) ...[
              const SizedBox(height: 12),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                decoration: BoxDecoration(
                  color: colors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '(PAM):',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${((pas! + 2 * pad!) / 3).toStringAsFixed(1)} mmHg',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: colors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildVitalSignsCard(ThemeData theme, ColorScheme colors) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'SIGNOS VITALES',
              style: theme.textTheme.titleMedium?.copyWith(
                color: colors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildNumberField(
                    label: 'Frec. Cardíaca (lpm)',
                    value: fc,
                    onChanged: (v) => setState(() => fc = v),
                    minValue: 0,
                    maxValue: 300,
                    icon: Icons.favorite_border,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildNumberField(
                    label: 'Frec. Respiratoria (rpm)',
                    value: fr,
                    onChanged: (v) => setState(() => fr = v),
                    minValue: 0,
                    maxValue: 100,
                    icon: Icons.air,
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
              icon: Icons.thermostat_outlined,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHemodynamicCard(ThemeData theme, ColorScheme colors) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'PARÁMETROS HEMODINÁMICOS',
              style: theme.textTheme.titleMedium?.copyWith(
                color: colors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                SizedBox(
                  width: 150,
                  child: _buildNumberField(
                    label: 'PVC (mmHg)',
                    value: pvc,
                    onChanged: (v) => setState(() => pvc = v),
                    minValue: 0,
                    maxValue: 50,
                    icon: Icons.water_drop_outlined,
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: _buildNumberField(
                    label: 'FiO₂ (%)',
                    value: fio2,
                    onChanged: (v) => setState(() => fio2 = v),
                    minValue: 21,
                    maxValue: 100,
                    icon: Icons.water,
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: _buildNumberField(
                    label: 'PIA (mmHg)',
                    value: pia,
                    onChanged: (v) => setState(() => pia = v),
                    minValue: 0,
                    maxValue: 100,
                    icon: Icons.bar_chart,
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: _buildNumberField(
                    label: 'PPA (mmHg)',
                    value: ppa,
                    onChanged: (v) => setState(() => ppa = v),
                    minValue: 0,
                    maxValue: 100,
                    icon: Icons.bar_chart,
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: _buildNumberField(
                    label: 'PIC (mmHg)',
                    value: pic,
                    onChanged: (v) => setState(() => pic = v),
                    minValue: 0,
                    maxValue: 100,
                    icon: Icons.bar_chart,
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: _buildNumberField(
                    label: 'PPC (mmHg)',
                    value: ppc,
                    onChanged: (v) => setState(() => ppc = v),
                    minValue: 0,
                    maxValue: 100,
                    icon: Icons.bar_chart,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMetabolicCard(ThemeData theme, ColorScheme colors) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'MONITOREO METABÓLICO',
              style: theme.textTheme.titleMedium?.copyWith(
                color: colors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildNumberField(
                    label: 'Glucometría (mg/dL)',
                    value: glucometria,
                    onChanged: (v) => setState(() => glucometria = v),
                    minValue: 0,
                    maxValue: 1000,
                    icon: Icons.monitor_heart_outlined,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildNumberField(
                    label: 'Insulina (UI/h)',
                    value: insulina,
                    onChanged: (v) => setState(() => insulina = v),
                    minValue: 0,
                    maxValue: 100,
                    icon: Icons.medication_outlined,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildNumberField(
              label: 'Saturación O₂ (%)',
              value: saturacion,
              onChanged: (v) => setState(() => saturacion = v),
              minValue: 0,
              maxValue: 100,
              icon: Icons.water,
            ),
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
    IconData? icon,
  }) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: theme.textTheme.bodyMedium?.copyWith(
          color: colors.onSurface.withOpacity(0.7),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colors.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colors.outline.withOpacity(0.5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colors.primary, width: 1.5),
        ),
        suffixText: label.contains('°C') ? '°C' : null,
        prefixIcon: icon != null ? Icon(icon, size: 20) : null,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        filled: true,
        fillColor: colors.surfaceContainerHighest.withOpacity(0.3),
      ),
      style: theme.textTheme.bodyLarge,
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

  Widget _buildActionButtons(ThemeData theme) {
    final colors = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: _isSaving ? null : () => Navigator.pop(context),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                side: BorderSide(color: colors.error),
              ),
              child: Text(
                'CANCELAR',
                style: theme.textTheme.labelLarge?.copyWith(
                  color: colors.error,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: ElevatedButton(
              onPressed: _isSaving ? null : _actualizarMonitoria,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                foregroundColor: colors.onPrimary,
              ),
              child: Text(
                'GUARDAR CAMBIOS',
                style: theme.textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
