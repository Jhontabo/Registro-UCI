import 'package:flutter/material.dart';

class LiteTile extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData? iconData;
  final String title;
  final bool reversed;
  final Widget? trailingIcon;
  const LiteTile({
    super.key,
    this.onTap,
    this.iconData,
    required this.title,
    this.reversed = false,
    this.trailingIcon,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Visibility(
                    visible: iconData != null,
                    child: Row(
                      children: [
                        Icon(
                          iconData,
                          color: Theme.of(context).colorScheme.primary,
                          size: 28,
                        ),
                        const SizedBox(width: 20),
                      ],
                    ),
                  ),
                  Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                ],
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
