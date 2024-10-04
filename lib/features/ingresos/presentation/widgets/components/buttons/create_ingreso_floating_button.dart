import 'package:flutter/material.dart';
import 'package:registro_uci/pages/create_ingreso_page.dart';

class CreateIngresoFAB extends StatelessWidget {
  const CreateIngresoFAB({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      padding: const EdgeInsets.all(15),
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
          Theme.of(context).colorScheme.secondary,
        ),
      ),
      iconSize: 28,
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return const CreateIngresoPage();
          },
        ));
      },
      icon: const Icon(Icons.add),
    );
  }
}
