import 'package:flutter/material.dart';
import 'package:registro_uci/common/components/form_fields/date_form_field.dart';
import 'package:registro_uci/common/components/form_fields/dropdown_button_form_field.dart';
import 'package:registro_uci/common/components/form_fields/text_form_field.dart';
import 'package:registro_uci/common/utils/date_picker.dart';
import 'package:registro_uci/features/ingresos/presentation/validators/create_ingreso_validators.dart';
import 'package:registro_uci/features/ingresos/presentation/widgets/components/buttons/create_ingreso_form_button.dart';

class CreateIngresoForm extends StatefulWidget {
  const CreateIngresoForm({
    super.key,
  });

  @override
  State<CreateIngresoForm> createState() => _CreateIngresoFormState();
}

class _CreateIngresoFormState extends State<CreateIngresoForm> {
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
  late TextEditingController _otherEpsArlController;

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

  final List<String> epsArlList = [
    'Nueva EPS', 'SURA', 'Sanitas', 'Compensar', 'Famisanar',
    'Coomeva', 'Salud Total', 'Aliansalud', 'Colpatria', 'Medimás',
    'AXA Colpatria', 'Positiva', 'Bolívar', 'La Equidad', 'Seguros del Estado',
    'Otro', // Agregar opción "Otro"
  ];

  String? selectedEpsArl;
  // Variable para mostrar campo de texto

  @override
  void initState() {
    super.initState();
    _nombrePacienteController = TextEditingController();
    _fechaNacimientoPacienteController = TextEditingController();
    _epsOArlController = TextEditingController();
    _identificacionPacienteController = TextEditingController();
    _carpetaController = TextEditingController();
    _nombreFamiliarController = TextEditingController();
    _otherParentescoFamiliarController = TextEditingController();
    _telefonoFamiliarController = TextEditingController();
    _diagnosticoIngresoController = TextEditingController();
    _pesoController = TextEditingController();
    _tallaController = TextEditingController();
    _camaController = TextEditingController();
    _alergiasController = TextEditingController();
    _otherEpsArlController = TextEditingController();
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
    _otherEpsArlController.dispose();
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

          // SECCION DATOS DEL PACIENTE
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
                // we are not validating this since it is optional
              ),
              const SizedBox(height: 15),

              EnumDropdownButtonFormField(
                onSelected: (eps) {
                  setState(() {
                    selectedEpsArl = eps;
                  });
                },
                label: "Seleccionar EPS o ARL",
                values: epsArlList, // Lista de EPS
                prefixIcon: const Icon(Icons.local_hospital),
                validator: epsOArlValidator,
              ),

// Campo visible si se selecciona "Otro" en EPS
              Visibility(
                visible: selectedEpsArl == 'Otro',
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    OutlinedTextFormField(
                      controller: _epsOArlController,
                      hint: "Ingrese la EPS o ARL",
                      validator: otherEpsArlValidator,
                    ),
                  ],
                ),
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

          // SECCION DATOS DEL INGRESO
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

          // SECCION DATOS DEL FAMILIAR
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

          CreateIngresoFormButton(
            formKey: _formKey,
            nombrePacienteController: _nombrePacienteController,
            fechaNacimientoPacienteController:
                _fechaNacimientoPacienteController,
            identificacionPacienteController: _identificacionPacienteController,
            carpetaController: _carpetaController,
            nombreFamiliarController: _nombreFamiliarController,
            selectedParentescoFamiliar: selectedParentescoFamiliar,
            otherParentescoFamiliarController:
                _otherParentescoFamiliarController,
            selectedEpsArl: selectedEpsArl,
            otherEpsArlController: _otherEpsArlController,
            telefonoFamiliarController: _telefonoFamiliarController,
            diagnosticoIngresoController: _diagnosticoIngresoController,
            pesoController: _pesoController,
            tallaController: _tallaController,
            camaController: _camaController,
            alergiasController: _alergiasController,
            sala: selectedSala,
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
      });
    }
  }
}
