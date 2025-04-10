import 'package:flutter/material.dart';
import 'package:registro_uci/common/components/lite_tile.dart';
import 'package:registro_uci/features/control_cambio_posicion/domain/models/cambio_posicion.dart';
import 'package:registro_uci/pages/cambio_posicion/seleccionar_posicion_page.dart';
import 'package:registro_uci/features/control_cambio_posicion/data/providers/cambio_posicion_provider.dart';

class CambioPosicionTile extends StatelessWidget {
  final CambioDePosicion cambio;
  final CambioPosicionParams params;

  const CambioPosicionTile({
    super.key,
    required this.cambio,
    required this.params,
  });

  @override
  Widget build(BuildContext context) {
    return LiteTile(
      title: "Hora: ${cambio.hora}:00:00",
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SeleccionarPosicionPage(
              params: params,
              horaSeleccionada: cambio.hora,
            ),
          ),
        );
      },
    );
  }
}
