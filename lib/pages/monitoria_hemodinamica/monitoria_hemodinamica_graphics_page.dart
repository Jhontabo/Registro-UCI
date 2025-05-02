import 'package:flutter/material.dart';

class GraphicsPage extends StatelessWidget {
  final String idIngreso;
  final String idRegistroDiario;

  const GraphicsPage({
    super.key,
    required this.idIngreso,
    required this.idRegistroDiario,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gráficos Hemodinámicos'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ID Ingreso: $idIngreso',
                style: Theme.of(context).textTheme.bodyLarge),
            Text('ID Registro Diario: $idRegistroDiario',
                style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 20),
            // Aquí puedes agregar tus gráficos
            Container(
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Text('Gráfico 1 - Placeholder',
                    style: TextStyle(color: Colors.grey)),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Text('Gráfico 2 - Placeholder',
                    style: TextStyle(color: Colors.grey)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
