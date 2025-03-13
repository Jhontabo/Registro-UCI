import 'package:flutter/material.dart';
import 'package:registro_uci/common/components/buttons/primary_button.dart';
import 'package:registro_uci/common/components/form_fields/date_form_field.dart';
import 'package:registro_uci/common/components/form_fields/text_form_field.dart';
import 'package:registro_uci/features/monitorias_hemodinamicas/domain/models/monitoria_hemodinamica.dart';

class CreateMonitoriaHemodinamicaPage extends StatelessWidget {
  const CreateMonitoriaHemodinamicaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Monitoria Hemodinamica",
          // style: Theme.of(context)
          //     .textTheme
          //     .titleLarge!
          //     .copyWith(fontWeight: FontWeight.w500),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: const [
          UpdateMonitoriaForm(
            monitoria: MonitoriaHemodinamica(
                idMonitoria: '5', hora: 5, glucometria: 78),
          ),
        ],
      ),
    );
  }
}

class UpdateMonitoriaForm extends StatefulWidget {
  final MonitoriaHemodinamica monitoria;

  const UpdateMonitoriaForm({
    super.key,
    required this.monitoria,
  });

  @override
  State<UpdateMonitoriaForm> createState() => _UpdateMonitoriaFormState();
}

class _UpdateMonitoriaFormState extends State<UpdateMonitoriaForm> {
  late TextEditingController _pasController;
  late TextEditingController _padController;
  late TextEditingController _presionArterialMediaController;
  late TextEditingController _fcController;
  late TextEditingController _frController;
  late TextEditingController _tController;
  late TextEditingController _fio2Controller;
  late TextEditingController _piaController;
  late TextEditingController _ppaController;
  late TextEditingController _picController;
  late TextEditingController _ppcController;
  late TextEditingController _glucometriaController;
  late TextEditingController _insulinaController;
  late TextEditingController _saturacionController;
  late TextEditingController _fechaFirmaController;
  late TextEditingController _firmadoPorController;

  @override
  void initState() {
    super.initState();
    final monitoria = widget.monitoria;

    _pasController =
        TextEditingController(text: monitoria.pas?.toString() ?? '');
    _padController =
        TextEditingController(text: monitoria.pad?.toString() ?? '');
    _presionArterialMediaController =
        TextEditingController(text: monitoria.pam?.toString() ?? '');
    _fcController = TextEditingController(text: monitoria.fc?.toString() ?? '');
    _frController = TextEditingController(text: monitoria.fr?.toString() ?? '');
    _tController = TextEditingController(text: monitoria.t?.toString() ?? '');
    _fio2Controller =
        TextEditingController(text: monitoria.fio2?.toString() ?? '');
    _piaController =
        TextEditingController(text: monitoria.pia?.toString() ?? '');
    _ppaController =
        TextEditingController(text: monitoria.ppa?.toString() ?? '');
    _picController =
        TextEditingController(text: monitoria.pic?.toString() ?? '');
    _ppcController =
        TextEditingController(text: monitoria.ppc?.toString() ?? '');
    _glucometriaController =
        TextEditingController(text: monitoria.glucometria?.toString() ?? '');
    _insulinaController =
        TextEditingController(text: monitoria.insulina?.toString() ?? '');
    _saturacionController =
        TextEditingController(text: monitoria.saturacion?.toString() ?? '');
    _fechaFirmaController = TextEditingController(
        text: monitoria.fechaFirma?.toString().split(' ')[0] ?? '');
    _firmadoPorController =
        TextEditingController(text: monitoria.firmadoPor ?? '');
  }

  @override
  void dispose() {
    _pasController.dispose();
    _padController.dispose();
    _presionArterialMediaController.dispose();
    _fcController.dispose();
    _frController.dispose();
    _tController.dispose();
    _fio2Controller.dispose();
    _piaController.dispose();
    _ppaController.dispose();
    _picController.dispose();
    _ppcController.dispose();
    _glucometriaController.dispose();
    _insulinaController.dispose();
    _saturacionController.dispose();
    _fechaFirmaController.dispose();
    _firmadoPorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 15),

