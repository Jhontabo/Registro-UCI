import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import '../../data/constants/constants.dart';
import '../../data/repositories/firabase_control_de_riesgos.dart';
import 'package:registro_uci/features/control_riesgos/domain/models/control_de_riesgos.dart';

class CreateControlRiesgosForm extends StatefulWidget {
  final String idIngreso;
  final String idRegistroDiario;

  const CreateControlRiesgosForm({
    super.key,
    required this.idIngreso,
    required this.idRegistroDiario,
  });

  @override
  _CreateControlRiesgosFormState createState() =>
      _CreateControlRiesgosFormState();
}

class _CreateControlRiesgosFormState extends State<CreateControlRiesgosForm> {
  final FirebaseControlDeRiesgosRepository _repositorio =
      FirebaseControlDeRiesgosRepository();

  // Estados y controladores comunes
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

  int? _diasAislamientoCalculados;
  // Controladores para campos compartidos
  TextEditingController numeroReporteEAController = TextEditingController();
  TextEditingController numeroReporteCaidaController = TextEditingController();
  TextEditingController agenteAislamientoController = TextEditingController();
  TextEditingController fechaRegistroController = TextEditingController();

  // Controladores para UPP (independientes)
  TextEditingController uppMananaController = TextEditingController();
  TextEditingController uppTardeController = TextEditingController();
  TextEditingController uppNocheController = TextEditingController();

  // Controladores para Caídas (independientes)
  TextEditingController caidaMananaController = TextEditingController();
  TextEditingController caidaTardeController = TextEditingController();
  TextEditingController caidaNocheController = TextEditingController();

  String? _selectedSitioUPP;
  String? _selectedAnticoagulante = 'Heparina';
  String? _selectedTipoAislamiento = 'Aislado Respiratorio';

