import 'package:flutter/material.dart';

class EditIconButton extends StatelessWidget {
  final VoidCallback onTap;
  const EditIconButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: const Icon(
        Icons.edit,
        color: Colors.blue,
      ),
    );
  }
}
