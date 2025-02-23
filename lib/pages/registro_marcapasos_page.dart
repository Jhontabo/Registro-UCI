import 'package:flutter/material.dart';
import './../features/marcapasos/presentation/widgets/components/create_marcapaso_form.dart';

class CreateMarcapasoPage extends StatelessWidget {
  const CreateMarcapasoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Crear Marcapaso"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth:
                  600, // Evita desbordamiento horizontal en pantallas grandes
            ),
            child: const CreateMarcapasoForm(),
          ),
        ),
      ),
    );
  }
}
