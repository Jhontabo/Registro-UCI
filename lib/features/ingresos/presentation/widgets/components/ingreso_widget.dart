import 'package:flutter/material.dart';
import 'package:registro_uci/common/components/bed_widget.dart';
import 'package:registro_uci/common/components/tappable_container.dart';
import 'package:registro_uci/features/ingresos/domain/models/ingreso.dart';
import 'package:registro_uci/pages/ingreso_page.dart';

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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              // color: Colors.amber,
              width: (MediaQuery.of(context).size.width - 60) - 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ingreso.nombrePaciente.toUpperCase(),
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Edad: ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: ingreso.fechaNacimientoPaciente != null
                              ? _calculateAge(ingreso.fechaNacimientoPaciente!)
                              : 'Desconocido',
                          style: TextStyle(
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Diagnóstico: ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: ingreso.diagnosticoActual,
                          style: TextStyle(
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 80,
              child: Column(
                children: [
                  BedInfoWidget(
                    isActive: isActive,
                    bed: ingreso.cama,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: isActive
                          ? Colors.blue.shade400
                          : Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.calendar_month,
                          color: Colors.white,
                          size: 25,
                        ),
                        Text(
                          "0${_calculateDaysPassed(ingreso.fechaIngreso, ingreso.fechaFin)}",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                        )
                      ],
                    ),
                  )
                ],
              ),
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
