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
  bool _isLoading = false;
  bool _dataLoaded =
      false; // Nueva variable para controlar si los datos están cargados

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      if (mounted && widget.idMonitoriaExistente != null) {
        _cargarDatosExistente();
      }
    });
  }

  Future<void> _cargarDatosExistente() async {
    print('=== INICIO _cargarDatosExistente ===');

    // 1. Verificación de parámetros iniciales
    print('Verificando ID de monitoría...');
    if (widget.idMonitoriaExistente == null ||
        widget.idMonitoriaExistente!.isEmpty) {
      print('ID de monitoría no proporcionado o vacío');
      return;
    }
    print('ID válido: ${widget.idMonitoriaExistente}');

    try {
      // 2. Verificación de contexto y mounted
      print('Verificando contexto y mounted...');
      if (!mounted) {
        print('Widget no montado - abortando carga');
        return;
      }

      // 3. Mostrar loading
      print('Mostrando diálogo de loading...');
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => const Center(child: CircularProgressIndicator()),
      );

      // 4. Preparar parámetros para el provider
      print('Preparando parámetros para el provider...');
      final params = ParametrosMonitoriaHemodinamica(
        idIngreso: widget.idIngreso,
        idRegistroDiario: widget.idRegistroDiario,
        idMonitoria: widget.idMonitoriaExistente,
      );
      print('Parámetros creados: $params');

      // 5. Llamada al provider
      print('Llamando al provider...');
      final monitoriasAsync =
          await ref.read(monitoriasHemodinamicasProvider(params).future);
      print(
          'Respuesta del provider recibida. Número de monitorías: ${monitoriasAsync.length}');

      // 6. Verificar mounted después de await
      if (!mounted) {
        print('Widget desmontado durante la carga - abortando');
        return;
      }

      // 7. Cerrar loading
      print('Cerrando diálogo de loading...');
      Navigator.pop(context);

      // 8. Verificar datos recibidos
      if (monitoriasAsync.isEmpty) {
        print('No se encontraron monitorías');
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Monitoría no encontrada')),
          );
          Navigator.pop(context);
        }
        return;
      }

      final monitoria = monitoriasAsync.first;
      print('Datos de monitoría a cargar:');
      print('Hora: ${monitoria.hora}');
      print('PAS/PAD: ${monitoria.pas}/${monitoria.pad}');
      print('PVC: ${monitoria.pvc}');

      // Agrega más prints para otros campos idMonitoriaExistente

      // 9. Actualizar estado
      if (mounted) {
        print('Actualizando estado del widget...');
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
        });
        print('Estado actualizado correctamente');
      }
    } catch (e, stackTrace) {
      print('=== ERROR EN _cargarDatosExistente ===');
      print('Tipo de error: ${e.runtimeType}');
      print('Mensaje: ${e.toString()}');
      print('Stack trace:');
      print(stackTrace);

      if (mounted) {
        Navigator.pop(context); // Cerrar loading si hay error
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al cargar: ${e.toString()}')),
        );
      }
    } finally {
      print('=== FIN DE _cargarDatosExistente ===');
    }
  }

  Future<void> _actualizarMonitoria() async {
    if (!_formKey.currentState!.validate() || _isLoading) return;

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
              idMonitoria: widget.idMonitoriaExistente)));

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Monitoría actualizada correctamente')),
        );
        Navigator.pop(context, true);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al actualizar: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Monitoría'),
      ),
      body: _isLoading ||
              !_dataLoaded // Mostrar carga si está cargando O si los datos no están listos
          ? const Center(child: CircularProgressIndicator())
          : Form(
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
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 16),
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
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor),
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
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 16),
                            _buildNumberField(
                              label: 'FC (ppm)',
                              value: fc,
                              onChanged: (v) => fc = v,
                              minValue: 0,
                              maxValue: 300,
                            ),
                            const SizedBox(height: 16),
                            _buildNumberField(
                              label: 'FR (rpm)',
                              value: fr,
                              onChanged: (v) => fr = v,
                              minValue: 0,
                              maxValue: 60,
                            ),
                            const SizedBox(height: 16),
                            _buildNumberField(
                              label: 'Temperatura (°C)',
                              value: t?.toInt(),
                              onChanged: (v) => t = v?.toDouble(),
                              minValue: 30,
                              maxValue: 45,
                              decimal: true,
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Sección de Oxigenación
                    Card(
                      margin: const EdgeInsets.only(bottom: 16),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            const Text(
                              'Oxigenación',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 16),
                            _buildNumberField(
                              label: 'FiO₂ (%)',
                              value: fio2,
                              onChanged: (v) => fio2 = v,
                              minValue: 21,
                              maxValue: 100,
                            ),
                            const SizedBox(height: 16),
                            _buildNumberField(
                              label: 'Sat O₂ (%)',
                              value: saturacion,
                              onChanged: (v) => saturacion = v,
                              minValue: 0,
                              maxValue: 100,
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Sección de Presiones Especiales
                    Card(
                      margin: const EdgeInsets.only(bottom: 16),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            const Text(
                              'Presiones Especiales',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                  child: _buildNumberField(
                                    label: 'PVC (mmHg)',
                                    value: pvc,
                                    onChanged: (v) => pvc = v,
                                    minValue: -10,
                                    maxValue: 50,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: _buildNumberField(
                                    label: 'PIA (mmH₂O)',
                                    value: pia,
                                    onChanged: (v) => pia = v,
                                    minValue: 0,
                                    maxValue: 50,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                  child: _buildNumberField(
                                    label: 'PPA (mmHg)',
                                    value: ppa,
                                    onChanged: (v) => ppa = v,
                                    minValue: 0,
                                    maxValue: 300,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: _buildNumberField(
                                    label: 'PIC (mmHg)',
                                    value: pic,
                                    onChanged: (v) => pic = v,
                                    minValue: 0,
                                    maxValue: 50,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            _buildNumberField(
                              label: 'PPC (mmHg)',
                              value: ppc,
                              onChanged: (v) => ppc = v,
                              minValue: 0,
                              maxValue: 150,
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Sección Metabólica
                    Card(
                      margin: const EdgeInsets.only(bottom: 16),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            const Text(
                              'Datos Metabólicos',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 16),
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
                          ],
                        ),
                      ),
                    ),

                    // Botones de acción
                    _buildActionButtons(),
                  ],
                ),
              ),
            ),
    );
  }

  // Método para campos numéricos con soporte decimal
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
    return Row(
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
          onPressed: _isLoading ? null : _actualizarMonitoria,
          child: const Text('Guardar Cambios'),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
        ),
      ],
    );
  }
}