          // MONITORIA HEMODINAMICA DATA
          Column(
            children: [
              Text(
                "DATOS DE MONITORIA HEMODINÁMICA",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 15),
              OutlinedTextFormField(
                controller: _pasController,
                label: "Presión Arterial Sistólica (PAS)",
                textInputType: TextInputType.number,
                validator: pasValidator,
              ),
              const SizedBox(height: 15),
              OutlinedTextFormField(
                controller: _padController,
                label: "Presión Arterial Diastólica (PAD)",
                textInputType: TextInputType.number,
                validator: padValidator,
              ),
              const SizedBox(height: 15),
              OutlinedTextFormField(
                controller: _presionArterialMediaController,
                label: "Presión Arterial Media",
                textInputType: TextInputType.number,
                validator: presionArterialMediaValidator,
              ),
              const SizedBox(height: 15),
              OutlinedTextFormField(
                controller: _fcController,
                label: "Frecuencia Cardiaca (FC)",
                textInputType: TextInputType.number,
                validator: fcValidator,
              ),
              const SizedBox(height: 15),
              OutlinedTextFormField(
                controller: _frController,
                label: "Frecuencia Respiratoria (FR)",
                textInputType: TextInputType.number,
                validator: frValidator,
              ),
              const SizedBox(height: 15),
              OutlinedTextFormField(
                controller: _tController,
                label: "Temperatura",
                textInputType: TextInputType.number,
                validator: tValidator,
              ),
              const SizedBox(height: 15),
              OutlinedTextFormField(
                controller: _fio2Controller,
                label: "Fracción de Oxígeno Inspirado (FiO2)",
                textInputType: TextInputType.number,
                validator: fio2Validator,
              ),
              const SizedBox(height: 15),
              OutlinedTextFormField(
                controller: _piaController,
                label: "Presión Intraabdominal (PIA)",
                textInputType: TextInputType.number,
                validator: piaValidator,
              ),
              const SizedBox(height: 15),
              OutlinedTextFormField(
                controller: _ppaController,
                label: "Presión de Perfusión Arterial (PPA)",
                textInputType: TextInputType.number,
                validator: ppaValidator,
              ),
              const SizedBox(height: 15),
              OutlinedTextFormField(
                controller: _picController,
                label: "Presión Intracraneal (PIC)",
                textInputType: TextInputType.number,
                validator: picValidator,
              ),
              const SizedBox(height: 15),
              OutlinedTextFormField(
                controller: _ppcController,
                label: "Presión de Perfusión Cerebral (PPC)",
                textInputType: TextInputType.number,
                validator: ppcValidator,
              ),
              const SizedBox(height: 15),
              OutlinedTextFormField(
                controller: _glucometriaController,
                label: "Glucometría",
                textInputType: TextInputType.number,
                validator: glucometriaValidator,
              ),
              const SizedBox(height: 15),
              OutlinedTextFormField(
                controller: _insulinaController,
                label: "Insulina",
                textInputType: TextInputType.number,
                validator: insulinaValidator,
              ),
              const SizedBox(height: 15),
              OutlinedTextFormField(
                controller: _saturacionController,
                label: "Saturación",
                textInputType: TextInputType.number,
                validator: saturacionValidator,
              ),
              const SizedBox(height: 15),
              DateFormField(
                label: 'Fecha de Firma',
                controller: _fechaFirmaController,
                onTap: () {
                  _selectDate(_fechaFirmaController, context);
                },
                validator: fechaFirmaValidator,
              ),
              const SizedBox(height: 15),
              OutlinedTextFormField(
                controller: _firmadoPorController,
                label: "Firmado Por",
                validator: firmadoPorValidator,
              ),
            ],
          ),
          const SizedBox(height: 30),

