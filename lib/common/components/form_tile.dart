import 'package:flutter/material.dart';

class FormTile extends StatelessWidget {
  final VoidCallback? onTap;
  final bool completed;

  final String title;
  final String subtitle;
  final bool reversed;
  final Widget? trailingIcon;
  const FormTile({
    super.key,
    this.onTap,
    required this.completed,
    required this.title,
    required this.subtitle,
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
            children: [
              completed
                  ? const Icon(
                      Icons.check_circle,
                      color: Colors.teal,
                      size: 28,
                    )
                  : Icon(
                      Icons.circle_outlined,
                      color: Colors.grey.shade400,
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
