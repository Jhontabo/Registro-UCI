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
    required this.controlDeRiesgos,
  });

  @override
  _UpdateControlRiesgosFormState createState() =>
      _UpdateControlRiesgosFormState();
}

class _UpdateControlRiesgosFormState extends State<UpdateControlRiesgosForm> {
  final FirebaseControlDeRiesgosRepository _repositorio =
      FirebaseControlDeRiesgosRepository();

  bool tieneUPP = false;
  bool uppResuelta = false;
  bool enAislamiento = false;
  bool usaAnticoagulantes = false;
  bool tieneEventoAdversoCaida = false;

  DateTime? fechaRegistroUlcera;
  DateTime? fechaResolucion;
  DateTime? fechaInicioAislamiento;
  DateTime? fechaFinAislamiento;
  DateTime? fechaRegistro;

  TextEditingController numeroReporteEAController = TextEditingController();
  TextEditingController numeroReporteCaidaController = TextEditingController();
  TextEditingController agenteAislamientoController = TextEditingController();
  TextEditingController fechaRegistroController = TextEditingController();

  // Controladores para UPP
  TextEditingController uppMananaController = TextEditingController();
  TextEditingController uppTardeController = TextEditingController();
  TextEditingController uppNocheController = TextEditingController();

  // Controladores para Caídas
  TextEditingController caidaMananaController = TextEditingController();
  TextEditingController caidaTardeController = TextEditingController();
  TextEditingController caidaNocheController = TextEditingController();

  String? _selectedSitioUPP;
  String? _selectedAnticoagulante = 'Heparina';
  String? _selectedTipoAislamiento = 'Aislado Respiratorio';

  @override
  void initState() {
    super.initState();

    // Crear lista completa de sitios para validación
    final todosSitios = [
      ...SitiosAnatomicosUPP.sitiosCefalicos,
      ...SitiosAnatomicosUPP.sitiosExtremidadesSuperiores,
      ...SitiosAnatomicosUPP.sitiosTronco,
      ...SitiosAnatomicosUPP.sitiosExtremidadesInferiores,
    ];

    // Inicializar valores con los datos actuales
    tieneUPP = widget.controlDeRiesgos.tieneUPP;
    uppResuelta = widget.controlDeRiesgos.uppResuelta ?? false;
    enAislamiento = widget.controlDeRiesgos.enAislamiento ?? false;
    usaAnticoagulantes = widget.controlDeRiesgos.usaAnticoagulantes ?? false;
    tieneEventoAdversoCaida =
        widget.controlDeRiesgos.numeroReporteCaida != null;

    fechaRegistroUlcera = widget.controlDeRiesgos.fechaRegistroUlcera;
    fechaResolucion = widget.controlDeRiesgos.fechaResolucion;
    fechaInicioAislamiento = widget.controlDeRiesgos.fechaInicioAislamiento;
    fechaFinAislamiento = widget.controlDeRiesgos.fechaFinAislamiento;
    fechaRegistro = widget.controlDeRiesgos.fechaRegistro;

    numeroReporteEAController.text =
        widget.controlDeRiesgos.numeroReporteEA ?? '';
    numeroReporteCaidaController.text =
        widget.controlDeRiesgos.numeroReporteCaida ?? '';
    agenteAislamientoController.text =
        widget.controlDeRiesgos.agenteAislamiento ?? '';

    // Validar que el sitio UPP exista en las opciones
    _selectedSitioUPP = widget.controlDeRiesgos.sitioUPP != null &&
            todosSitios.contains(widget.controlDeRiesgos.sitioUPP)
        ? widget.controlDeRiesgos.sitioUPP
        : null;

    _selectedAnticoagulante =
        widget.controlDeRiesgos.anticoagulanteSeleccionado ?? 'Heparina';
    _selectedTipoAislamiento =
        widget.controlDeRiesgos.tipoAislamiento ?? 'Aislado Respiratorio';

    // Inicializar controladores numéricos
    uppMananaController.text =
        widget.controlDeRiesgos.controlUPPManana?.toString() ?? '0';
    uppTardeController.text =
        widget.controlDeRiesgos.controlUPPTarde?.toString() ?? '0';
    uppNocheController.text =
        widget.controlDeRiesgos.controlUPPNoche?.toString() ?? '0';

    caidaMananaController.text =
        widget.controlDeRiesgos.controlCaidaManana?.toString() ?? '0';
    caidaTardeController.text =
        widget.controlDeRiesgos.controlCaidaTarde?.toString() ?? '0';
    caidaNocheController.text =
        widget.controlDeRiesgos.controlCaidaNoche?.toString() ?? '0';

    if (fechaRegistro != null) {
      fechaRegistroController.text =
          DateFormat('dd/MM/yyyy').format(fechaRegistro!);
    }
  }

