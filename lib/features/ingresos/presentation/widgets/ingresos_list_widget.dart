import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/features/ingresos/data/providers/ingresos_by_sala_provider.dart';
import 'package:registro_uci/features/ingresos/presentation/widgets/components/ingreso_widget.dart';
import 'package:registro_uci/common/components/form_fields/dropdown_button_form_field.dart'; // Custom dropdown
import 'package:registro_uci/features/ingresos/domain/models/ingreso.dart'; // Enum Sala is here

class IngresosListWidget extends StatefulWidget {
  const IngresosListWidget({super.key});

  @override
  State<IngresosListWidget> createState() => _IngresosListWidgetState();
}

class _IngresosListWidgetState extends State<IngresosListWidget> {
  Sala selectedSala = Sala.A; // Default to Sala A

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),

        // Dropdown for selecting Sala, with Sala A as the initial value
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: EnumDropdownButtonFormField(
            onSelected: (sala) {
              setState(() {
                selectedSala = Sala.values.firstWhere((s) => s.name == sala);
              });
            },
            label: "Filtrar por Sala",
            value: selectedSala.name, // Set initial value to Sala A
            values: Sala.values
                .map((sala) => sala.name)
                .toList(), // List of Sala enum names
            prefixIcon: const Icon(Icons.filter_list),
          ),
        ),

        const SizedBox(height: 15),

        // Only this part is using Consumer to watch the provider
        Expanded(
          child: IngresosList(selectedSala: selectedSala),
        ),
      ],
    );
  }
}

class IngresosList extends ConsumerWidget {
  final Sala selectedSala;

  const IngresosList({required this.selectedSala, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the ingresosBySalaProvider based on the selected Sala
    final ingresos = ref.watch(ingresosBySalaProvider(selectedSala));

    return RefreshIndicator(
      onRefresh: () async {
        // Invalidate the provider on refresh
        ref.invalidate(ingresosBySalaProvider(selectedSala));
      },
      child: ingresos.when(
        data: (data) {
          return ListView(
            padding: const EdgeInsets.all(15),
            children: data.map((e) {
              return IngresoWidget(ingreso: e);
            }).toList(),
          );
        },
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => const Center(child: CircularProgressIndicator()),
        skipLoadingOnRefresh: false,
      ),
    );
  }
}
