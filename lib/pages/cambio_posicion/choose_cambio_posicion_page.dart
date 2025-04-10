import 'package:flutter/material.dart';
import 'package:registro_uci/features/control_cambio_posicion/data/providers/cambio_posicion_provider.dart';
import 'package:registro_uci/features/control_cambio_posicion/domain/models/cambio_posicion.dart';
import 'package:registro_uci/pages/cambio_posicion/cambio_posicion_screen.dart';

class ChooseCambioPosicionPage extends StatelessWidget {
  final CambioPosicionParams params;
  final CambioDePosicion cambio;

  const ChooseCambioPosicionPage(
      {super.key, required this.params, required this.cambio});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gestión de Posiciones"),
      ),
      backgroundColor: const Color(0xFFF7F9FC),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Botón para "Registro de Posiciones"
            OptionButton(
              title: "Registro de Posiciones",
              icon: Icons.airline_seat_recline_normal,
              color: const Color(0xFF4A90E2),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CambioPosicionScreen(
                      params: CambioPosicionParams(
                        idIngreso: params.idIngreso,
                        idRegistroDiario: params.idRegistroDiario,
                        idCambioPosicion: cambio.idCambioDePosicion,
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 30),
            // Botón para "Historial de Cambios"
            OptionButton(
              title: "Historial de Cambios",
              icon: Icons.history,
              color: const Color(0xFF6ABF69),
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => HistorialPosicionesPage()),
                // );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Widget OptionButton se mantiene igual
class OptionButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  const OptionButton({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 5,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: color.withOpacity(0.1),
                child: Icon(icon, color: color, size: 30),
              ),
              const SizedBox(width: 20),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  color: color,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
