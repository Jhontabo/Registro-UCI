import 'package:flutter/material.dart';

class LoadingButtonIndicator extends StatelessWidget {
  const LoadingButtonIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 22,
          height: 22,
          child: CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 3,
          ),
        ),
      ],
    );
  }
}
