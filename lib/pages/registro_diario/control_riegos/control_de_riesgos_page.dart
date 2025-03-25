import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../features/registros_diarios/control_riesgos/data/constants/constants.dart'; // Importamos el archivo de constantes

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
  // Variables de estado
  bool tieneUPP = false;
  bool uppResuelta = false;
  bool enAislamiento = false;
  bool usaAnticoagulantes = false;
  bool tieneEventoAdversoCaida = false;

  DateTime? fechaRegistroUlcera;
  DateTime? fechaResolucion;
  DateTime? fechaInicioAislamiento;
  DateTime? fechaFinAislamiento;

  TextEditingController numeroReporteEAController = TextEditingController();
  TextEditingController numeroReporteCaidaController = TextEditingController();
  TextEditingController sitioUPPController = TextEditingController();
  TextEditingController agenteAislamientoController = TextEditingController();

  String? _selectedSitioUPP;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Control de Riesgos')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Control UPP y Sitio anatómico de UPP fusionados
            _buildControlUPP(),

            // Riesgo de Caídas
            const SizedBox(height: 20),
            _buildRiesgoDeCaidas(),

            // Anticoagulantes
            const SizedBox(height: 20),
            _buildAnticoagulantes(),

            // Aislamiento
            const SizedBox(height: 20),
            _buildAislamiento(),

            // Botón para guardar
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Aquí puedes agregar la lógica para guardar los datos
                _guardarDatos();
              },
              child: const Text('Guardar Control de Riesgos'),
            ),
          ],
        ),
      ),
    );
  }

  // Método para guardar los datos
  void _guardarDatos() {
    // Aquí puedes hacer la lógica para almacenar los datos en una base de datos o realizar la acción deseada
    print('Datos Guardados');
  }

  // Widget para Control UPP y Sitio anatómico de UPP fusionado
  Widget _buildControlUPP() {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Control UPP',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            CheckboxListTile(
              title: const Text('¿Tiene UPP?'),
              value: tieneUPP,
              onChanged: (value) {
                setState(() {
                  tieneUPP = value!;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
            if (tieneUPP) ...[
              const Text('Número de Reporte EA'),
              TextField(
                controller: numeroReporteEAController,
                keyboardType:
                    TextInputType.number, // Esto restringe la entrada a números
                decoration: const InputDecoration(
                  hintText: 'Ingrese reporte EA',
                  enabledBorder: OutlineInputBorder(
                    // Borde visible cuando el campo no está enfocado
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text('Sitio de UPP'),
              DropdownButtonFormField<String>(
                hint: const Text("Seleccione un sitio anatómico"),
                value: _selectedSitioUPP,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedSitioUPP = newValue;
                  });
                },
                isExpanded:
                    true, // Esto asegurará que el DropdownButton ocupe todo el ancho disponible
                items: [
                  ...SitiosAnatomicosUPP.sitiosCefalicos,
                  ...SitiosAnatomicosUPP.sitiosExtremidadesSuperiores,
                  ...SitiosAnatomicosUPP.sitiosTronco,
                  ...SitiosAnatomicosUPP.sitiosExtremidadesInferiores,
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(height: 10),
              CheckboxListTile(
                title: const Text('¿UPP Resuelta?'),
                value: uppResuelta,
                onChanged: (value) {
                  setState(() {
                    uppResuelta = value!;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
              if (uppResuelta) ...[
                const Text('Fecha de Resolución'),
                TextField(
                  controller: TextEditingController(
                    text: fechaResolucion != null
                        ? DateFormat('dd/MM/yyyy').format(fechaResolucion!)
                        : '',
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Seleccionar fecha de resolución',
                  ),
                  onTap: () async {
                    fechaResolucion = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );
                    setState(() {});
                  },
                ),
              ]
            ]
          ],
        ),
      ),
    );
  }

  // Widget para Riesgo de Caídas
  Widget _buildRiesgoDeCaidas() {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Riesgo de Caída',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            CheckboxListTile(
              title: const Text('¿Evento Adverso relacionado a Caídas?'),
              value:
                  tieneEventoAdversoCaida, // Aquí puedes usar una variable de estado si es necesario
              onChanged: (value) {
                setState(() {
                  tieneEventoAdversoCaida = value!;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
            const Text('Número de Reporte Caída'),
            TextField(
              controller: numeroReporteCaidaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Ingrese reporte de caída',
                enabledBorder: OutlineInputBorder(
                  // Borde visible cuando el campo no está enfocado
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget para Anticoagulantes
  Widget _buildAnticoagulantes() {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Anticoagulantes',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            CheckboxListTile(
              title: const Text('¿Usa Anticoagulantes?'),
              value: usaAnticoagulantes,
              onChanged: (value) {
                setState(() {
                  usaAnticoagulantes = value!;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
            if (usaAnticoagulantes) ...[
              const Text('Anticoagulante Seleccionado'),
              DropdownButton<String>(
                value: 'Heparina', // Cambiar según la selección
                onChanged: (String? newValue) {},
                items: <String>['Heparina', 'Warfarina', 'Apixabán']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ]
          ],
        ),
      ),
    );
  }

  // Widget para Aislamiento
  Widget _buildAislamiento() {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Aislamiento',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            CheckboxListTile(
              title: const Text('¿Está en Aislamiento?'),
              value: enAislamiento,
              onChanged: (value) {
                setState(() {
                  enAislamiento = value!;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
            if (enAislamiento) ...[
              const Text('Tipo de Aislamiento'),
              DropdownButton<String>(
                value: 'Aislado Respiratorio', // Cambiar según la selección
                onChanged: (String? newValue) {},
                items: <String>['Aislado Respiratorio', 'Aislado por Contacto']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(height: 10),
              const Text('Agente de Aislamiento'),
              TextField(
                controller: agenteAislamientoController,
                decoration: const InputDecoration(
                  hintText: 'Ingrese agente de aislamiento',
                ),
              ),
              const SizedBox(height: 10),
              const Text('Fecha de Inicio de Aislamiento'),
              TextField(
                controller: TextEditingController(
                  text: fechaInicioAislamiento != null
                      ? DateFormat('dd/MM/yyyy').format(fechaInicioAislamiento!)
                      : '',
                ),
                decoration: const InputDecoration(
                  hintText: 'Seleccionar fecha de inicio de aislamiento',
                ),
                onTap: () async {
                  fechaInicioAislamiento = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  setState(() {});
                },
              ),
              const SizedBox(height: 10),
              const Text('Fecha de Fin de Aislamiento'),
              TextField(
                controller: TextEditingController(
                  text: fechaFinAislamiento != null
                      ? DateFormat('dd/MM/yyyy').format(fechaFinAislamiento!)
                      : '',
                ),
                decoration: const InputDecoration(
                  hintText: 'Seleccionar fecha de fin de aislamiento',
                ),
                onTap: () async {
                  fechaFinAislamiento = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  setState(() {});
                },
              ),
            ]
          ],
        ),
      ),
    );
  }
}
