import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'create_control_riegos_page.dart'; // Asegúrate de importar la página de creación

class ControlDeRiesgosPage extends StatefulWidget {
  final String idIngreso;
  final String idRegistroDiario;

  const ControlDeRiesgosPage({
    super.key,
    required this.idIngreso,
    required this.idRegistroDiario,
  });

  @override
  _ControlDeRiesgosPageState createState() => _ControlDeRiesgosPageState();
}

class _ControlDeRiesgosPageState extends State<ControlDeRiesgosPage> {
  // Variables de estado para los registros
  List<Map<String, dynamic>> registros = [];

  // Método para mostrar la lista de registros
  Widget _buildListaRegistros() {
    return registros.isEmpty
        ? const Center(child: Text("No hay registros aún"))
        : ListView.builder(
            shrinkWrap: true,
            itemCount: registros.length,
            itemBuilder: (context, index) {
              final registro = registros[index];
              return Card(
                elevation: 5,
                child: ListTile(
                  title: Text('Reporte: ${registro['numeroReporte']}'),
                  subtitle: Text('Fecha: ${registro['fecha']}'),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('Mañana: ${registro['manana']}'),
                      Text('Tarde: ${registro['tarde']}'),
                      Text('Noche: ${registro['noche']}'),
                    ],
                  ),
                  onTap: () {
                    // Aquí puedes implementar la acción al seleccionar un registro
                  },
                ),
              );
            },
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Control de Riesgos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Lista de registros
            _buildListaRegistros(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navegar a la página de creación de control de riesgos y pasar el idRegistroDiario
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateControlRiesgosPage(
                idIngreso: widget.idIngreso, // Pasa el idIngreso
                idRegistroDiario:
                    widget.idRegistroDiario, // Pasa el idRegistroDiario
              ),
            ),
          );
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}