          // Submit Button
          PrimaryButton(child: const Text("Hello"), onTap: () {})
          // UpdateMonitoriaFormButton(
          //   pasController: _pasController,
          //   padController: _padController,
          //   presionArterialMediaController: _presionArterialMediaController,
          //   fcController: _fcController,
          //   frController: _frController,
          //   tController: _tController,
          //   fio2Controller: _fio2Controller,
          //   piaController: _piaController,
          //   ppaController: _ppaController,
          //   picController: _picController,
          //   ppcController: _ppcController,
          //   glucometriaController: _glucometriaController,
          //   insulinaController: _insulinaController,
          //   saturacionController: _saturacionController,
          //   fechaFirmaController: _fechaFirmaController,
          //   firmadoPorController: _firmadoPorController,
          //   hora: widget.monitoria.hora, // Fixed hora
          // ),
        ],
      ),
    );
  }

  Future<void> _selectDate(
      TextEditingController controller, BuildContext context) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      controller.text = selectedDate.toLocal().toString().split(' ')[0];
    }
  }
}

String? pasValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Presión Arterial Sistólica (PAS) es requerida';
  }
  final double? pas = double.tryParse(value);
  if (pas == null) {
    return 'Debe ser un número válido';
  }
  return null;
}

String? padValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Presión Arterial Diastólica (PAD) es requerida';
  }
  final double? pad = double.tryParse(value);
  if (pad == null) {
    return 'Debe ser un número válido';
  }
  return null;
}

String? presionArterialMediaValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Presión Arterial Media es requerida';
  }
  final double? presionArterialMedia = double.tryParse(value);
  if (presionArterialMedia == null) {
    return 'Debe ser un número válido';
  }
  return null;
}

String? fcValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Frecuencia Cardiaca (FC) es requerida';
  }
  final int? fc = int.tryParse(value);
  if (fc == null) {
    return 'Debe ser un número válido';
  }
  return null;
}

String? frValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Frecuencia Respiratoria (FR) es requerida';
  }
  final int? fr = int.tryParse(value);
  if (fr == null) {
    return 'Debe ser un número válido';
  }
  return null;
}

String? tValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Temperatura es requerida';
  }
  final double? t = double.tryParse(value);
  if (t == null) {
    return 'Debe ser un número válido';
  }
  return null;
}

String? fio2Validator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Fracción de Oxígeno Inspirado (FiO2) es requerida';
  }
  final int? fio2 = int.tryParse(value);
  if (fio2 == null) {
    return 'Debe ser un número válido';
  }
  return null;
}

String? piaValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Presión Intraabdominal (PIA) es requerida';
  }
  final int? pia = int.tryParse(value);
  if (pia == null) {
    return 'Debe ser un número válido';
  }
  return null;
}

String? ppaValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Presión de Perfusión Arterial (PPA) es requerida';
  }
  final int? ppa = int.tryParse(value);
  if (ppa == null) {
    return 'Debe ser un número válido';
  }
  return null;
}

String? picValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Presión Intracraneal (PIC) es requerida';
  }
  final int? pic = int.tryParse(value);
  if (pic == null) {
    return 'Debe ser un número válido';
  }
  return null;
}

String? ppcValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Presión de Perfusión Cerebral (PPC) es requerida';
  }
  final int? ppc = int.tryParse(value);
  if (ppc == null) {
    return 'Debe ser un número válido';
  }
  return null;
}

String? glucometriaValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Glucometría es requerida';
  }
  final int? glucometria = int.tryParse(value);
  if (glucometria == null) {
    return 'Debe ser un número válido';
  }
  return null;
}

String? insulinaValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Insulina es requerida';
  }
  final int? insulina = int.tryParse(value);
  if (insulina == null) {
    return 'Debe ser un número válido';
  }
  return null;
}

String? saturacionValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Saturación es requerida';
  }
  final int? saturacion = int.tryParse(value);
  if (saturacion == null) {
    return 'Debe ser un número válido';
  }
  return null;
}

String? fechaFirmaValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Fecha de Firma es requerida';
  }
  try {
    DateTime.parse(value);
  } catch (e) {
    return 'Fecha inválida';
  }
  return null;
}

String? firmadoPorValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Firmado Por es requerido';
  }
  return null;
}
