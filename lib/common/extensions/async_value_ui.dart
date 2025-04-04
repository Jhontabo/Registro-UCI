import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/components/buttons/primary_button.dart';

extension AsyncValueUI on AsyncValue {
  void dialogOnError(BuildContext context) {
    if (!isLoading && hasError) {
      log(error.toString());
      final isException = error.toString().length > 10;
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(
              "Ha ocurrido un error",
              textAlign: TextAlign.center,
            ),
            content: isException
                ? Text(error.toString().substring(10))
                : Text(error.toString()),
            actions: [
              PrimaryButton(
                onTap: Navigator.of(context).pop,
                child: const Text(
                  "Entendido",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            ],
          );
        },
      );
    }
  }

  void popOnSuccess(AsyncValue? prev, BuildContext context) {
    if (!isLoading && !hasError && prev != null) {
      Navigator.of(context).pop();
    }
  }

  void dialogOnSuccess(AsyncValue? prev, String message, BuildContext context) {
    if (!isLoading && !hasError && prev != null) {
      Navigator.of(context).pop();
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(message),
            actions: [
              PrimaryButton(
                onTap: Navigator.of(context).pop,
                child: const Text(
                  "Entendido",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            ],
          );
        },
      );

      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text(
      //       message,
      //       style: const TextStyle(color: Colors.white),
      //     ),
      //     duration: const Duration(seconds: 2),
      //   ),
      // );
    }
  }
}
