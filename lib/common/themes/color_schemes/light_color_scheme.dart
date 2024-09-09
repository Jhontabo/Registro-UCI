import 'package:flutter/material.dart';

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color.fromARGB(255, 48, 128, 100),
  onPrimary: Colors.white,
  secondary: Color.fromARGB(255, 255, 222, 182),
  onSecondary: Color.fromRGBO(14, 14, 14, 1),
  tertiary: Colors.tealAccent,
  onTertiary: Colors.white,
  error: Colors.pink,
  onError: Colors.white,
  primaryContainer: Colors.white,
  onPrimaryContainer: Color.fromARGB(255, 255, 255, 255),

  secondaryContainer: Colors.white, // google
  onSecondaryContainer: Color.fromARGB(255, 18, 18, 18),
  tertiaryContainer: Color(0xff486CB4), //facebook
  onTertiaryContainer: Colors.white,

  surfaceTint: Colors.grey,
  surface: Color.fromARGB(255, 255, 255, 255),
  onSurface: Color(0xff0e0e0e),

  onSurfaceVariant: Color.fromARGB(195, 34, 34, 34),

  primaryFixed: Colors.blue,
  secondaryFixed: Colors.pink,

  surfaceContainerHighest: Colors.white,
  outline: Colors.transparent,
  scrim: Colors.transparent,
);
