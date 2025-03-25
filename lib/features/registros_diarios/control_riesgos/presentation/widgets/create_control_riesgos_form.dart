import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ControlDeRiesgosForm extends StatefulWidget {
  const ControlDeRiesgosForm({super.key});

  @override
  _ControlDeRiesgosFormState createState() => _ControlDeRiesgosFormState();
}

class _ControlDeRiesgosFormState extends State<ControlDeRiesgosForm> {
  // Controladores para los campos de texto
  final TextEditingController _numeroReporteEAController =
      TextEditingController();
  final TextEditingController _sitioUPPController = TextEditingController();
  final TextEditingController _diasConUlcerasController =
      TextEditingController();
  final TextEditingController _numeroReporteCaidaController =
      TextEditingController();
  final TextEditingController _agenteAislamientoController =
      TextEditingController();

  // Variables de estado para los switches
  bool _tieneUPP = false;
  bool _uppResuelta = false;
  bool _eventoCaida = false;
  bool _usaAnticoagulantes = false;
  bool _enAislamiento = false;

  // Variables de estado para las fechas
  DateTime? _fechaRegistroUlcera;
  DateTime? _fechaResolucion;
  DateTime? _fechaInicioAislamiento;
  DateTime? _fechaFinAislamiento;

  // Lista de sitios de UPP y anticoagulantes
  final List<String> _sitiosUPP = ['Brazo', 'Pierna', 'Espalda', 'Glúteo'];
  final List<String> _anticoagulantes = [
    'Heparina',
    'Warfarina',
    'Dabigatrán',
    'Rivaroxabán'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Control de Riesgos")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Control de UPP
              SwitchListTile(
                title: const Text("¿Tiene UPP?"),
                value: _tieneUPP,
                onChanged: (bool value) {
                  setState(() {
                    _tieneUPP = value;
                  });
                },
              ),
              if (_tieneUPP) ...[
                TextFormField(
                  controller: _numeroReporteEAController,
                  decoration:
                      const InputDecoration(labelText: "Número de Reporte EA"),
                ),
                DropdownButtonFormField<String>(
                  value: _sitioUPPController.text.isEmpty
                      ? null
                      : _sitioUPPController.text,
                  items: _sitiosUPP.map((String sitio) {
                    return DropdownMenuItem<String>(
                      value: sitio,
                      child: Text(sitio),
                    );
                  }).toList(),
                  decoration: const InputDecoration(labelText: "Sitio de UPP"),
                  onChanged: (String? value) {
                    setState(() {
                      _sitioUPPController.text = value ?? '';
                    });
                  },
                ),
                SwitchListTile(
                  title: const Text("¿UPP Resuelta?"),
                  value: _uppResuelta,
                  onChanged: (bool value) {
                    setState(() {
                      _uppResuelta = value;
                    });
                  },
                ),
                if (_uppResuelta) ...[
                  TextFormField(
                    controller: _diasConUlcerasController,
                    decoration:
                        const InputDecoration(labelText: "Días con úlceras"),
                    keyboardType: TextInputType.number,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final DateTime? fecha = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      if (fecha != null && fecha != _fechaResolucion) {
                        setState(() {
                          _fechaResolucion = fecha;
                        });
                      }
                    },
                    child: Text(_fechaResolucion == null
                        ? "Seleccionar fecha de resolución"
                        : "Fecha de resolución: ${DateFormat('dd/MM/yyyy').format(_fechaResolucion!)}"),
                  ),
                ]
              ],

              // Escala de Caída
              SwitchListTile(
                title: const Text("¿Evento adverso relacionado a caídas?"),
                value: _eventoCaida,
                onChanged: (bool value) {
                  setState(() {
                    _eventoCaida = value;
                  });
                },
              ),
              if (_eventoCaida) ...[
                TextFormField(
                  controller: _numeroReporteCaidaController,
                  decoration: const InputDecoration(
                      labelText: "Número de Reporte Caída"),
                ),
              ],

              // Anticoagulación
              SwitchListTile(
                title: const Text("¿Usa Anticoagulantes?"),
                value: _usaAnticoagulantes,
                onChanged: (bool value) {
                  setState(() {
                    _usaAnticoagulantes = value;
                  });
                },
              ),
              if (_usaAnticoagulantes) ...[
                DropdownButtonFormField<String>(
                  value: _sitioUPPController.text.isEmpty
                      ? null
                      : _sitioUPPController.text,
                  items: _anticoagulantes.map((String anticoagulante) {
                    return DropdownMenuItem<String>(
                      value: anticoagulante,
                      child: Text(anticoagulante),
                    );
                  }).toList(),
                  decoration: const InputDecoration(
                      labelText: "Anticoagulante Seleccionado"),
                  onChanged: (String? value) {
                    setState(() {
                      _sitioUPPController.text = value ?? '';
                    });
                  },
                ),
              ],

              // Aislamiento
              SwitchListTile(
                title: const Text("¿Está en Aislamiento?"),
                value: _enAislamiento,
                onChanged: (bool value) {
                  setState(() {
                    _enAislamiento = value;
                  });
                },
              ),
              if (_enAislamiento) ...[
                ElevatedButton(
                  onPressed: () async {
                    final DateTime? fecha = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );
                    if (fecha != null && fecha != _fechaInicioAislamiento) {
                      setState(() {
                        _fechaInicioAislamiento = fecha;
                      });
                    }
                  },
                  child: Text(_fechaInicioAislamiento == null
                      ? "Seleccionar fecha de inicio de aislamiento"
                      : "Fecha de inicio: ${DateFormat('dd/MM/yyyy').format(_fechaInicioAislamiento!)}"),
                ),
                TextFormField(
                  controller: _agenteAislamientoController,
                  decoration:
                      const InputDecoration(labelText: "Agente de aislamiento"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final DateTime? fecha = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );
                    if (fecha != null && fecha != _fechaFinAislamiento) {
                      setState(() {
                        _fechaFinAislamiento = fecha;
                      });
                    }
                  },
                  child: Text(_fechaFinAislamiento == null
                      ? "Seleccionar fecha de finalización"
                      : "Fecha de finalización: ${DateFormat('dd/MM/yyyy').format(_fechaFinAislamiento!)}"),
                ),
                TextFormField(
                  controller: TextEditingController(),
                  decoration: const InputDecoration(
                      labelText: "Conteo de días de aislamiento"),
                  keyboardType: TextInputType.number,
                ),
              ],

              // Botón de guardar
              ElevatedButton(
                onPressed: () {
                  // Lógica para guardar el registro
                },
                child: const Text("Guardar Control de Riesgos"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
