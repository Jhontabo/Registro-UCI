import 'package:flutter/material.dart';

class NecesidadFloatingActionButton extends StatelessWidget {
  const NecesidadFloatingActionButton({
    super.key,
    required this.onCreate,
    required this.onImport,
  });

  final VoidCallback onCreate;
  final VoidCallback onImport;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (value) {
        switch (value) {
          case 'crear':
            onCreate();
            break;
          case 'importar':
            onImport();
            break;
        }
      },
      itemBuilder: (BuildContext context) {
        return [
          const PopupMenuItem<String>(
            value: 'crear',
            child: Text('Crear nueva necesidad'),
          ),
          const PopupMenuItem<String>(
            value: 'importar',
            child: Text('Importar necesidades'),
          ),
        ];
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
