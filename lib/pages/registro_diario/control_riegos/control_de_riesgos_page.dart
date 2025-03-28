import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'create_control_riegos_page.dart';
import 'update_control_riegos_page.dart';
import 'package:registro_uci/features/registros_diarios/control_riesgos/data/repositories/firabase_control_de_riesgos.dart';
import 'package:registro_uci/features/registros_diarios/control_riesgos/domain/models/control_de_riesgos.dart';

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
  List<Map<String, dynamic>> registros = [];
  final FirebaseControlDeRiesgosRepository _repositorio =
      FirebaseControlDeRiesgosRepository();

  @override
  void initState() {
    super.initState();
    _cargarRegistros();
  }

  Future<void> _cargarRegistros() async {
    try {
      List<ControlDeRiesgos> controlDeRiesgosList =
          await _repositorio.getControlDeRiesgos(
        widget.idIngreso,
        widget.idRegistroDiario,
      );
      setState(() {
        registros = controlDeRiesgosList.map((registro) {
          return {
            'numeroReporte': registro.numeroReporteEA ??
                'Sin reporte', // Asegura que haya un valor
            'fecha': registro.fechaRegistroUlcera != null
                ? DateFormat('dd/MM/yyyy').format(registro.fechaRegistroUlcera!)
                : 'Fecha no disponible', // Asegura que la fecha no sea null
            'manana': registro.diasConUlceras ??
                0, // Asegura que haya un valor predeterminado
            'tarde': registro.diasDeAislamiento ??
                0, // Asegura que haya un valor predeterminado
            'noche': registro.diasDeAislamiento ??
                0, // Asegura que haya un valor predeterminado
            'id': registro.idControlDeRiesgos ??
                '', // Si el ID es nulo, asigna un valor vacío
          };
        }).toList();
      });
    } catch (e) {
      print("Error al cargar los registros: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al cargar los registros: $e')),
      );
    }
  }

  Future<void> _eliminarRegistro(String idControlDeRiesgos) async {
    try {
      await _repositorio.deleteControlDeRiesgos(
        widget.idIngreso,
        widget.idRegistroDiario,
        idControlDeRiesgos,
      );
      _cargarRegistros(); // Recargar los registros después de eliminar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Registro eliminado')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al eliminar el registro: $e')),
      );
    }
  }

  void _mostrarDetallesRegistro(
      BuildContext context, Map<String, dynamic> registro) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Detalles del Registro"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                _buildDetailRow('Número de Reporte', registro['numeroReporte']),
                const Divider(),
                _buildDetailRow('Fecha', registro['fecha']),
                const Divider(),
                _buildDetailRow('Mañana', registro['manana']),
                _buildDetailRow('Tarde', registro['tarde']),
                _buildDetailRow('Noche', registro['noche']),
                const Divider(),
                _buildDetailRow('Número de Reporte de Caída',
                    registro['numeroReporteCaida']),
                const Divider(),
                _buildDetailRow('Sitio UPP', registro['sitioUPP']),
                const Divider(),
                _buildDetailRow(
                    '¿Tiene UPP?',
                    registro['tieneUPP'] == null
                        ? 'No disponible'
                        : (registro['tieneUPP'] ? 'Sí' : 'No')),
                const Divider(),
                _buildDetailRow(
                    '¿UPP Resuelta?',
                    registro['uppResuelta'] == null
                        ? 'No disponible'
                        : (registro['uppResuelta'] ? 'Sí' : 'No')),
                const Divider(),
                _buildDetailRow(
                    'Fecha de Resolución', registro['fechaResolucion']),
                const Divider(),
                _buildDetailRow(
                    'Anticoagulantes',
                    registro['usaAnticoagulantes'] == null
                        ? 'No disponible'
                        : (registro['usaAnticoagulantes'] ? 'Sí' : 'No')),
                const Divider(),
                _buildDetailRow(
                    'Tipo de Aislamiento', registro['tipoAislamiento']),
                _buildDetailRow('Fecha de Inicio de Aislamiento',
                    registro['fechaInicioAislamiento']),
                _buildDetailRow('Fecha de Fin de Aislamiento',
                    registro['fechaFinAislamiento']),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cerrar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildDetailRow(String title, dynamic value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$title: ',
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
          ),
          Expanded(
            child: Text(
              '${value ?? 'No disponible'}', // Usa un valor predeterminado si es nulo
              style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  color: Colors.black),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListaRegistros(BuildContext context) {
    if (registros.isEmpty) {
      return const Center(child: Text("No hay registros."));
    }
    return ListView.builder(
      shrinkWrap: true,
      itemCount: registros.length,
      itemBuilder: (context, index) {
        final registro = registros[index];
        return Card(
          child: ListTile(
            title: Text(
              "Reporte ${registro['numeroReporte']} - ${registro['fecha']}",
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    // Navegar a la página de edición de control de riesgos
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UpdateControlRiesgosPage(
                            idIngreso: widget.idIngreso,
                            idRegistroDiario: widget.idRegistroDiario,
                            controlRiesgosId:
                                registro['id'], // Solo pasas el id
                          ),
                        ));
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    _eliminarRegistro(registro['id']);
                  },
                ),
              ],
            ),
            onTap: () {
              _mostrarDetallesRegistro(context, registro);
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
            _buildListaRegistros(context),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateControlRiesgosPage(
                idIngreso: widget.idIngreso,
                idRegistroDiario: widget.idRegistroDiario,
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