  @override
  void initState() {
    super.initState();
    // Inicializar controladores con valores por defecto
    uppMananaController.text = '0';
    uppTardeController.text = '0';
    uppNocheController.text = '0';
    caidaMananaController.text = '0';
    caidaTardeController.text = '0';
    caidaNocheController.text = '0';
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

  void _guardarDatos() async {
    if (fechaRegistro == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Complete todos los campos obligatorios'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    final controlDeRiesgos = ControlDeRiesgos(
      idControlDeRiesgos: '',
      tieneUPP: tieneUPP,
      fechaRegistroUlcera: tieneUPP ? fechaRegistroUlcera : null,
      numeroReporteEA: tieneUPP && numeroReporteEAController.text.isNotEmpty
          ? numeroReporteEAController.text
          : null,
      sitioUPP: tieneUPP ? (_selectedSitioUPP ?? "No especificado") : null,
      uppResuelta: tieneUPP ? uppResuelta : false,
      fechaResolucion: (tieneUPP && uppResuelta) ? fechaResolucion : null,
      diasConUlceras: int.tryParse(uppMananaController.text),
      riesgoCaida: _calcularRiesgoCaida(),
      riesgoUPP: _calcularRiesgoCaida(),
      numeroReporteCaida: tieneEventoAdversoCaida &&
              numeroReporteCaidaController.text.isNotEmpty
          ? numeroReporteCaidaController.text
          : null,
      usaAnticoagulantes: usaAnticoagulantes,
      anticoagulanteSeleccionado:
          usaAnticoagulantes ? _selectedAnticoagulante : null,
      enAislamiento: enAislamiento,
      fechaInicioAislamiento: enAislamiento ? fechaInicioAislamiento : null,
      tipoAislamiento: enAislamiento ? _selectedTipoAislamiento : null,
      agenteAislamiento:
          enAislamiento && agenteAislamientoController.text.isNotEmpty
              ? agenteAislamientoController.text
              : null,
      fechaFinAislamiento: enAislamiento ? fechaFinAislamiento : null,
      diasDeAislamiento: enAislamiento && fechaInicioAislamiento != null
          ? _diasAislamientoCalculados
          : null,
      fechaRegistro: fechaRegistro,
      controlUPPManana: int.tryParse(uppMananaController.text),
      controlUPPTarde: int.tryParse(uppTardeController.text),
      controlUPPNoche: int.tryParse(uppNocheController.text),
      controlCaidaManana: int.tryParse(caidaMananaController.text),
      controlCaidaTarde: int.tryParse(caidaTardeController.text),
      controlCaidaNoche: int.tryParse(caidaNocheController.text),
    );

    try {
      await _repositorio.addControlDeRiesgos(
        widget.idIngreso,
        widget.idRegistroDiario,
        controlDeRiesgos,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Datos guardados correctamente')),
      );
      Navigator.pop(context);
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('Error: $e');
        print('Stack trace: $stackTrace');
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Error al guardar los datos'),
          action: SnackBarAction(
            label: 'Detalles',
            onPressed: () => _mostrarErrorDialog(context, e.toString()),
          ),
        ),
      );
    }
  }

  String _calcularRiesgoUPP() {
    final manana = int.tryParse(uppMananaController.text) ?? 0;
    final tarde = int.tryParse(uppTardeController.text) ?? 0;
    final noche = int.tryParse(uppNocheController.text) ?? 0;

    final promedio = (manana + tarde + noche) / 3;

    // Comprobamos el promedio según los rangos definidos
    if (promedio < 12) {
      return 'Alto'; // Riesgo alto
    } else if (promedio >= 13 && promedio <= 14) {
      return 'Medio'; // Riesgo medio
    } else {
      return 'Bajo'; // Riesgo bajo
    }
  }

  String _calcularRiesgoCaida() {
    final manana = int.tryParse(caidaMananaController.text) ?? 0;
    final tarde = int.tryParse(caidaTardeController.text) ?? 0;
    final noche = int.tryParse(caidaNocheController.text) ?? 0;

    final promedio = (manana + tarde + noche) / 3;

    if (promedio <= 2) return 'Bajo';
    return 'Alto';
  }

  void _calcularDiasAislamiento() {
    if (fechaInicioAislamiento != null) {
      final fechaReferencia = fechaFinAislamiento ?? DateTime.now();
      setState(() {
        _diasAislamientoCalculados =
            fechaReferencia.difference(fechaInicioAislamiento!).inDays + 1;
      });
    }
  }

  Widget _buildCampoNumerico({
    required String label,
    required TextEditingController controller,
    required ValueChanged<int?> onChanged,
    required int? valor,
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
              final intValue = value.isNotEmpty ? int.tryParse(value) : 0;
              onChanged(intValue);
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
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Fecha de registro común
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Fecha de Creación del Registro',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        controller: fechaRegistroController,
                        readOnly: true,
                        decoration: const InputDecoration(
                          hintText: 'Seleccione la fecha de creación',
                          suffixIcon: Icon(Icons.calendar_today),
                        ),
                        onTap: () async {
                          fechaRegistro = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                          );
                          if (fechaRegistro != null) {
                            setState(() {
                              fechaRegistroController.text =
                                  DateFormat('dd/MM/yyyy')
                                      .format(fechaRegistro!);
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

              // Botón de guardar
              Center(
                child: ElevatedButton(
                  onPressed: _guardarDatos,
                  child: const Text('Guardar Control de Riesgos'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
              onChanged: (value) => setState(() {}),
              valor: int.tryParse(uppMananaController.text),
            ),
            const SizedBox(height: 10),

            _buildCampoNumerico(
              label: 'Tarde',
              controller: uppTardeController,
              onChanged: (value) => setState(() {}),
              valor: int.tryParse(uppTardeController.text),
            ),
            const SizedBox(height: 10),

            _buildCampoNumerico(
              label: 'Noche',
              controller: uppNocheController,
              onChanged: (value) => setState(() {}),
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
                      : DateFormat('dd/MM/yyyy').format(DateTime.now()),
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
                initialValue:
                    _selectedSitioUPP ?? SitiosAnatomicosUPP.sitiosCefalicos[0],
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedSitioUPP = newValue;
                  });
                },
                isExpanded: true,
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
              onChanged: (value) => setState(() {}),
              valor: int.tryParse(caidaMananaController.text),
            ),
            const SizedBox(height: 10),

            _buildCampoNumerico(
              label: 'Tarde',
              controller: caidaTardeController,
              onChanged: (value) => setState(() {}),
              valor: int.tryParse(caidaTardeController.text),
            ),
            const SizedBox(height: 10),

            _buildCampoNumerico(
              label: 'Noche',
              controller: caidaNocheController,
              onChanged: (value) => setState(() {}),
              valor: int.tryParse(caidaNocheController.text),
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
                  if (!enAislamiento) {
                    fechaInicioAislamiento = null;
                    fechaFinAislamiento = null;
                    _diasAislamientoCalculados = null;
                  }
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
                items: <String>[
                  'Aislado Respiratorio',
                  'Aislado por Contacto',
                  'Asilamiento por gotas'
                ].map<DropdownMenuItem<String>>((String value) {
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
                      : DateFormat('dd/MM/yyyy').format(DateTime.now()),
                ),
                decoration: const InputDecoration(
                  hintText: 'Inicio de aislamiento',
                ),
                onTap: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: fechaInicioAislamiento ?? DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (picked != null) {
                    setState(() {
                      fechaInicioAislamiento =
                          picked; // CORRECCIÓN: Asignar a fechaInicio
                      _calcularDiasAislamiento();
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
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: fechaFinAislamiento ??
                        (fechaInicioAislamiento ?? DateTime.now()),
                    firstDate: fechaInicioAislamiento ?? DateTime.now(),
                    lastDate: DateTime(2101),
                  );
                  if (picked != null) {
                    setState(() {
                      fechaFinAislamiento = picked;
                      _calcularDiasAislamiento();
                    });
                  }
                },
              ),
              // MOSTRAR DÍAS CALCULADOS - AÑADIR ESTE BLOQUE
              if (fechaInicioAislamiento != null) ...[
                const SizedBox(height: 10),
                Text(
                  'Días de aislamiento: ${_diasAislamientoCalculados ?? "Calculando..."}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ],
          ],
        ),
      ),
    );
  }

  void _mostrarErrorDialog(BuildContext context, String error) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Error'),
        content: Text(error),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
