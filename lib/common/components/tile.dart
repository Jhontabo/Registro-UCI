import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData iconData;
  final String title;
  final String subtitle;
  final bool reversed;
  final Widget? trailingIcon;
  const Tile({
    super.key,
    this.onTap,
    required this.iconData,
    required this.title,
    required this.subtitle,
    this.reversed = false,
    this.trailingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(7),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
          ),
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Icon(
                iconData,
                color: Theme.of(context).colorScheme.primary,
                size: 28,
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: reversed
                      ? [
                          Text(
                            subtitle,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Text(
                            title,
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ]
                      : [
                          Text(
                            title,
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Text(
                            subtitle,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                ),
              ),
              const SizedBox(width: 20),
              trailingIcon ??
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Theme.of(context).colorScheme.surfaceTint,
                  )
            ],
          ),
        ),
      ),
    );
  }
}
