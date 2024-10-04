import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData? iconData;
  final Color? iconColor;
  final String title;
  final String subtitle;
  final bool reversed;
  final Widget? trailingIcon;
  const Tile({
    super.key,
    this.onTap,
    this.iconData,
    required this.title,
    required this.subtitle,
    this.reversed = false,
    this.trailingIcon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      elevation: 2,
      child: InkWell(
        splashColor: const Color(0xff69C335).withOpacity(.3),
        hoverColor: const Color(0xff69C335).withOpacity(.3),
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Visibility(
                visible: iconData != null,
                child: Icon(
                  iconData,
                  color: iconColor ?? Theme.of(context).colorScheme.primary,
                  size: 28,
                ),
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
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            title,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                        ]
                      : [
                          Text(
                            title,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                          Text(
                            subtitle,
                            style: Theme.of(context).textTheme.bodySmall,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
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
