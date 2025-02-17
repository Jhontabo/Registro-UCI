import 'package:flutter/material.dart';
import 'package:registro_uci/common/components/form_fields/date_form_field.dart';
import 'package:registro_uci/common/components/form_fields/dropdown_button_form_field.dart';
import 'package:registro_uci/common/components/form_fields/text_form_field.dart';
import 'package:registro_uci/common/extensions/string_to_date.dart';
import 'package:registro_uci/common/utils/date_picker.dart';
import 'package:registro_uci/features/ingresos/domain/models/ingreso.dart';
import 'package:registro_uci/features/ingresos/presentation/validators/create_ingreso_validators.dart';
import 'package:registro_uci/features/ingresos/presentation/widgets/components/buttons/update_ingreso_form_button.dart';

class UpdateIngresoForm extends StatefulWidget {
  final Ingreso ingreso;
  const UpdateIngresoForm({
    super.key,
    required this.ingreso,
  });

  @override
  State<UpdateIngresoForm> createState() => _UpdateIngresoFormState();
}

class _UpdateIngresoFormState extends State<UpdateIngresoForm> {
  late TextEditingController _nombrePacienteController;
  late TextEditingController _fechaNacimientoPacienteController;
  late TextEditingController _epsOArlController;
  late TextEditingController _identificacionPacienteController;
  late TextEditingController _carpetaController;
  late TextEditingController _nombreFamiliarController;
  late TextEditingController _otherParentescoFamiliarController;
  late TextEditingController _telefonoFamiliarController;
  late TextEditingController _diagnosticoIngresoController;
  late TextEditingController _pesoController;
  late TextEditingController _tallaController;
  late TextEditingController _camaController;
  late TextEditingController _alergiasController;

  String? selectedParentescoFamiliar;
  String? selectedSala;

  final List<String> listaParentescos = [
    'Padre/Madre',
    'Hijo/Hija',
    'Nieto/Nieta',
    'Esposo/Esposa',
    'Otro',
  ];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _otherParentescoFamiliarController = TextEditingController();

    selectedSala = widget.ingreso.sala.salaToString();

    if (listaParentescos.contains(widget.ingreso.parentescoFamiliar)) {
      selectedParentescoFamiliar = widget.ingreso.parentescoFamiliar;
    } else {
      selectedParentescoFamiliar = 'Otro';
      _otherParentescoFamiliarController.text =
          widget.ingreso.parentescoFamiliar;
    }

    _nombrePacienteController = TextEditingController();
    _nombrePacienteController.text = widget.ingreso.nombrePaciente;

    _fechaNacimientoPacienteController = TextEditingController();
    _fechaNacimientoPacienteController.text =
        widget.ingreso.fechaNacimientoPaciente.toString().split(" ")[0];

    _epsOArlController = TextEditingController();
    _epsOArlController.text = widget.ingreso.epsOArl;

    _identificacionPacienteController = TextEditingController();
    _identificacionPacienteController.text =
        widget.ingreso.identificacionPaciente;

    _carpetaController = TextEditingController();
    _carpetaController.text = widget.ingreso.carpeta;

    _nombreFamiliarController = TextEditingController();
    _nombreFamiliarController.text = widget.ingreso.nombreFamiliar;

    _telefonoFamiliarController = TextEditingController();
    _telefonoFamiliarController.text = widget.ingreso.telefonoFamiliar;

    _diagnosticoIngresoController = TextEditingController();
    _diagnosticoIngresoController.text = widget.ingreso.diagnosticoIngreso;

    _pesoController = TextEditingController();
    _pesoController.text = widget.ingreso.peso.toInt().toString();

    _tallaController = TextEditingController();
    _tallaController.text = widget.ingreso.talla.toString();

    _camaController = TextEditingController();
    _camaController.text = widget.ingreso.cama;

