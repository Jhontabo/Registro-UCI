import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:registro_uci/features/firmas/domain/models/firma.dart';

class FirmaWidget extends StatefulWidget {
  final Firma firma;

  const FirmaWidget({super.key, required this.firma});

  @override
  FirmaWidgetState createState() => FirmaWidgetState();
}

class FirmaWidgetState extends State<FirmaWidget> {
  bool _isExpanded = false; // Tracks if the widget is expanded or not

  @override
  Widget build(BuildContext context) {
    // Format the date and time elegantly
    final DateFormat dateFormat = DateFormat('EEEE, MMMM d');
    final DateFormat timeFormat = DateFormat('hh:mm a');

    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded; // Toggle expanded state on tap
        });
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedContainer(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              duration: const Duration(milliseconds: 300), // Animation duration
              curve: Curves.easeInOut, // Smooth curve for animation
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.amber.shade50,
              ),
              width: MediaQuery.of(context).size.width * .7,
              // Animate height based on expanded state
              height: _isExpanded
                  ? 140
                  : 50, // Adjust height for expanded/compressed
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Header for Certificate Style
                      Text(
                        'Reporte Firmado',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade800,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            AnimatedOpacity(
              opacity: _isExpanded ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: Visibility(
                visible: _isExpanded,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (true) ...[
                      const SizedBox(height: 40),
                      // Firma Name styled as signature
                      Text(
                        widget.firma.nombreFirma,
                        style: const TextStyle(
                          fontFamily:
                              'Sacramento', // Custom font for signature style
                          fontSize: 35,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87,
                          height: .6,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      // Divider(
                      //   color: Colors.grey.shade400,
                      //   thickness: 1.0,
                      // ),
                      // Display Firma Date and Time
                      Text(
                        'Fecha: ${dateFormat.format(widget.firma.fechaFirma)}\nHora: ${timeFormat.format(widget.firma.fechaFirma)}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
