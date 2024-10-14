import 'package:flutter/material.dart';
import 'package:registro_uci/constants/intervenciones.dart';
import 'package:registro_uci/features/resultados/domain/models/indicador.dart';
import 'package:registro_uci/features/resultados/domain/models/resultado.dart';

class ResultadoPage extends StatelessWidget {
  final Resultado resultado;
  const ResultadoPage({super.key, required this.resultado});

  @override
  Widget build(BuildContext context) {
    final List<Indicador>? indicadores =
        indicadoresDeResultados[resultado.idNOC];

    return Scaffold(
      appBar: AppBar(
        title: Text("Indicadores de ${resultado.nombre}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: indicadores == null
            ? const Text('No indicators available.')
            : ListView.builder(
                itemCount: indicadores.length,
                itemBuilder: (context, index) {
                  final indicador = indicadores[index];
                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: const Icon(Icons.stacked_line_chart,
                          color: Colors.purple),
                      title: Text(indicador.descripcion),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
