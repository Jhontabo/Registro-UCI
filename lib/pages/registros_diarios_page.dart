import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/components/bed_widget.dart';
import 'package:registro_uci/features/auth/data/providers/user_role_provider.dart';
import 'package:registro_uci/features/auth/domain/enums/user_role.dart';
import 'package:registro_uci/features/registros_diarios/presentation/widgets/create_registro_diario_form.dart';
import 'package:registro_uci/features/registros_diarios/presentation/widgets/registros_diarios_list.dart';

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
      floatingActionButton: AddRegistroFAB(idIngreso: idIngreso),
    );
  }
}

class AddRegistroFAB extends ConsumerWidget {
  const AddRegistroFAB({
    super.key,
    required this.idIngreso,
  });

  final String idIngreso;

  @override
  Widget build(BuildContext context, ref) {
    final role = ref.watch(roleProvider);

    return Visibility(
      visible: role == UserRole.headNurse,
      child: IconButton.filled(
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
        },
        icon: const Icon(Icons.add),
      ),
    );
  }
}
