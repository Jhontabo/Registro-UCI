import 'package:flutter/material.dart';
import 'package:registro_uci/common/components/tile.dart';
import '../../../../../../pages/sondas/sondas_page.dart'; // ✅ Importa la página correcta

class SondasTile extends StatelessWidget {
  final String idIngreso; // ✅ Parám. obligatorio

  const SondasTile({super.key, required this.idIngreso});

  @override
  Widget build(BuildContext context) {
    return Tile(
      iconData: Icons.medical_services_outlined,
      title: "Sondas",
      subtitle: "Lista de sondas registradas",
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return SondasPage(idIngreso: idIngreso); // ✅ Ahora sí lo pasamos
            },
          ),
        );
      },
    );
  }
}
