import 'package:flutter/material.dart';
import 'package:registro_uci/common/components/tile.dart';
import 'package:registro_uci/pages/registro_marcapasos_page.dart'; // Asegúrate de importar la página correcta

class MarcapasosTile extends StatelessWidget {
  final String idIngreso; // 🔥 Se añade el idIngreso como parámetro

  const MarcapasosTile({super.key, required this.idIngreso});

  @override
  Widget build(BuildContext context) {
    return Tile(
      iconData: Icons.monitor_heart_outlined,
      title: "Marcapasos",
      subtitle: "Registro de marcapasos del paciente",
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return CreateMarcapasoPage(
                  idIngreso: idIngreso); // ✅ Se pasa idIngreso correctamente
            },
          ),
        );
      },
    );
  }
}
