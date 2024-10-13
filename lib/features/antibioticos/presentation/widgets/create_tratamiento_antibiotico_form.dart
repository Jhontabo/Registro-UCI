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
  late TextEditingController _frecuenciaEn24hController;
  late TextEditingController _fechaInicioController;
  late TextEditingController _startTimeController;
  String? _selectedAntibiotico;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DateTime? _selectedDate;
  TimeOfDay _startTime = const TimeOfDay(hour: 12, minute: 0);

  @override
  void initState() {
    super.initState();
    _cantidadController = TextEditingController();
    _frecuenciaEn24hController = TextEditingController();
    _fechaInicioController = TextEditingController();
    _startTimeController = TextEditingController();
  }

  @override
  void dispose() {
    _cantidadController.dispose();
    _frecuenciaEn24hController.dispose();
    _fechaInicioController.dispose();
    _startTimeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
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

          // Frecuencia en 24h field
          OutlinedTextFormField(
            controller: _frecuenciaEn24hController,
            label: "Frecuencia en 24h",
            prefixIcon: const Icon(Icons.schedule_outlined, size: 25),
            textInputType: TextInputType.number,
            validator: defaultValidator,
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

          HourFormField(
            label: 'Hora Fin',
            controller: _startTimeController,
            validator: defaultValidator,
            onTap: _selectStartTime,
          ),
          const SizedBox(
            height: 30,
          ),
          CreateTratamientoAntibioticoFormButton(
            idIngreso: widget.idIngreso,
            formKey: _formKey,
            antibioticoController:
                TextEditingController(text: _selectedAntibiotico ?? ''),
            cantidadController: _cantidadController,
            frecuenciaController: _frecuenciaEn24hController,
            fechaInicio: _selectedDate,
            horaInicio: _startTime,
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(
      TextEditingController controller, BuildContext context) async {
    final initialDate = DateTime.now();
    DateTime? pickedDate = await pickDate(initialDate, context);
    if (pickedDate != null) {
      setState(() {
        controller.text = pickedDate.toString().split(" ")[0];
        _selectedDate = pickedDate;
      });
    }
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

extension StringCasingExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
