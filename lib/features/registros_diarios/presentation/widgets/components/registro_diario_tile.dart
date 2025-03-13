import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:registro_uci/common/components/lite_tile.dart';
import 'package:registro_uci/features/registros_diarios/domain/models/registro_diario.dart';
import 'package:registro_uci/pages/registro_diario/registro_diario_page.dart';

class RegistroDiarioTile extends StatelessWidget {
  final RegistroDiario registroDiario;
  final String idIngreso;
  const RegistroDiarioTile({
    super.key,
    required this.registroDiario,
    required this.idIngreso,
  });

  @override
  Widget build(BuildContext context) {
    return LiteTile(
      title: DateFormat.MMMMEEEEd()
          .format(registroDiario.fechaRegistro)
          .toUpperCase(),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return RegistroDiarioPage(
              idIngreso: idIngreso,
              idRegistro: registroDiario.idRegistroDiario,
            );
          },
        ));
      },
    );
  }
}
