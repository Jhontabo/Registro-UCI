import 'package:flutter/material.dart';
import '../../../../../../pages/registro_diario/control_riegos/control_de_riesgos_page.dart';

class CreateControlRiegosFloatingButton extends StatelessWidget {
  final String idIngreso; // ✅ Recibe el ID del ingreso

  const CreateControlRiegosFloatingButton({
    super.key,
    required this.idIngreso, // ✅ Se asegura que el ID sea obligatorio
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.green, // ✅ Mantiene el color de la app
      elevation: 6.0, // ✅ Agrega una elevación para mejor visibilidad
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ControlDeRiesgosPage(
            idIngreso:
                idIngreso, // ✅ Se pasa el ID de ingreso a la página de control de riesgos
            idRegistroDiario: '', // Pasar el valor adecuado si es necesario
          ),
        ));
      },
      child: const Icon(Icons.add, size: 28), // ✅ Ícono del botón
    );
  }
}
