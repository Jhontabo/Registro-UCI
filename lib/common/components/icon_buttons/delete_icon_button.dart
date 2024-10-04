import 'package:flutter/material.dart';

class DeleteIconButton extends StatelessWidget {
  final VoidCallback onTap;
  const DeleteIconButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: const Icon(
        Icons.delete,
        color: Colors.pink,
      ),
    );
  }
}
