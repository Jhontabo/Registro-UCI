import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:registro_uci/features/antibioticos/domain/models/tratamiento_antibiotico.dart';
import 'package:registro_uci/pages/tratamiento_antibioticos/tratamiento_antibiotico_page.dart';

class TratamientoAntibioticoWidget extends StatefulWidget {
  final TratamientoAntibiotico tratamientoAntibiotico;
  final String idIngreso;
  const TratamientoAntibioticoWidget({
    super.key,
    required this.tratamientoAntibiotico,
    required this.idIngreso,
  });

  @override
  TratamientoAntibioticoWidgetState createState() =>
      TratamientoAntibioticoWidgetState();
}

class TratamientoAntibioticoWidgetState
    extends State<TratamientoAntibioticoWidget> {
  @override
  Widget build(BuildContext context) {
    final tratamiento = widget.tratamientoAntibiotico;

    // Determine if the treatment is active or finalized
    final bool isFinalized = tratamiento.fechaFin != null;
    final String estado = isFinalized ? 'Finalizado' : 'Activo';
    final Color estadoColor =
        isFinalized ? Colors.pinkAccent : Colors.greenAccent;

    String mapFrecuencia(int frecuenciaEn24h) {
      switch (frecuenciaEn24h) {
        case 1:
          return '/24 horas';
        case 2:
          return '/12 horas';
        case 4:
          return '/6 horas';
        case 6:
          return '/4 horas';
        case 8:
          return '/3 horas';
        case 12:
          return '/2 horas';
        case 24:
          return '/hora';
        default:
          return '$frecuenciaEn24h veces al día';
      }
    }

    return GestureDetector(
      onTap: () {
        // Navigate to TratamientoAntibioticoPage with the current tratamientoAntibiotico
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TratamientoAntibioticoPage(
              idTratamientoAntibiotico: tratamiento.idTratamientoAntibiotico,
              idIngreso: widget.idIngreso,
            ),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tratamiento.antibiotico,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Inicio: ${DateFormat('dd/MM/yyyy').format(tratamiento.fechaInicio)}',
                      style: const TextStyle(fontSize: 14),
                    ),
                    Text(
                      'Fin: ${tratamiento.fechaFin != null ? DateFormat('dd/MM/yyyy').format(tratamiento.fechaFin!) : 'N/A'}',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      child: Text(
                        '${tratamiento.cantidad} cc ${mapFrecuencia(tratamiento.frecuenciaEn24h)}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: estadoColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      child: Text(
                        estado,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
