import 'package:flutter/material.dart';
import 'package:registro_uci/constants/intervenciones.dart';
import 'package:registro_uci/features/intervenciones/domain/models/intervencion.dart';
import 'package:registro_uci/features/resultados/domain/models/resultado.dart';
import 'package:registro_uci/pages/resultados/resultado_page.dart';

class ResultadosDeIntervencionPage extends StatelessWidget {
  final Intervencion intervencion;
  const ResultadosDeIntervencionPage({super.key, required this.intervencion});

  @override
  Widget build(BuildContext context) {
    final List<Resultado>? resultados =
        resultadosDeIntervencion[intervencion.idNIC];

    return Scaffold(
      appBar: AppBar(
        title: Text("Resultados de ${intervencion.nombre}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: resultados == null
            ? const Text('No results available.')
            : ListView.builder(
                itemCount: resultados.length,
                itemBuilder: (context, index) {
                  final resultado = resultados[index];
                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: const Icon(Icons.insights, color: Colors.blue),
                      title: Text(resultado.nombre),
                      subtitle: Text("NOC: ${resultado.idNOC}"),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ResultadoPage(resultado: resultado),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
      ),
    );
  }
}
