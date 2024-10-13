import 'package:flutter/material.dart';

class DetailsIconButton extends StatelessWidget {
  final VoidCallback onTap;
  const DetailsIconButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: const Icon(
        Icons.info_outline,
        color: Colors.blue,
      ),
    );
  }
}
