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

  // Controladores de los tres horarios
  TextEditingController mananaController = TextEditingController();
  TextEditingController tardeController = TextEditingController();
  TextEditingController nocheController = TextEditingController();

  String? _selectedSitioUPP;
  int? controlUPPManana;
  int? controlUPPTarde;
  int? controlUPPNoche;

  int? controlCaidaManana;
  int? controlCaidaTarde;
  int? controlCaidaNoche;

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Aquí puedes definir lo que deseas hacer cuando presionen el botón flotante
          // En este caso, puede ser que abra un formulario, un nuevo registro, etc.
          print("Botón flotante presionado");
          // Si necesitas mostrar una nueva pantalla o modal:
          // Navigator.push(context, MaterialPageRoute(builder: (context) => NuevaPantalla()));
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }

  // Método para guardar los datos
  void _guardarDatos() {
    // Aquí puedes hacer la lógica para almacenar los datos en una base de datos o realizar la acción deseada
    print('Datos Guardados');
  }

  Widget _buildControlUPP() {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Control UPP en los tres horarios',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Mañana
            Row(
              children: [
                const Text('Mañana'),
                const SizedBox(width: 10),
                SizedBox(
                  width: 80,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        controlUPPManana =
                            value.isNotEmpty ? int.tryParse(value) : 0;
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: '',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Spacer(),
                Icon(
                  controlUPPManana != null && controlUPPManana! > 70
                      ? Icons.check_circle
                      : (controlUPPManana != null && controlUPPManana! > 40)
                          ? Icons.access_time
                          : Icons.error,
                  color: controlUPPManana != null && controlUPPManana! > 70
                      ? Colors.green
                      : (controlUPPManana != null && controlUPPManana! > 40)
                          ? Colors.yellow
                          : Colors.red,
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Tarde
            Row(
              children: [
                const Text('Tarde'),
                const SizedBox(width: 10),
                SizedBox(
                  width: 80,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        controlUPPTarde =
                            value.isNotEmpty ? int.tryParse(value) : 0;
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: '',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Spacer(),
                Icon(
                  controlUPPTarde != null && controlUPPTarde! > 70
                      ? Icons.check_circle
                      : (controlUPPTarde != null && controlUPPTarde! > 40)
                          ? Icons.access_time
                          : Icons.error,
                  color: controlUPPTarde != null && controlUPPTarde! > 70
                      ? Colors.green
                      : (controlUPPTarde != null && controlUPPTarde! > 40)
                          ? Colors.yellow
                          : Colors.red,
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Noche
            Row(
              children: [
                const Text('Noche'),
                const SizedBox(width: 10),
                SizedBox(
                  width: 80,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        controlUPPNoche =
                            value.isNotEmpty ? int.tryParse(value) : 0;
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: '',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Spacer(),
                Icon(
                  controlUPPNoche != null && controlUPPNoche! > 70
                      ? Icons.check_circle
                      : (controlUPPNoche != null && controlUPPNoche! > 40)
                          ? Icons.access_time
                          : Icons.error,
                  color: controlUPPNoche != null && controlUPPNoche! > 70
                      ? Colors.green
                      : (controlUPPNoche != null && controlUPPNoche! > 40)
                          ? Colors.yellow
                          : Colors.red,
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Control UPP
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
              // Fecha en la que se encontró la UPP (valor predeterminado = fecha actual)
              const Text('Fecha en la que se encontró la UPP'),
              TextField(
                controller: TextEditingController(
                  text: fechaRegistroUlcera != null
                      ? DateFormat('dd/MM/yyyy').format(fechaRegistroUlcera!)
                      : DateFormat('dd/MM/yyyy').format(DateTime
                          .now()), // Fecha actual si no se ha seleccionado
                ),
                decoration: const InputDecoration(
                  hintText: 'Seleccionar fecha de la UPP',
                ),
                onTap: () async {
                  fechaRegistroUlcera = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  setState(() {});
                },
              ),
              const SizedBox(height: 10),
              const Text('Número de Reporte EA'),
              TextField(
                controller: numeroReporteEAController,
                keyboardType:
                    TextInputType.number, // Esto restringe la entrada a números
                decoration: const InputDecoration(
                  hintText: 'Ingrese reporte EA',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text('Sitio de UPP'),
              DropdownButtonFormField<String>(
                hint: const Text("Sitio anatómico"),
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
  // Widget para Riesgo de Caídas
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
              'Riesgo de Caída en tres horarios:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Mañana
            Row(
              children: [
                const Text('Mañana'),
                const SizedBox(width: 10),
                SizedBox(
                  width: 80,
                  child: TextField(
                    controller: mananaController,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        controlCaidaManana =
                            value.isNotEmpty ? int.tryParse(value) : 0;
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: '',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Spacer(),
                Icon(
                  controlCaidaManana != null && controlCaidaManana! > 70
                      ? Icons.check_circle
                      : Icons.error,
                  color: controlCaidaManana != null && controlCaidaManana! > 70
                      ? Colors.green
                      : Colors.red,
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Tarde
            Row(
              children: [
                const Text('Tarde'),
                const SizedBox(width: 10),
                SizedBox(
                  width: 80,
                  child: TextField(
                    controller: tardeController,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        controlCaidaTarde =
                            value.isNotEmpty ? int.tryParse(value) : 0;
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: '',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Spacer(),
                Icon(
                  controlCaidaTarde != null && controlCaidaTarde! > 70
                      ? Icons.check_circle
                      : Icons.error,
                  color: controlCaidaTarde != null && controlCaidaTarde! > 70
                      ? Colors.green
                      : Colors.red,
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Noche
            Row(
              children: [
                const Text('Noche'),
                const SizedBox(width: 10),
                SizedBox(
                  width: 80,
                  child: TextField(
                    controller: nocheController,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        controlCaidaNoche =
                            value.isNotEmpty ? int.tryParse(value) : 0;
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: '',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Spacer(),
                Icon(
                  controlCaidaNoche != null && controlCaidaNoche! > 70
                      ? Icons.check_circle
                      : Icons.error,
                  color: controlCaidaNoche != null && controlCaidaNoche! > 70
                      ? Colors.green
                      : Colors.red,
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Pregunta si hay evento adverso relacionado a caídas
            CheckboxListTile(
              title: const Text('¿Evento Adverso relacionado a Caídas?'),
              value: tieneEventoAdversoCaida, // Variable de estado
              onChanged: (value) {
                setState(() {
                  tieneEventoAdversoCaida = value!;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),

            if (tieneEventoAdversoCaida) ...[
              const SizedBox(height: 10),
              const Text('Número de Reporte Caída'),
              TextField(
                controller: numeroReporteCaidaController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Ingrese numero reporte de caída',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                  ),
                ),
              ),
            ],
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
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text('Fecha de Inicio de Aislamiento'),
              TextField(
                controller: TextEditingController(
                  text: fechaInicioAislamiento != null
                      ? DateFormat('dd/MM/yyyy').format(fechaInicioAislamiento!)
                      : DateFormat('dd/MM/yyyy')
                          .format(DateTime.now()), // Fecha actual
                ),
                decoration: const InputDecoration(
                  hintText: 'Inicio de aislamiento',
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
                  hintText: 'Fin de aislamiento',
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
