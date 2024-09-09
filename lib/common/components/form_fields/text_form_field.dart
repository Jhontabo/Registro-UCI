import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OutlinedTextFormField extends StatelessWidget {
  final String? initialValue;
  final String label;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final int? maxLines;
  final bool obscureText;
  final double borderRadius;
  final String hint;
  final Color? borderColor;
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final bool? autocorrect;
  final bool? readOnly;

  const OutlinedTextFormField({
    super.key,
    this.initialValue,
    this.label = '',
    this.controller,
    this.textInputType,
    this.validator,
    this.maxLines,
    this.obscureText = false,
    this.borderRadius = 7,
    this.hint = '',
    this.borderColor,
    this.prefixIcon,
    this.suffixIcon,
    this.autocorrect,
    this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      initialValue: initialValue,
      style: Theme.of(context).textTheme.bodyMedium,
      obscureText: obscureText,
      enableSuggestions: false,
      autocorrect: autocorrect ?? false,
      autofillHints: hint.isNotEmpty ? [hint] : null,
      showCursor: true,
      readOnly: readOnly ?? false,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hintText: hint,
        hintStyle:
            const TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
        isDense: true,
        label: label.isEmpty ? null : Text(label),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.surfaceTint,
            width: .8,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: borderColor ?? Theme.of(context).colorScheme.secondary,
            width: .8,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: borderColor ?? Theme.of(context).colorScheme.surfaceTint,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: borderColor ?? Theme.of(context).colorScheme.surfaceTint,
          ),
        ),
      ),
      inputFormatters: textInputType == TextInputType.number
          ? [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))]
          : null,
      keyboardType: textInputType,
      onTapOutside: (e) {
        FocusScope.of(context).unfocus();
      },
      validator: validator,
    );
  }
}
