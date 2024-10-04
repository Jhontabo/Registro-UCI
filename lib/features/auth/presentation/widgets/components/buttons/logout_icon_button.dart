import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/components/buttons/primary_button.dart';
import 'package:registro_uci/common/components/buttons/secondary_button.dart';
import 'package:registro_uci/features/auth/presentation/controllers/auth_controller.dart';

class LogoutIconButton extends ConsumerWidget {
  const LogoutIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      icon: const Icon(Icons.logout),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text(
              "¿Cerrar sesion?",
            ),
            actions: [
              SecondaryButton(
                child: const Text("Cancelar"),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              PrimaryButton(
                child: const Text(
                  "Aceptar",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  ref.read(authControllerProvider.notifier).logout();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
