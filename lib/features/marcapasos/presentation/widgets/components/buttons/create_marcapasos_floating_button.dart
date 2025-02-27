import 'package:flutter/material.dart';
import '../../../../../../pages/create_marcapaso_page.dart';

class CreateMarcapasosFloatingButton extends StatelessWidget {
  final String idIngreso; // Recibe el ID del ingreso

  const CreateMarcapasosFloatingButton({
    super.key,
    required this.idIngreso, // Aseguramos que se pase el ID al constructor
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.red, // 🔥 Ahora es rojo para ser consistente
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return CreateMarcapasoPage(idIngreso: idIngreso);
          },
        ));
      },
      child: const Icon(Icons.add),
    );
  }
}
