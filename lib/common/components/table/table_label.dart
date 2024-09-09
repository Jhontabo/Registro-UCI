import 'package:flutter/material.dart';

class TableLabel extends StatelessWidget {
  final String text;
  final Color foregroundColor;
  const TableLabel(
    this.text, {
    super.key,
    this.foregroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 15,
          // color: Color.fromARGB(255, 12, 53, 24),
          color: Theme.of(context).colorScheme.primary,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
