import 'package:flutter/material.dart';
import '../../features/sondas/presentation/widgets/components/create_sonda_form.dart';

class CreateSondasPage extends StatelessWidget {
  final String idIngreso; // ✅ Nuevo parámetro

  const CreateSondasPage({super.key, required this.idIngreso});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Crear Sonda')),
      body: SafeArea(
        // ✅ Evita superposición con la barra de estado
        child: SingleChildScrollView(
          physics:
              const BouncingScrollPhysics(), // ✅ Mejora la experiencia de desplazamiento
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior
              .onDrag, // ✅ Oculta teclado al arrastrar
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth:
                      600, // ✅ Evita que el formulario sea demasiado ancho en tablets
                ),
                child: CreateSondaForm(
                    idIngreso: idIngreso), // ✅ Pasamos idIngreso
              ),
            ),
          ),
        ),
      ),
    );
  }
}
