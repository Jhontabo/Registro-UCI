import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'create_control_riegos_page.dart';
import 'update_control_riegos_page.dart';
import 'package:registro_uci/features/control_riesgos/data/repositories/firabase_control_de_riesgos.dart';
import 'package:registro_uci/features/control_riesgos/domain/models/control_de_riesgos.dart';

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
  List<ControlDeRiesgos> _registros = [];
  final FirebaseControlDeRiesgosRepository _repositorio =
      FirebaseControlDeRiesgosRepository();
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _cargarRegistros();
  }

  void _cargarRegistros() {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    _repositorio
        .getControlDeRiesgos(widget.idIngreso, widget.idRegistroDiario)
        .listen((controlDeRiesgosList) {
      setState(() {
        _registros = controlDeRiesgosList;
        _isLoading = false;
      });
    }, onError: (e) {
      print("Error al cargar los registros: $e");
      setState(() {
        _errorMessage = 'Error al cargar los registros: ${e.toString()}';
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al cargar los registros: $e')),
      );
    });
  }

  Future<void> _eliminarRegistro(String idControlDeRiesgos) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmar eliminación'),
        content:
            const Text('¿Estás seguro de que deseas eliminar este registro?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Eliminar', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirm == true) {
      try {
        await _repositorio.deleteControlDeRiesgos(
          widget.idIngreso,
          widget.idRegistroDiario,
          idControlDeRiesgos,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registro eliminado correctamente')),
        );
        _cargarRegistros();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al eliminar: ${e.toString()}')),
        );
      }
    }
  }

  void _mostrarDetallesRegistro(
      BuildContext context, ControlDeRiesgos registro) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
              "Detalles del Registro - ${registro.numeroReporteEA ?? 'Sin número'}"),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildSectionTitle('Información General'),
                _buildDetailRow(
                    'Fecha de registro',
                    registro.fechaRegistro != null
                        ? DateFormat('dd/MM/yyyy HH:mm')
                            .format(registro.fechaRegistro!)
                        : 'No disponible'),
                _buildSectionTitle('Úlceras por Presión (UPP)'),
                _buildDetailRow('Tiene UPP', registro.tieneUPP ? 'Sí' : 'No'),
                if (registro.tieneUPP) ...[
                  _buildDetailRow(
                      'Fecha registro UPP',
                      registro.fechaRegistroUlcera != null
                          ? DateFormat('dd/MM/yyyy')
                              .format(registro.fechaRegistroUlcera!)
                          : 'No disponible'),
                  _buildDetailRow('Número reporte EA',
                      registro.numeroReporteEA ?? 'No disponible'),
                  _buildDetailRow(
                      'Sitio UPP', registro.sitioUPP ?? 'No especificado'),
                  _buildDetailRow(
                      'UPP resuelta', registro.uppResuelta ? 'Sí' : 'No'),
                  if (registro.uppResuelta)
                    _buildDetailRow(
                        'Fecha resolución',
                        registro.fechaResolucion != null
                            ? DateFormat('dd/MM/yyyy')
                                .format(registro.fechaResolucion!)
                            : 'No disponible'),
                  _buildDetailRow('Días con úlceras',
                      registro.diasConUlceras?.toString() ?? '0'),
                ],
                _buildSectionTitle('Control Diario UPP'),
                _buildDetailRow('Mañana',
                    registro.controlUPPManana?.toString() ?? 'No registrado'),
                _buildDetailRow('Tarde',
                    registro.controlUPPTarde?.toString() ?? 'No registrado'),
                _buildDetailRow('Noche',
                    registro.controlUPPNoche?.toString() ?? 'No registrado'),
                _buildSectionTitle('Riesgo de Caídas'),
                _buildDetailRow('Nivel de riesgo', registro.riesgoCaida),
                _buildDetailRow('Número reporte caída',
                    registro.numeroReporteCaida ?? 'No disponible'),
                _buildSectionTitle('Control Diario Caídas'),
                _buildDetailRow('Mañana',
                    registro.controlCaidaManana?.toString() ?? 'No registrado'),
                _buildDetailRow('Tarde',
                    registro.controlCaidaTarde?.toString() ?? 'No registrado'),
                _buildDetailRow('Noche',
                    registro.controlCaidaNoche?.toString() ?? 'No registrado'),
                _buildSectionTitle('Anticoagulantes'),
                _buildDetailRow('Usa anticoagulantes',
                    registro.usaAnticoagulantes ? 'Sí' : 'No'),
                if (registro.usaAnticoagulantes)
                  _buildDetailRow('Tipo',
                      registro.anticoagulanteSeleccionado ?? 'No especificado'),
                _buildSectionTitle('Aislamiento'),
                _buildDetailRow(
                    'En aislamiento', registro.enAislamiento ? 'Sí' : 'No'),
                if (registro.enAislamiento) ...[
                  _buildDetailRow(
                      'Tipo', registro.tipoAislamiento ?? 'No especificado'),
                  _buildDetailRow('Agente',
                      registro.agenteAislamiento ?? 'No especificado'),
                  _buildDetailRow(
                      'Fecha inicio',
                      registro.fechaInicioAislamiento != null
                          ? DateFormat('dd/MM/yyyy')
                              .format(registro.fechaInicioAislamiento!)
                          : 'No disponible'),
                  _buildDetailRow(
                      'Fecha fin',
                      registro.fechaFinAislamiento != null
                          ? DateFormat('dd/MM/yyyy')
                              .format(registro.fechaFinAislamiento!)
                          : 'No disponible'),
                  _buildDetailRow('Días de aislamiento',
                      registro.diasDeAislamiento?.toString() ?? '0'),
                ],
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cerrar', style: TextStyle(color: Colors.blue)),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150,
            child: Text(
              '$title:',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListaRegistros(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, color: Colors.red, size: 48),
            const SizedBox(height: 16),
            Text(
              _errorMessage!,
              style: const TextStyle(color: Colors.red),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _cargarRegistros,
              child: const Text('Reintentar'),
            ),
          ],
        ),
      );
    }

    if (_registros.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.info_outline, color: Colors.blue, size: 48),
            const SizedBox(height: 16),
            const Text(
              "No hay registros de control de riesgos",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              "Presiona el botón + para agregar uno nuevo",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _registros.length,
      itemBuilder: (context, index) {
        final registro = _registros[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () => _mostrarDetallesRegistro(context, registro),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Título del reporte
                  Text(
                    registro.numeroReporteEA != null
                        ? "Reporte EA: ${registro.numeroReporteEA}"
                        : "Registro sin número",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),

                  // Fecha
                  Text(
                    registro.fechaRegistro != null
                        ? DateFormat('dd/MM/yyyy')
                            .format(registro.fechaRegistro!)
                        : 'Sin fecha',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Estado UPP
                  Text(
                    'UPP: ${registro.riesgoUPP}',
                    style: TextStyle(
                      fontSize: 14,
                      color: registro.riesgoUPP == 'Alto'
                          ? Colors.red
                          : registro.riesgoUPP == 'Medio'
                              ? Colors.orange
                              : Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // Estado Caída
                  Text(
                    'Caída: ${registro.riesgoCaida}',
                    style: TextStyle(
                      fontSize: 14,
                      color: _getRiskColor(registro.riesgoCaida),
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // Estado Aislamiento con días
                  Text(
                    'Aislamiento: ${registro.enAislamiento ? 'Sí (${registro.diasDeAislamiento ?? 0} días)' : 'No'}',
                    style: TextStyle(
                      fontSize: 14,
                      color:
                          registro.enAislamiento ? Colors.orange : Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Botones de acción
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit,
                            color: Colors.blue, size: 24),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UpdateControlRiesgosPage(
                                idIngreso: widget.idIngreso,
                                idRegistroDiario: widget.idRegistroDiario,
                                controlRiesgosId: registro.idControlDeRiesgos,
                              ),
                            ),
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete,
                            color: Colors.red, size: 24),
                        onPressed: () =>
                            _eliminarRegistro(registro.idControlDeRiesgos),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildStatusChip(String label, String value, {Color? color}) {
    return Chip(
      label: Text('$label: $value'),
      backgroundColor: color?.withOpacity(0.2),
      labelStyle: TextStyle(
        color: color ?? Colors.black,
        fontWeight: FontWeight.bold,
      ),
      side: BorderSide(color: color ?? Colors.grey),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  Color _getRiskColor(String risk) {
    switch (risk.toLowerCase()) {
      case 'alto':
        return Colors.red;
      case 'moderado':
        return Colors.orange;
      case 'bajo':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Control de Riesgos'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async => _cargarRegistros(),
                child: SingleChildScrollView(
                  child: _buildListaRegistros(context),
                ),
              ),
            ),
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
          ).then((_) => _cargarRegistros());
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
