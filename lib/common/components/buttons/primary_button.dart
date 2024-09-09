import 'package:flutter/material.dart';
import 'package:registro_uci/common/components/loading/loading_button_indicator.dart';

class PrimaryButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final double? minWidth;
  final double? minHeight;
  final Color? backgroundColor;
  final Color? hoverColor;
  final bool enabled;
  final bool isLoading;
  const PrimaryButton({
    super.key,
    required this.child,
    required this.onTap,
    this.minWidth,
    this.minHeight,
    this.backgroundColor,
    this.hoverColor,
    this.enabled = true,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: enabled && !isLoading ? onTap : null,
        splashColor: Colors.tealAccent,
        hoverColor: hoverColor ?? Colors.tealAccent.withOpacity(.5),
        borderRadius: BorderRadius.circular(7),
        child: Ink(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: enabled
                ? backgroundColor ?? Theme.of(context).colorScheme.primary
                : Colors.grey.shade400,
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: minWidth ?? 0,
              minHeight: minHeight ?? 0,
            ),
            child: isLoading
                ? const LoadingButtonIndicator()
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      child,
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