  @override
  void dispose() {
    // Liberar todos los controladores
    uppMananaController.dispose();
    uppTardeController.dispose();
    uppNocheController.dispose();
    caidaMananaController.dispose();
    caidaTardeController.dispose();
    caidaNocheController.dispose();
    numeroReporteEAController.dispose();
    numeroReporteCaidaController.dispose();
    agenteAislamientoController.dispose();
    fechaRegistroController.dispose();
    super.dispose();
  }

  void _actualizarDatos() async {
    // Validación de campos obligatorios
    if (fechaRegistro == null ||
        uppMananaController.text.isEmpty ||
        uppTardeController.text.isEmpty ||
        uppNocheController.text.isEmpty ||
        caidaMananaController.text.isEmpty ||
        caidaTardeController.text.isEmpty ||
        caidaNocheController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content:
                Text('Por favor, complete todos los campos obligatorios.')),
      );
      return;
    }

    // Validación adicional si tiene UPP
    if (tieneUPP &&
        (fechaRegistroUlcera == null ||
            numeroReporteEAController.text.isEmpty ||
            _selectedSitioUPP == null)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content:
                Text('Por favor, complete los campos requeridos para UPP.')),
      );
      return;
    }

    // Validación adicional si UPP está resuelta
    if (tieneUPP && uppResuelta && fechaResolucion == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Por favor, ingrese la fecha de resolución de UPP.')),
      );
      return;
    }

    // Validación adicional si tiene evento adverso de caída
    if (tieneEventoAdversoCaida && numeroReporteCaidaController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Por favor, ingrese el número de reporte de caída.')),
      );
      return;
    }

    // Validación adicional si está en aislamiento
    if (enAislamiento &&
        (fechaInicioAislamiento == null ||
            _selectedTipoAislamiento == null ||
            agenteAislamientoController.text.isEmpty)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
                'Por favor, complete los campos requeridos para aislamiento.')),
      );
      return;
    }

    // Crear el objeto con los datos actualizados
    final controlDeRiesgos = ControlDeRiesgos(
      idControlDeRiesgos: widget.controlDeRiesgos.idControlDeRiesgos,
      tieneUPP: tieneUPP,
      fechaRegistroUlcera: tieneUPP ? fechaRegistroUlcera : null,
      numeroReporteEA: tieneUPP ? numeroReporteEAController.text : null,
      sitioUPP: tieneUPP ? _selectedSitioUPP : null,
      uppResuelta: tieneUPP ? uppResuelta : false,
      fechaResolucion: (tieneUPP && uppResuelta) ? fechaResolucion : null,
      diasConUlceras: int.tryParse(uppMananaController.text),
      riesgoCaida: _calcularRiesgoCaida(),
      numeroReporteCaida:
          tieneEventoAdversoCaida ? numeroReporteCaidaController.text : null,
      usaAnticoagulantes: usaAnticoagulantes,
      anticoagulanteSeleccionado:
          usaAnticoagulantes ? _selectedAnticoagulante : null,
      enAislamiento: enAislamiento,
      fechaInicioAislamiento: enAislamiento ? fechaInicioAislamiento : null,
      tipoAislamiento: enAislamiento ? _selectedTipoAislamiento : null,
      agenteAislamiento:
          enAislamiento ? agenteAislamientoController.text : null,
      fechaFinAislamiento: enAislamiento ? fechaFinAislamiento : null,
      diasDeAislamiento: int.tryParse(caidaTardeController.text),
      fechaRegistro: fechaRegistro,
      controlUPPManana: int.tryParse(uppMananaController.text),
      controlUPPTarde: int.tryParse(uppTardeController.text),
      controlUPPNoche: int.tryParse(uppNocheController.text),
      controlCaidaManana: int.tryParse(caidaMananaController.text),
      controlCaidaTarde: int.tryParse(caidaTardeController.text),
      controlCaidaNoche: int.tryParse(caidaNocheController.text),
    );

    try {
      await _repositorio.updateControlDeRiesgos(
        widget.idIngreso,
        widget.idRegistroDiario,
        controlDeRiesgos.idControlDeRiesgos,
        controlDeRiesgos,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Datos actualizados correctamente.')),
      );
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al actualizar los datos: $e')),
      );
    }
  }

  String _calcularRiesgoCaida() {
    final manana = int.tryParse(caidaMananaController.text) ?? 0;
    final tarde = int.tryParse(caidaTardeController.text) ?? 0;
    final noche = int.tryParse(caidaNocheController.text) ?? 0;

    final promedio = (manana + tarde + noche) / 3;

    if (promedio > 70) return 'Bajo';
    if (promedio > 40) return 'Moderado';
    return 'Alto';
  }

  Widget _buildCampoNumerico({
    required String label,
    required TextEditingController controller,
    required int? valor,
    bool esUPP = true,
  }) {
    return Row(
      children: [
        Text(label),
        const SizedBox(width: 10),
        SizedBox(
          width: 80,
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {});
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
        if (esUPP)
          Icon(
            valor != null && valor > 70
                ? Icons.check_circle
                : (valor != null && valor > 40)
                    ? Icons.access_time
                    : Icons.error,
            color: valor != null && valor > 70
                ? Colors.green
                : (valor != null && valor > 40)
                    ? Colors.yellow
                    : Colors.red,
          )
        else
          Icon(
            valor != null && valor > 70 ? Icons.check_circle : Icons.error,
            color: valor != null && valor > 70 ? Colors.green : Colors.red,
          ),
      ],
    );
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
              // Fecha de registro
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Fecha de Registro',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        controller: fechaRegistroController,
                        readOnly: true,
                        decoration: const InputDecoration(
                          hintText: 'Seleccione la fecha de registro',
                          suffixIcon: Icon(Icons.calendar_today),
                        ),
                        onTap: () async {
                          final selectedDate = await showDatePicker(
                            context: context,
                            initialDate: fechaRegistro ?? DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                          );
                          if (selectedDate != null) {
                            setState(() {
                              fechaRegistro = selectedDate;
                              fechaRegistroController.text =
                                  DateFormat('dd/MM/yyyy').format(selectedDate);
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Formulario de UPP
              _buildControlUPP(),
              const SizedBox(height: 20),

              // Formulario de Caídas
              _buildRiesgoDeCaidas(),
              const SizedBox(height: 20),

              // Otras secciones
              _buildAnticoagulantes(),
              const SizedBox(height: 20),
              _buildAislamiento(),
              const SizedBox(height: 20),

              // Botón de actualizar
              Center(
                child: ElevatedButton(
                  onPressed: _actualizarDatos,
                  child: const Text('Actualizar Control de Riesgos'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildControlUPP() {
    // Crear lista completa de sitios para validación
    final todosSitios = [
      ...SitiosAnatomicosUPP.sitiosCefalicos,
      ...SitiosAnatomicosUPP.sitiosExtremidadesSuperiores,
      ...SitiosAnatomicosUPP.sitiosTronco,
      ...SitiosAnatomicosUPP.sitiosExtremidadesInferiores,
    ];

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
            const SizedBox(height: 10),

            // Campos numéricos para UPP
            const Text(
              'Valores UPP en tres horarios:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            _buildCampoNumerico(
              label: 'Mañana',
              controller: uppMananaController,
              valor: int.tryParse(uppMananaController.text),
            ),
            const SizedBox(height: 10),

            _buildCampoNumerico(
              label: 'Tarde',
              controller: uppTardeController,
              valor: int.tryParse(uppTardeController.text),
            ),
            const SizedBox(height: 10),

            _buildCampoNumerico(
              label: 'Noche',
              controller: uppNocheController,
              valor: int.tryParse(uppNocheController.text),
            ),
            const SizedBox(height: 20),

            // Resto del formulario UPP
            CheckboxListTile(
              title: const Text('¿Tiene UPP?'),
              value: tieneUPP,
              onChanged: (value) {
                setState(() {
                  tieneUPP = value!;
                  if (!tieneUPP) {
                    _selectedSitioUPP = null;
                  }
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),

            if (tieneUPP) ...[
              const Text('Fecha en la que se encontró la UPP'),
              TextField(
                controller: TextEditingController(
                  text: fechaRegistroUlcera != null
                      ? DateFormat('dd/MM/yyyy').format(fechaRegistroUlcera!)
                      : '',
                ),
                decoration: const InputDecoration(
                  hintText: 'Seleccionar fecha de la UPP',
                ),
                onTap: () async {
                  final selectedDate = await showDatePicker(
                    context: context,
                    initialDate: fechaRegistroUlcera ?? DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (selectedDate != null) {
                    setState(() {
                      fechaRegistroUlcera = selectedDate;
                    });
                  }
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
                value: _selectedSitioUPP,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedSitioUPP = newValue;
                  });
                },
                validator: (value) {
                  if (tieneUPP && value == null) {
                    return 'Por favor seleccione un sitio';
                  }
                  return null;
                },
                items:
                    todosSitios.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(
                  errorText: tieneUPP && _selectedSitioUPP == null
                      ? 'Debe seleccionar un sitio'
                      : null,
                ),
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
                    final selectedDate = await showDatePicker(
                      context: context,
                      initialDate: fechaResolucion ?? DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );
                    if (selectedDate != null) {
                      setState(() {
                        fechaResolucion = selectedDate;
                      });
                    }
                  },
                ),
              ]
            ]
          ],
        ),
      ),
    );
  }

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
            const SizedBox(height: 10),

            // Campos numéricos para Caídas
            const Text(
              'Valores de Caída en tres horarios:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            _buildCampoNumerico(
              label: 'Mañana',
              controller: caidaMananaController,
              valor: int.tryParse(caidaMananaController.text),
              esUPP: false,
            ),
            const SizedBox(height: 10),

            _buildCampoNumerico(
              label: 'Tarde',
              controller: caidaTardeController,
              valor: int.tryParse(caidaTardeController.text),
              esUPP: false,
            ),
            const SizedBox(height: 10),

            _buildCampoNumerico(
              label: 'Noche',
              controller: caidaNocheController,
              valor: int.tryParse(caidaNocheController.text),
              esUPP: false,
            ),
            const SizedBox(height: 20),

            // Resto del formulario de Caídas
            CheckboxListTile(
              title: const Text('¿Evento Adverso relacionado a Caídas?'),
              value: tieneEventoAdversoCaida,
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
              const SizedBox(height: 10),
              const Text('Anticoagulante Seleccionado'),
              DropdownButton<String>(
                value: _selectedAnticoagulante,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedAnticoagulante = newValue;
                  });
                },
                items: <String>['Heparina', 'Warfarina', 'Apixabán']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }

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
              const SizedBox(height: 10),
              const Text('Tipo de Aislamiento'),
              DropdownButton<String>(
                value: _selectedTipoAislamiento,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedTipoAislamiento = newValue;
                  });
                },
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
                      : '',
                ),
                decoration: const InputDecoration(
                  hintText: 'Inicio de aislamiento',
                ),
                onTap: () async {
                  final selectedDate = await showDatePicker(
                    context: context,
                    initialDate: fechaInicioAislamiento ?? DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (selectedDate != null) {
                    setState(() {
                      fechaInicioAislamiento = selectedDate;
                    });
                  }
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
                  final selectedDate = await showDatePicker(
                    context: context,
                    initialDate: fechaFinAislamiento ?? DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (selectedDate != null) {
                    setState(() {
                      fechaFinAislamiento = selectedDate;
                    });
                  }
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}
