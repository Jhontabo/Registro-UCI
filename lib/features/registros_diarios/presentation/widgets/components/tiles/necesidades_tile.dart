import 'package:flutter/material.dart';
import 'package:registro_uci/common/components/form_tile.dart';
import 'package:registro_uci/features/firmas/domain/models/firma.dart';
import 'package:registro_uci/pages/necesidades_page.dart';

class NecesidadesTile extends StatelessWidget {
  const NecesidadesTile({
    super.key,
    required this.idIngreso,
    required this.idRegistro,
    required this.firma,
  });

  final String idIngreso;
  final String idRegistro;
  final Firma? firma;

  @override
  Widget build(BuildContext context) {
    return FormTile(
      completed: firma != null,
      title: "Lista de Necesidades",
      subtitle: "Necesidades, Objectivos e intervenciones de enfermería",
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => NecesidadesPage(
              idIngreso: idIngreso,
              idRegistro: idRegistro,
              firma: firma,
            ),
          ),
        );
      },
    );
  }
}
