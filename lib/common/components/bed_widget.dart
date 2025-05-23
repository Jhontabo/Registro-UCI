import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/features/ingresos/data/providers/ingreso_by_id_provider.dart';
import 'package:registro_uci/pages/ingreso/ingreso_details_page.dart';

class BedProviderWidget extends ConsumerWidget {
  const BedProviderWidget({
    super.key,
    this.isActive = true,
    this.redirectable = false,
    required this.idIngreso,
  });

  final bool isActive;
  final bool redirectable;
  final String idIngreso;

  @override
  Widget build(BuildContext context, ref) {
    final ingreso = ref.watch(ingresoByIdProvider(idIngreso));

    return ingreso.when(
      data: (data) {
        if (data == null) return const SizedBox();
        return Material(
          borderRadius: BorderRadius.circular(6),
          child: InkWell(
            borderRadius: BorderRadius.circular(6),
            onTap: redirectable
                ? () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return IngresoDetailsPage(idIngreso: idIngreso);
                      },
                    ));
                  }
                : null,
            child: Ink(
              decoration: BoxDecoration(
                color: isActive
                    ? Theme.of(context).colorScheme.secondary
                    : Colors.grey.shade400,
                borderRadius: BorderRadius.circular(6),
              ),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Row(
                mainAxisSize:
                    MainAxisSize.min, // 📌 Ajusta el tamaño al contenido
                children: [
                  const Icon(Icons.bed,
                      color: Colors.white,
                      size: 20), // 📌 Reduce el tamaño del icono
                  const SizedBox(
                      width: 5), // 📌 Agrega espacio entre icono y número
                  Text(
                    isActive ? data.cama : '---',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      error: (error, stackTrace) => const SizedBox(),
      loading: () => const SizedBox(),
    );
  }
}

class BedInfoWidget extends ConsumerWidget {
  const BedInfoWidget({
    super.key,
    this.isActive = true,
    this.redirectable = false,
    required this.bed,
  });

  final bool isActive;
  final bool redirectable;
  final String bed;

  @override
  Widget build(BuildContext context, ref) {
    return Material(
      borderRadius: BorderRadius.circular(6),
      child: InkWell(
        borderRadius: BorderRadius.circular(6),
        child: Ink(
          decoration: BoxDecoration(
            color: isActive
                ? Theme.of(context).colorScheme.secondary
                : Colors.grey.shade400,
            borderRadius: BorderRadius.circular(6),
          ),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Row(
            mainAxisSize:
                MainAxisSize.min, // 📌 Evita que se expanda más de lo necesario
            children: [
              const Icon(Icons.bed,
                  color: Colors.white,
                  size: 20), // 📌 Reduce el tamaño del icono
              const SizedBox(
                  width: 5), // 📌 Agrega espacio entre icono y número
              Text(
                isActive ? bed : '---',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
