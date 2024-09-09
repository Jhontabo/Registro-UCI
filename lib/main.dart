import 'package:flutter/material.dart';
import 'package:registro_uci/common/components/buttons/primary_button.dart';
import 'package:registro_uci/common/themes/light_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registro UCI"),
      ),
      body: Column(
        children: [
          const Text("Hello world"),
          PrimaryButton(
            onTap: () {},
            isLoading: false,
            enabled: false,
            child: const Text("Hola"),
          )
        ],
      ),
    );
  }
}
