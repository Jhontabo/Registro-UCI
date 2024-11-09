import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:registro_uci/features/antibioticos/data/dto/update_dia_tratamiento_dto.dart';
import 'package:registro_uci/features/antibioticos/data/providers/dia_tratamiento_provider.dart';
import 'package:registro_uci/features/antibioticos/data/providers/dosis_tratamiento_provider.dart';
import 'package:registro_uci/features/antibioticos/data/providers/tratamiento_antibiotico_provider.dart';
import 'package:registro_uci/features/antibioticos/domain/models/dosis_tratamiento.dart';
import 'package:registro_uci/features/antibioticos/presentation/controllers/update_dia_tratamiento_controller.dart';

class DosisTratamientoPage extends ConsumerStatefulWidget {
  final DosisTratamientoParams dosisParams;
  final TratamientoAntibioticoParams tratamientoParams;

  const DosisTratamientoPage({
    super.key,
    required this.dosisParams,
    required this.tratamientoParams,
  });

  @override
  ConsumerState<DosisTratamientoPage> createState() =>
      _DosisTratamientoPageState();
}

class _DosisTratamientoPageState extends ConsumerState<DosisTratamientoPage> {
  @override
  void initState() {
    super.initState();
    // You can add any initialization logic here if necessary
  }

  Future<void> _refreshData() async {
    // Refresh the two providers
    ref.refresh(tratamientoAntibioticoProvider(widget.tratamientoParams));
    ref.refresh(dosisTratamientoProvider(widget.dosisParams));
    // Wait for the providers to load the new data
    await Future.wait([
      ref.read(tratamientoAntibioticoProvider(widget.tratamientoParams).future),
      ref.read(dosisTratamientoProvider(widget.dosisParams).future),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final tratamientoAsyncValue =
        ref.watch(tratamientoAntibioticoProvider(widget.tratamientoParams));
    final dosisAsyncValue =
        ref.watch(dosisTratamientoProvider(widget.dosisParams));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tratamiento Antibiótico'),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: tratamientoAsyncValue.when(
            data: (tratamiento) {
              return dosisAsyncValue.when(
                data: (dosisList) {
                  final diaTratamiento = ref.watch(
                    diaTratamientoProvider(
                      DiaTratamientoParams(
                          idIngreso: widget.dosisParams.idIngreso,
                          idTratamientoAntibiotico:
                              widget.dosisParams.idTratamientoAntibiotico,
                          idDiaTratamiento:
                              widget.dosisParams.idDiaTratamiento),
                    ),
                  );

                  return diaTratamiento.when(
                    data: (dia) {
                      final totalDosis = dosisList.fold<int>(
                          0, (sum, dosis) => sum + dosis.cantidad);
                      final expectedDosis =
                          tratamiento.cantidad * tratamiento.frecuenciaEn24h;
                      final isTreatmentDayComplete =
                          totalDosis == expectedDosis;

                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        if (isTreatmentDayComplete &&
                            dia!.valido != isTreatmentDayComplete) {
                          _updateTratamiento(
                            ref,
                            widget.tratamientoParams.idIngreso,
                            tratamiento.idTratamientoAntibiotico,
                            widget.dosisParams.idDiaTratamiento,
                            true,
                          );
                        }
                      });

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildDosesList(dosisList),
                          const SizedBox(height: 16),
                          _buildProgressBar(totalDosis, expectedDosis),
                          const SizedBox(height: 32),
                          _buildTreatmentDayStatus(isTreatmentDayComplete),
                        ],
                      );
                    },
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (error, _) =>
                        Text('Error cargando tratamiento: $error'),
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, _) => Text('Error cargando dosis: $error'),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, _) => Text('Error cargando tratamiento: $error'),
          ),
        ),
      ),
    );
  }

  // Method to update the tratamiento if necessary
  Future<void> _updateTratamiento(
    WidgetRef ref,
    String idIngreso,
    String idTratamientoAntibiotico,
    String idDiaTratamiento,
    bool valido,
  ) async {
    final controller =
        ref.read(updateDiaTratamientoControllerProvider.notifier);
    final dto =
        UpdateDiaTratamientoDto(valido: valido); // Create DTO for update

    // Call the update method
    await controller.updateDiaTratamiento(
      idIngreso,
      idTratamientoAntibiotico,
      idDiaTratamiento,
      dto,
    );
  }

  // Doses list widget
  Widget _buildDosesList(List<DosisTratamiento> dosisList) {
    return Expanded(
      child: ListView.builder(
        itemCount: dosisList.length,
        itemBuilder: (context, index) {
          final dosis = dosisList[index];
          return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: const Icon(Icons.medical_services, color: Colors.blue),
              title: Text('Dosis ${index + 1}: ${dosis.cantidad} cc'),
              subtitle: RichText(
                text: TextSpan(
                  children: [
                    const WidgetSpan(
                      child: Icon(Icons.access_time,
                          size: 16, color: Colors.blueAccent),
                    ),
                    TextSpan(
                      text:
                          ' ${DateFormat.yMMMMd().add_Hm().format(dosis.hora)}',
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                    if (dosis.comentario != null)
                      TextSpan(
                        text: '\nComentario: ${dosis.comentario}',
                        style: const TextStyle(fontWeight: FontWeight.normal),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Progress bar for dosage
  Widget _buildProgressBar(int totalDosis, int expectedDosis) {
    final progress = totalDosis / expectedDosis;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Progreso de dosis diaria:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        LinearProgressIndicator(
          value: progress,
          backgroundColor: Colors.grey[300],
          valueColor: AlwaysStoppedAnimation<Color>(
            progress >= 1.0 ? Colors.greenAccent : Colors.amber,
          ),
          minHeight: 12,
        ),
        const SizedBox(height: 8),
        Text('Actual: $totalDosis cc / Esperado: $expectedDosis cc'),
      ],
    );
  }

  // Treatment day status widget
  Widget _buildTreatmentDayStatus(bool isComplete) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isComplete ? Colors.green[100] : Colors.amber[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isComplete ? Icons.check_circle : Icons.warning,
              color: isComplete ? Colors.green : Colors.deepOrange,
            ),
            const SizedBox(width: 8),
            Text(
              isComplete
                  ? 'Cuenta como día de tratamiento'
                  : 'NO cuenta como día de tratamiento',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isComplete ? Colors.green : Colors.deepOrange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
