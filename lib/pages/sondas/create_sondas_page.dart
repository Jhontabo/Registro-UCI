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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // ✅ Titulo y breve descripción si es necesario
                    const Text(
                      "Formulario para crear una nueva Sonda",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20), // Espaciado

                    // ✅ Formulario
                    CreateSondaForm(
                        idIngreso: idIngreso), // ✅ Pasamos idIngreso
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
