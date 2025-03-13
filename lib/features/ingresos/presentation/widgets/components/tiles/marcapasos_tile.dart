import 'package:flutter/material.dart';
import 'package:registro_uci/common/components/tile.dart';
import '../../../../../../pages/marcapasos/marcapasos_page.dart'; // ✅ Importa la página correcta

class MarcapasosTile extends StatelessWidget {
  final String idIngreso; // 🔥 Se añade el idIngreso como parámetro

  const MarcapasosTile({super.key, required this.idIngreso});

  @override
  Widget build(BuildContext context) {
    return Tile(
      iconData: Icons.monitor_heart_outlined,
      title: "Marcapasos",
      subtitle: "Lista de marcapasos registrados",
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return ListadoMarcapasosPage(
                // ✅ Cambiado a la página de lista
                idIngreso: idIngreso,
              );
            },
          ),
        );
      },
    );
  }
}
