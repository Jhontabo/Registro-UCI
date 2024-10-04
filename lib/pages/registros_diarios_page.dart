import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:registro_uci/common/components/bed_widget.dart';
import 'package:registro_uci/common/components/lite_tile.dart';
import 'package:registro_uci/common/components/tile.dart';
import 'package:registro_uci/common/extensions/int_to_day_string.dart';
import 'package:registro_uci/features/auth/data/providers/is_logged_in_provider.dart';
import 'package:registro_uci/features/ingresos/presentation/widgets/components/ingreso_widget.dart';
import 'package:registro_uci/features/registros_diarios/data/dto/create_registro_diario_dto.dart';
import 'package:registro_uci/features/registros_diarios/data/providers/registros_diarios_de_ingreso_provider.dart';
import 'package:registro_uci/features/registros_diarios/domain/models/registro_diario.dart';
import 'package:registro_uci/features/registros_diarios/presentation/widgets/create_registro_diario_form.dart';
import 'package:registro_uci/features/registros_diarios/presentation/widgets/registros_diarios_list.dart';
import 'package:registro_uci/pages/create_registro_diario_page.dart';

class RegistrosDiariosPage extends StatelessWidget {
  final String idIngreso;
  const RegistrosDiariosPage({
    super.key,
    required this.idIngreso,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              child: Text("Registros Diarios"),
            ),
            const SizedBox(width: 10),
            BedProviderWidget(
              idIngreso: idIngreso,
              redirectable: true,
            ),
          ],
        ),
      ),
      body: RegistrosDiariosList(idIngreso: idIngreso),
      floatingActionButton: IconButton.filled(
        padding: const EdgeInsets.all(15),
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            Theme.of(context).colorScheme.secondary,
          ),
        ),
        iconSize: 28,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: CreateRegistroDiarioForm(idIngreso: idIngreso),
              );
            },
          );
          // Navigator.of(context).push(MaterialPageRoute(
          //   builder: (context) {
          //     return CreateRegistroDiarioPage(
          //       idIngreso: idIngreso,
          //     );
          //   },
          // ));
        },
        icon: const Icon(Icons.add),
      ),
    );
  }
}
