import 'package:flutter/material.dart';
import '../../features/sondas/domain/models/sonda.dart';
import '../../features/sondas/presentation/widgets/components/update_sonda_form.dart';

class UpdateSondasPage extends StatelessWidget {
  final Sonda sonda;
  final String idIngreso; // ✅ Nuevo parámetro

  const UpdateSondasPage(
      {super.key, required this.sonda, required this.idIngreso});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Actualizar Sonda')),
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
                child: UpdateSondaForm(
                    sonda: sonda, idIngreso: idIngreso), // ✅ Pasamos idIngreso
              ),
            ),
          ),
        ),
      ),
    );
  }
}
