import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/themes/light_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:registro_uci/features/auth/data/providers/is_logged_in_provider.dart';
import 'package:registro_uci/pages/create_monitoria_hemodinamica_page.dart';
import 'package:registro_uci/pages/ingreso_details_page.dart';
import 'package:registro_uci/pages/ingreso_page.dart';
import 'package:registro_uci/pages/ingresos_page.dart';
import 'package:registro_uci/pages/login_page.dart';
import 'package:registro_uci/pages/main_page.dart';
import 'firebase_options.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Intl.defaultLocale = 'es_ES';
  initializeDateFormatting('es_ES', null).then((_) {
    runApp(const ProviderScope(child: MyApp()));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
      ],
      home: Consumer(
        builder: (context, ref, child) {
          final isLoggedIn = ref.watch(isLoggedInProvider);

          // return const CreateMonitoriaHemodinamicaPage();

          if (isLoggedIn) {
            return const IngresosPage();
          } else {
            return const LoginPage();
          }
        },
      ),
    );
  }
}
