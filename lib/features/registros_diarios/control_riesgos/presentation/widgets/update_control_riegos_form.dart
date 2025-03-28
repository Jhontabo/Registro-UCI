import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '/../../features/registros_diarios/control_riesgos/data/constants/constants.dart';
import '../../../control_riesgos/data/repositories/firabase_control_de_riesgos.dart';
import 'package:registro_uci/features/registros_diarios/control_riesgos/domain/models/control_de_riesgos.dart';

class UpdateControlRiesgosForm extends StatefulWidget {
  final String idIngreso;
  final String idRegistroDiario;
  final ControlDeRiesgos controlDeRiesgos;

  const UpdateControlRiesgosForm({
    super.key,
    required this.idIngreso,
    required this.idRegistroDiario,
    required this.controlDeRiesgos, // Recibimos los datos actuales para mostrar
  });

  @override
  _UpdateControlRiesgosFormState createState() =>
      _UpdateControlRiesgosFormState();
}

class _UpdateControlRiesgosFormState extends State<UpdateControlRiesgosForm> {
  final FirebaseControlDeRiesgosRepository _repositorio =
      FirebaseControlDeRiesgosRepository(); // Instancia el repositorio

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
  void initState() {
    super.initState();

    // Inicializar valores con los datos actuales
    tieneUPP = widget.controlDeRiesgos.tieneUPP;
    uppResuelta = widget.controlDeRiesgos.uppResuelta ?? false;
    enAislamiento = widget.controlDeRiesgos.enAislamiento ?? false;
    usaAnticoagulantes = widget.controlDeRiesgos.usaAnticoagulantes ?? false;

    fechaRegistroUlcera = widget.controlDeRiesgos.fechaRegistroUlcera;
    fechaResolucion = widget.controlDeRiesgos.fechaResolucion;
    fechaInicioAislamiento = widget.controlDeRiesgos.fechaInicioAislamiento;
    fechaFinAislamiento = widget.controlDeRiesgos.fechaFinAislamiento;

    numeroReporteEAController.text =
        widget.controlDeRiesgos.numeroReporteEA ?? '';
    numeroReporteCaidaController.text =
        widget.controlDeRiesgos.numeroReporteCaida ?? '';
    sitioUPPController.text = widget.controlDeRiesgos.sitioUPP ?? '';
    agenteAislamientoController.text =
        widget.controlDeRiesgos.agenteAislamiento ?? '';

    mananaController.text =
        widget.controlDeRiesgos.diasConUlceras?.toString() ?? '';
    tardeController.text =
        widget.controlDeRiesgos.diasDeAislamiento?.toString() ?? '';
    nocheController.text =
        widget.controlDeRiesgos.diasDeAislamiento?.toString() ?? '';
  }

  void _actualizarDatos() async {
    // Verificar si los campos están completos
    if (numeroReporteEAController.text.isEmpty ||
        fechaRegistroUlcera == null ||
        mananaController.text.isEmpty ||
        tardeController.text.isEmpty ||
        nocheController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, complete todos los campos.')),
      );
      return;
    }

    // Crear el objeto con los datos actualizados
    final controlDeRiesgos = ControlDeRiesgos(
      idControlDeRiesgos: widget.controlDeRiesgos.idControlDeRiesgos,
      tieneUPP: tieneUPP,
      fechaRegistroUlcera: fechaRegistroUlcera,
      numeroReporteEA: numeroReporteEAController.text,
      sitioUPP: _selectedSitioUPP,
      uppResuelta: uppResuelta,
      fechaResolucion: fechaResolucion,
      diasConUlceras: int.tryParse(mananaController.text),
      riesgoCaida: 'Alta', // Esto lo puedes cambiar según tu lógica
      numeroReporteCaida: numeroReporteCaidaController.text,
      usaAnticoagulantes: usaAnticoagulantes,
      anticoagulanteSeleccionado:
          'Heparina', // Lo mismo aquí, lo puedes cambiar
      enAislamiento: enAislamiento,
      fechaInicioAislamiento: fechaInicioAislamiento,
      tipoAislamiento: 'Aislado Respiratorio', // Lo mismo aquí
      agenteAislamiento: agenteAislamientoController.text,
      fechaFinAislamiento: fechaFinAislamiento,
      diasDeAislamiento: int.tryParse(tardeController.text),
    );

    try {
      // Llamamos al repositorio para actualizar los datos en Firestore
      await _repositorio.updateControlDeRiesgos(
        widget.idIngreso, // idIngreso de tu widget
        widget.idRegistroDiario, // idRegistroDiario de tu widget
        controlDeRiesgos
            .idControlDeRiesgos, // Debes pasar el idControlDeRiesgos para actualizar el documento específico
        controlDeRiesgos, // El objeto ControlDeRiesgos con los datos a actualizar
      );

      // Si todo es correcto, mostramos un mensaje y regresamos a la pantalla anterior
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Datos actualizados correctamente.')),
      );
      Navigator.pop(context); // Regresa a la pantalla anterior
    } catch (e) {
      // Si ocurre un error, muestra un mensaje de error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al actualizar los datos: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Actualizar Control de Riesgos')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildControlUPP(),
              const SizedBox(height: 20),
              _buildRiesgoDeCaidas(),
              const SizedBox(height: 20),
              _buildAnticoagulantes(),
              const SizedBox(height: 20),
              _buildAislamiento(),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _actualizarDatos,
                child: const Text('Actualizar Control de Riesgos'),
              ),
            ],
          ),
        ),
      ),
    );
  }

// Widget para el Control UPP
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
                    controller: TextEditingController(
                      text: controlUPPManana != null
                          ? controlUPPManana.toString()
                          : '',
                    ),
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
                    controller: TextEditingController(
                      text: controlUPPTarde != null
                          ? controlUPPTarde.toString()
                          : '',
                    ),
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
                    controller: TextEditingController(
                      text: controlUPPNoche != null
                          ? controlUPPNoche.toString()
                          : '',
                    ),
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
                keyboardType: TextInputType.number,
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
                value: _selectedSitioUPP ??
                    SitiosAnatomicosUPP.sitiosCefalicos[0], // Valor por defecto
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedSitioUPP =
                        newValue; // Actualiza el valor seleccionado
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
                    controller: TextEditingController(
                      text: controlCaidaManana != null
                          ? controlCaidaManana.toString()
                          : '',
                    ),
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
                    controller: TextEditingController(
                      text: controlCaidaTarde != null
                          ? controlCaidaTarde.toString()
                          : '',
                    ),
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
                    controller: TextEditingController(
                      text: controlCaidaNoche != null
                          ? controlCaidaNoche.toString()
                          : '',
                    ),
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

  // Aquí van los métodos del formulario como _buildControlUPP, _buildRiesgoDeCaidas, etc.
  // Son los mismos que en el formulario de creación.
}
