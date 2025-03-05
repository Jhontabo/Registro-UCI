import 'package:flutter/material.dart';
import '../../../../../../pages/create_cateter_page.dart';

class CreateCateterFloatingButton extends StatelessWidget {
  final String idIngreso; // Recibe el ID del ingreso

  const CreateCateterFloatingButton({
    super.key,
    required this.idIngreso, // Aseguramos que se pase el ID al constructor
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.green, // 🔥 Ahora es rojo para ser consistente
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return CreateCateterPage(idIngreso: idIngreso);
          },
        ));
      },
      child: const Icon(Icons.add),
    );
  }
}
