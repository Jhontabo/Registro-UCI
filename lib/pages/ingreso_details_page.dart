import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:registro_uci/common/components/buttons/secondary_button.dart';
import 'package:registro_uci/features/ingresos/data/providers/ingreso_by_id_provider.dart';
import 'package:registro_uci/features/ingresos/domain/models/ingreso.dart';
import 'package:registro_uci/pages/update_ingreso_page.dart';

class IngresoDetailsPage extends ConsumerWidget {
  final String idIngreso;
  const IngresoDetailsPage({
    super.key,
    required this.idIngreso,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ingreso = ref.watch(ingresoByIdProvider(idIngreso));

    return ingreso.when(
      data: (data) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Detalles de Ingreso"),
          ),
          body: ListView(
            padding: const EdgeInsets.all(15),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      data!.nombrePaciente.toUpperCase(),
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  const SizedBox(width: 10),
                  SecondaryButton(
                    child: Row(
                      children: [
                        Icon(
                          Icons.edit,
                          size: 18,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        const SizedBox(width: 10),
                        const Text("Editar ingreso"),
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => UpdateIngresoPage(ingreso: data),
                      ));
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
              _buildRichText(
                'Fecha de Nacimiento',
                data.fechaNacimientoPaciente != null
                    ? DateFormat('dd/MM/yyyy')
                        .format(data.fechaNacimientoPaciente!)
                    : "Desconocido",
              ),
              _buildRichText(
                'E.P.S. o ARL',
                data.epsOArl,
              ),
              _buildRichText(
                'Identificación Paciente',
                data.identificacionPaciente,
              ),
              _buildRichText(
                'Carpeta',
                data.carpeta,
              ),
              _buildRichText(
                'Fecha de Ingreso',
                DateFormat('dd/MM/yyyy').format(data.fechaIngreso),
              ),
              _buildRichText(
                'Nombre Familiar',
                data.nombreFamiliar,
              ),
              _buildRichText(
                'Parentesco Familiar',
                data.parentescoFamiliar,
              ),
              _buildRichText(
                'Teléfono Familiar',
                data.telefonoFamiliar,
              ),
              _buildRichText(
                'Diagnóstico Ingreso',
                data.diagnosticoIngreso,
              ),
              _buildRichText(
                'Diagnóstico Actual',
                data.diagnosticoActual,
              ),
              _buildRichText(
                'Peso',
                '${data.peso.toString()} kg',
              ),
              _buildRichText(
                'Talla',
                '${data.talla.toString()} cm',
              ),
              _buildRichText(
                'Cama',
                data.cama,
              ),
              _buildRichText(
                'Sala',
                data.sala.salaToString(),
              ),
              _buildRichText(
                'Alergias',
                data.alergias ?? "Ninguna",
              ),
            ],
          ),
        );
      },
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const CircularProgressIndicator(),
    );
  }

  Widget _buildRichText(String label, String data) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontFamily: 'PlusJakartaSans',
          ),
          children: [
            TextSpan(
              text: '$label: ',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(
              text: data,
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
    );
  }
}
