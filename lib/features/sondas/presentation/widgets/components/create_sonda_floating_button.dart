import 'package:flutter/material.dart';
import '../../../../../../pages/sondas/create_sondas_page.dart';

class CreateSondaFloatingButton extends StatelessWidget {
  final String idIngreso; // ✅ Recibe el ID del ingreso

  const CreateSondaFloatingButton({
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
          builder: (context) => CreateSondasPage(idIngreso: idIngreso),
        ));
      },
      child: const Icon(Icons.add,
          size: 28), // ✅ Ícono más grande para accesibilidad
    );
  }
}
