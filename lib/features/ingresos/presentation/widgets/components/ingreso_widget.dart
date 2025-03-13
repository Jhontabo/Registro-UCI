import 'package:flutter/material.dart';
//import 'package:registro_uci/common/components/bed_widget.dart';
import 'package:registro_uci/common/components/tappable_container.dart';
import 'package:registro_uci/features/ingresos/domain/models/ingreso.dart';
import 'package:registro_uci/pages/ingreso/ingreso_page.dart';

class IngresoWidget extends StatelessWidget {
  final Ingreso ingreso;
  const IngresoWidget({
    super.key,
    required this.ingreso,
  });

  @override
  Widget build(BuildContext context) {
    final isActive = ingreso.fechaFin == null;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: TappableContainer(
        padding: 15,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return IngresoPage(idIngreso: ingreso.idIngreso);
            },
          ));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment
              .start, // 📌 Alinea todo el contenido a la izquierda
          children: [
            /// **Sección de información del paciente**
            Text(
              ingreso.nombrePaciente.toUpperCase(),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 5),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Edad: ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  TextSpan(
                    text: ingreso.fechaNacimientoPaciente != null
                        ? _calculateAge(ingreso.fechaNacimientoPaciente!)
                        : 'Desconocido',
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Diagnóstico: ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  TextSpan(
                    text: ingreso.diagnosticoActual,
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                ],
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
                height: 10), // 📌 Espacio entre la información y los iconos

            /// **Sección de iconos alineados a la izquierda**
            Row(
              mainAxisAlignment: MainAxisAlignment
                  .start, // 📌 Alinea los iconos a la izquierda
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min, // 📌 Ajusta al contenido
                    children: [
                      const Icon(Icons.bed, color: Colors.white, size: 20),
                      const SizedBox(width: 5),
                      Text(
                        ingreso.cama, // ✅ Eliminamos "UCI"
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10), // 📌 Espacio entre los botones
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color:
                        isActive ? Colors.blue.shade400 : Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min, // 📌 Ajusta al contenido
                    children: [
                      const Icon(Icons.calendar_today,
                          color: Colors.white, size: 20),
                      const SizedBox(width: 5),
                      Text(
                        "0${_calculateDaysPassed(ingreso.fechaIngreso, ingreso.fechaFin)}",
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _calculateAge(DateTime birthDate) {
    final currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;

    if (currentDate.month < birthDate.month ||
        (currentDate.month == birthDate.month &&
            currentDate.day < birthDate.day)) {
      age--;
    }

    return '$age años';
  }

  int _calculateDaysPassed(DateTime fechaIngreso, DateTime? fechaFin) {
    final currentDate = DateTime.now();
    if (fechaFin == null) return currentDate.difference(fechaIngreso).inDays;
    return fechaFin.difference(fechaIngreso).inDays;
  }
}
