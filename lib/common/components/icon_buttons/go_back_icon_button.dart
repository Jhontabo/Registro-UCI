import 'package:flutter/material.dart';

class GoBackButton extends StatelessWidget {
  const GoBackButton({
    super.key,
    required this.onTap,
    this.enabled = true,
  });

  final VoidCallback onTap;
  final bool enabled;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: enabled ? onTap : null,
      icon: Icon(
        Icons.arrow_back_ios,
        color: enabled
            ? Theme.of(context).colorScheme.primary
            : Colors.grey.shade400,
      ),
      splashRadius: 20,
    );
  }
}
