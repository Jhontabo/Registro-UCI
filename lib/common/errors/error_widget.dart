import 'package:flutter/material.dart';
import 'package:registro_uci/common/components/buttons/secondary_button.dart';

class ErrorWidgetUI extends StatelessWidget {
  final String message;
  final VoidCallback onRefresh;
  const ErrorWidgetUI({
    super.key,
    this.message = "Ha ocurrido un error",
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(message),
        const SizedBox(
          height: 10,
        ),
        SecondaryButton(
          onTap: onRefresh,
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.refresh),
              Text(" Volver a cargar"),
            ],
          ),
        )
      ],
    );
  }
}
