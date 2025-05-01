import 'package:flutter/material.dart'; // Para los componentes de Flutter
import '../../features/monitorias_hemodinamicas/presentation/widgets/monitoria_hemodinamica_form_dialog.dart';

class FormularioMonitoriaScreen extends StatelessWidget {
  final String idIngreso;
  final String idRegistroDiario;
  final int? horaInicial;

  FormularioMonitoriaScreen({
    required this.idIngreso,
    required this.idRegistroDiario,
    this.horaInicial,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario Monitoría'),
      ),
      body: MonitoriaHemodinamicaFormDialog(
        idIngreso: idIngreso,
        idRegistroDiario: idRegistroDiario,
        horaInicial: horaInicial,
      ),
    );
  }
}
