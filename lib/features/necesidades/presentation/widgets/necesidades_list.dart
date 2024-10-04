import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/features/necesidades/data/providers/necesidades_de_registro_provider.dart';
import 'package:registro_uci/features/necesidades/domain/models/necesidad.dart';
import 'package:registro_uci/features/necesidades/presentation/widgets/necesidad_action_buttons.dart';

class NecesidadesList extends ConsumerWidget {
  final String idIngreso;
  final String idRegistro;

  const NecesidadesList(
      {super.key, required this.idIngreso, required this.idRegistro});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final params = NecesidadesParams(
      idIngreso: idIngreso,
      idRegistro: idRegistro,
    );
    final necesidades = ref.watch(necesidadesDeRegistroProvider(params));

    return necesidades.when(
      data: (data) {
        return Expanded(
          // height: MediaQuery.of(context).size.height * .3,
          child: SingleChildScrollView(
            child: Column(
              children: data
                  .map((necesidad) => NecesidadWidget(
                        necesidad: necesidad,
                        params: params,
                      ))
                  .toList(),
            ),
          ),
        );
      },
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const CircularProgressIndicator(),
    );
  }
}

class NecesidadWidget extends StatelessWidget {
  final Necesidad necesidad;
  final NecesidadesParams params;

  const NecesidadWidget({
    super.key,
    required this.necesidad,
    required this.params,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(child: Text(necesidad.nombreNecesidad)),
              NecesidadActionButtons(
                necesidad: necesidad,
                params: params,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
