import 'package:flutter/material.dart';
import '../../../features/registros_diarios/control_riesgos/presentation/widgets/update_control_riegos_form.dart';
import 'package:registro_uci/features/registros_diarios/control_riesgos/domain/models/control_de_riesgos.dart';
import 'package:registro_uci/features/registros_diarios/control_riesgos/data/repositories/firabase_control_de_riesgos.dart'; // Asegúrate de importar el modelo correcto

class UpdateControlRiesgosPage extends StatelessWidget {
  final String idIngreso;
  final String idRegistroDiario;
  final String controlRiesgosId;

  const UpdateControlRiesgosPage({
    super.key,
    required this.idIngreso,
    required this.idRegistroDiario,
    required this.controlRiesgosId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<ControlDeRiesgos>(
          future: _fetchControlDeRiesgos(), // Método para obtener el objeto
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData) {
              return const Center(child: Text('No se encontró el registro'));
            }
            final controlDeRiesgos = snapshot.data!;
            return UpdateControlRiesgosForm(
              idIngreso: idIngreso,
              idRegistroDiario: idRegistroDiario,
              controlDeRiesgos: controlDeRiesgos, // Pasar el objeto completo
            );
          },
        ),
      ),
    );
  }

  Future<ControlDeRiesgos> _fetchControlDeRiesgos() async {
    final repository = FirebaseControlDeRiesgosRepository();
    return await repository.getControlDeRiesgosById(
      idIngreso,
      idRegistroDiario,
      controlRiesgosId,
    );
  }
}
