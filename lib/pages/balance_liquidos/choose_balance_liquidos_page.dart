import 'package:flutter/material.dart';
import 'package:registro_uci/features/balance_liquidos/balance_liquidos_administrados/data/providers/liquidos_administrados_provider.dart';
import 'package:registro_uci/features/balance_liquidos/data/providers/balances_de_liquidos_provider.dart';
import 'package:registro_uci/features/balance_liquidos/domain/models/balance_de_liquidos.dart';
import 'package:registro_uci/pages/balance_liquidos/liquidos_administrados_screen.dart';

class ChooseBalanceLiquidosPage extends StatelessWidget {
  final BalancesDeLiquidosParams params;
  final BalanceDeLiquidos balance;

  const ChooseBalanceLiquidosPage(
      {super.key, required this.params, required this.balance});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gestión de Líquidos"),
      ),
      backgroundColor: const Color(0xFFF7F9FC), // Light background color
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // "Líquidos Administrados" Button
            OptionButton(
              title: "Líquidos Administrados",
              icon: Icons.local_drink_outlined,
              color: const Color(0xFF4A90E2), // Blue color
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LiquidosAdministradosScreen(
                      params: LiquidosAdministradosParams(
                        idIngreso: params.idIngreso,
                        idRegistroDiario: params.idRegistroDiario,
                        idBalanceLiquidos: balance.idBalanceDeLiquidos,
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 30),
            // "Líquidos Eliminados" Button
            OptionButton(
              title: "Líquidos Eliminados",
              icon: Icons.delete_outline,
              color: const Color(0xFF6ABF69), // Soft green color
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => LiquidosEliminadosPage()),
                // );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Custom widget for option buttons
class OptionButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  const OptionButton({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 5,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Row(
            children: [
              // Icon
              CircleAvatar(
                radius: 30,
                backgroundColor: color.withOpacity(0.1),
                child: Icon(icon, color: color, size: 30),
              ),
              const SizedBox(width: 20),
              // Title Text
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  color: color,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
