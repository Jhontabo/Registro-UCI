import 'package:flutter/material.dart';
import 'package:registro_uci/common/components/form_fields/date_form_field.dart';
import 'package:registro_uci/common/components/form_fields/dropdown_button_form_field.dart';
import 'package:registro_uci/common/components/form_fields/hour_form_field.dart';
import 'package:registro_uci/common/components/form_fields/text_form_field.dart';
import 'package:registro_uci/common/utils/date_picker.dart';
import 'package:registro_uci/common/utils/time_picker.dart';
import 'package:registro_uci/common/validators/default_validator.dart';
import 'package:registro_uci/features/antibioticos/presentation/widgets/components/buttons/create_tratamiento_antibiotico_form_button.dart';

const antibioticos = [
  'Amoxicilina',
  'Ceftriaxona',
  'Azitromicina',
  'Doxiciclina',
  'Ciprofloxacino',
  'Clindamicina',
  'Eritromicina',
  'Levofloxacino',
  'Metronidazol',
  'Vancomicina',
  'Tetraciclina',
  'Gentamicina',
  'Cefalexina',
  'Amikacina',
  'Penicilina',
  'Piperacilina',
  'Sulbactam',
  'Tobramicina',
  'Imipenem',
  'Meropenem',
];

const frecuenciaEn24hOptions = {
  1: 'cada 24 horas (1 al día)',
  2: 'cada 12 horas (2 al día)',
  3: 'cada 8 horas (3 al día)',
  4: 'cada 6 horas (4 al día)',
  6: 'cada 4 horas (6 al día)',
  8: 'cada 3 horas (8 al día)',
  12: 'cada 2 horas (12 al día)',
  24: 'cada hora',
};

class CreateTratamientoAntibioticoForm extends StatefulWidget {
  const CreateTratamientoAntibioticoForm({
    super.key,
    required this.idIngreso,
  });
  final String idIngreso;

  @override
  State<CreateTratamientoAntibioticoForm> createState() =>
      _CreateTratamientoAntibioticoFormState();
}

class _CreateTratamientoAntibioticoFormState
    extends State<CreateTratamientoAntibioticoForm> {
  late TextEditingController _cantidadController;
  late TextEditingController _dosisController;
  late TextEditingController _frecuenciaEn24hController;
  late TextEditingController _fechaInicioController;
  late TextEditingController _startTimeController;
  String? _selectedAntibiotico;
  int? _selectedFrecuencia;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DateTime? _selectedDate;
  TimeOfDay _startTime = const TimeOfDay(hour: 12, minute: 0);

  @override
  void initState() {
    super.initState();
    _cantidadController = TextEditingController();
    _dosisController = TextEditingController();
    _frecuenciaEn24hController = TextEditingController();
    _fechaInicioController = TextEditingController();
    _startTimeController = TextEditingController();
  }

  @override
  void dispose() {
    _cantidadController.dispose();
    _dosisController.dispose();
    _frecuenciaEn24hController.dispose();
    _fechaInicioController.dispose();
    _startTimeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 15),

              // Antibiotico Dropdown field
              EnumDropdownButtonFormField(
                value: _selectedAntibiotico,
                label: "Antibiotico",
                values: antibioticos,
                onSelected: (newValue) {
                  setState(() {
                    _selectedAntibiotico = newValue;
                  });
                },
                validator: (value) =>
                    value == null ? 'Seleccione un antibiótico' : null,
              ),
              const SizedBox(height: 15),

              // Cantidad field
              OutlinedTextFormField(
                controller: _cantidadController,
                label: "Cantidad (mg)",
                prefixIcon: const Icon(Icons.scale_outlined, size: 25),
                textInputType: TextInputType.number,
                validator: defaultValidator,
              ),
              const SizedBox(height: 15),

              // Dosis field
              OutlinedTextFormField(
                controller: _dosisController,
                label: "Dosis",
                prefixIcon:
                    const Icon(Icons.medical_services_outlined, size: 25),
                textInputType: TextInputType.number,
                validator: defaultValidator,
              ),
              const SizedBox(height: 15),

              // Frecuencia en 24h dropdown
              DropdownButtonFormField<int>(
                initialValue: _selectedFrecuencia,
                decoration: InputDecoration(
                  label: const Text(
                    "Frecuencia",
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  suffixIconColor: Colors.grey,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.surfaceTint,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                items: frecuenciaEn24hOptions.entries
                    .map(
                      (entry) => DropdownMenuItem<int>(
                        value: entry.key,
                        child: Text(entry.value),
                      ),
                    )
                    .toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedFrecuencia = newValue;
                  });
                },
                validator: (value) =>
                    value == null ? 'Seleccione una frecuencia' : null,
              ),
              const SizedBox(height: 15),

              // Fecha de inicio field
              DateFormField(
                label: 'Fecha de inicio',
                controller: _fechaInicioController,
                onTap: () {
                  _selectDate(_fechaInicioController, context);
                },
              ),
              const SizedBox(height: 15),

              // Hora de inicio field
              HourFormField(
                label: 'Hora Inicio',
                controller: _startTimeController,
                validator: defaultValidator,
                onTap: _selectStartTime,
              ),
              const SizedBox(
                height: 30,
              ),

              // Submit button
              CreateTratamientoAntibioticoFormButton(
                idIngreso: widget.idIngreso,
                formKey: _formKey,
                antibiotico: _selectedAntibiotico?.toString() ?? '',
                cantidadController: _cantidadController,
                dosisController: _dosisController,
                frecuencia: _selectedFrecuencia ?? 0,
                fechaInicio: _selectedDate,
                horaInicio: _startTime,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(
      TextEditingController controller, BuildContext context) async {
    final initialDate = DateTime.now();
    DateTime? pickedDate = await pickDate(initialDate, context);
    setState(() {
      controller.text = pickedDate.toString().split(" ")[0];
      _selectedDate = pickedDate;
    });
  }

  Future<void> _selectStartTime() async {
    TimeOfDay? pickedTime =
        await pickTime(context, _startTime, "SELECCIONAR HORA DE INICIO");
    if (pickedTime != null) {
      setState(() {
        _startTimeController.text = pickedTime.format(context);
        _startTime = pickedTime;
      });
    }
  }
}
