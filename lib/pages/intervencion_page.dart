import 'package:flutter/material.dart';
import 'package:registro_uci/features/intervenciones/domain/models/intervencion.dart';

class IntervencionPage extends StatelessWidget {
  final Intervencion intervencion;
  const IntervencionPage({
    super.key,
    required this.intervencion,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${intervencion.idNIC}: ${intervencion.nombre}"),
      ),
    );
  }
}