    _alergiasController = TextEditingController();
    _alergiasController.text = widget.ingreso.alergias ?? "";
  }

  @override
  void dispose() {
    _nombrePacienteController.dispose();
    _fechaNacimientoPacienteController.dispose();
    _epsOArlController.dispose();
    _identificacionPacienteController.dispose();
    _carpetaController.dispose();
    _nombreFamiliarController.dispose();
    _otherParentescoFamiliarController.dispose();
    _telefonoFamiliarController.dispose();
    _diagnosticoIngresoController.dispose();
    _pesoController.dispose();
    _tallaController.dispose();
    _camaController.dispose();
    _alergiasController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 15),

          // DATOS DEL PACIENTE
          Column(
            children: [
              Text(
                "DATOS DEL PACIENTE",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 15),
              OutlinedTextFormField(
                controller: _nombrePacienteController,
                label: "Nombres y apellidos del paciente",
                prefixIcon: const Icon(
                  Icons.person_outline,
                  size: 25,
                ),
                validator: nombrePacienteValidator,
              ),
              const SizedBox(height: 15),
              OutlinedTextFormField(
                controller: _identificacionPacienteController,
                label: "Número de identificación",
                prefixIcon: const Icon(
                  Icons.numbers,
                  size: 25,
                ),
                textInputType: TextInputType.number,
                validator: identificacionPacienteValidator,
              ),
              const SizedBox(height: 15),
              OutlinedTextFormField(
                controller: _carpetaController,
                label: "Carpeta",
                prefixIcon: const Icon(
                  Icons.folder_outlined,
                  size: 25,
                ),
                textInputType: TextInputType.number,
                validator: carpetaValidator,
              ),
              const SizedBox(height: 15),
              DateFormField(
                label: 'Fecha de nacimiento',
                controller: _fechaNacimientoPacienteController,
                onTap: () {
                  _selectDate(_fechaNacimientoPacienteController, context);
                },
                validator: fechaNacimientoValidator,
              ),
              const SizedBox(height: 15),
              OutlinedTextFormField(
                controller: _epsOArlController,
                label: "EPS o ARL",
                prefixIcon: const Icon(
                  Icons.local_hospital_outlined,
                  size: 25,
                ),
                // validator: epsOArlValidator,
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: (MediaQuery.of(context).size.width - 45) / 2,
                    child: OutlinedTextFormField(
                      controller: _pesoController,
                      label: "Peso (Kg)",
                      prefixIcon: const Icon(
                        Icons.monitor_weight_outlined,
                        size: 25,
                      ),
                      textInputType: TextInputType.number,
                      validator: pesoValidator,
                    ),
                  ),
                  SizedBox(
                    width: (MediaQuery.of(context).size.width - 45) / 2,
                    child: OutlinedTextFormField(
                      controller: _tallaController,
                      label: "Talla (cm)",
                      prefixIcon: const Icon(
                        Icons.height_outlined,
                        size: 25,
                      ),
                      textInputType: TextInputType.number,
                      validator: tallaValidator,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              OutlinedTextFormField(
                controller: _alergiasController,
                label: "Alergias",
                prefixIcon: const Icon(
                  Icons.warning_amber_outlined,
                  size: 25,
                ),
                maxLines: 2,
              ),
            ],
          ),
          const SizedBox(height: 30),

          // DATOS DEL INGRESO
          Column(
            children: [
              Text(
                "DATOS DEL INGRESO",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              EnumDropdownButtonFormField(
                onSelected: (sala) {
                  setState(() {
                    selectedSala = sala;
                  });
                },
                label: "Sala",
                values: const ['A', 'B', 'C', 'D'],
                prefixIcon: const Icon(Icons.meeting_room_rounded),
                validator: salaValidator,
                value: selectedSala,
              ),
              const SizedBox(height: 15),
              OutlinedTextFormField(
                controller: _camaController,
                label: "Cama",
                prefixIcon: const Icon(
                  Icons.bed_outlined,
                  size: 25,
                ),
                validator: camaValidator,
              ),
              const SizedBox(height: 15),
              OutlinedTextFormField(
                controller: _diagnosticoIngresoController,
                label: "Diagnóstico de Ingreso",
                autocorrect: true,
                maxLines: 3,
                prefixIcon: const Icon(
                  Icons.edit_note_outlined,
                  size: 25,
                ),
                validator: diagnosticoIngresoValidator,
              ),
            ],
          ),
          const SizedBox(height: 30),

          // DATOS DEL FAMILIAR
          Column(
            children: [
              Text(
                "DATOS DEL FAMILIAR",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 15),
              OutlinedTextFormField(
                controller: _nombreFamiliarController,
                label: "Nombres y apellidos",
                prefixIcon: const Icon(
                  Icons.person_outline_sharp,
                  size: 25,
                ),
                validator: nombreFamiliarValidator,
              ),
              const SizedBox(height: 15),
              EnumDropdownButtonFormField(
                onSelected: (parentesco) {
                  setState(() {
                    selectedParentescoFamiliar = parentesco;
                  });
                },
                label: "Parentesco",
                values: listaParentescos,
                value: selectedParentescoFamiliar,
                prefixIcon: const Icon(Icons.family_restroom),
                validator: parentescoFamiliarValidator,
              ),
              Visibility(
                visible: selectedParentescoFamiliar == 'Otro',
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    OutlinedTextFormField(
                      controller: _otherParentescoFamiliarController,
                      hint: "Otro parentesco",
                      validator: otherParentescoFamiliarValidator,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              OutlinedTextFormField(
                controller: _telefonoFamiliarController,
                label: "Teléfono de contacto",
                textInputType: TextInputType.phone,
                prefixIcon: const Icon(
                  Icons.phone_android_outlined,
                  size: 25,
                ),
                validator: telefonoFamiliarValidator,
              ),
            ],
          ),
          const SizedBox(height: 45),

          UpdateIngresoFormButton(
            idIngreso: widget.ingreso.idIngreso,
            formKey: _formKey,
            nombrePacienteController: _nombrePacienteController,
            fechaNacimientoPacienteController:
                _fechaNacimientoPacienteController,
            epsOArlController: _epsOArlController,
            identificacionPacienteController: _identificacionPacienteController,
            carpetaController: _carpetaController,
            nombreFamiliarController: _nombreFamiliarController,
            selectedParentescoFamiliar: selectedParentescoFamiliar,
            otherParentescoFamiliarController:
                _otherParentescoFamiliarController,
            telefonoFamiliarController: _telefonoFamiliarController,
            diagnosticoIngresoController: _diagnosticoIngresoController,
            pesoController: _pesoController,
            tallaController: _tallaController,
            camaController: _camaController,
            alergiasController: _alergiasController,
            sala: selectedSala!,
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(
    TextEditingController controller,
    BuildContext context,
  ) async {
    final initialDate = controller.text.toDateTime();
    DateTime? pickedDate = await pickDate(initialDate, context);
    if (pickedDate != null) {
      setState(() {
        controller.text = pickedDate.toString().split(" ")[0];
      });
    }
  }
}
