import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/components/buttons/primary_button.dart';
import 'package:registro_uci/common/components/buttons/secondary_button.dart';
import 'package:registro_uci/features/auth/presentation/controllers/auth_controller.dart';
import 'package:registro_uci/features/auth/presentation/widgets/components/buttons/logout_icon_button.dart';
import 'package:registro_uci/features/ingresos/presentation/widgets/components/buttons/create_ingreso_floating_button.dart';
import 'package:registro_uci/features/ingresos/presentation/widgets/ingresos_list_widget.dart';
import 'package:registro_uci/pages/create_ingreso_page.dart';

class IngresosPage extends StatelessWidget {
  const IngresosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Ingresos"),
        actions: const [LogoutIconButton()],
      ),
      body: const IngresosListWidget(),
      floatingActionButton: const CreateIngresoFAB(),
    );
  }
}
