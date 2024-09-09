import 'package:flutter/material.dart';

class EnumDropdownButtonFormField<T> extends StatelessWidget {
  final String label;
  final List<T> values;
  final Function(T?) onSelected;
  final String? Function(T?)? validator;
  final T? value;

  const EnumDropdownButtonFormField({
    super.key,
    required this.label,
    required this.onSelected,
    required this.values,
    this.validator,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      menuMaxHeight: 500,
      items: values.map<DropdownMenuItem<T>>(
        (T value) {
          return DropdownMenuItem<T>(
            value: value,
            child: Row(
              children: [
                Text(
                  value.toString(),
                ),
              ],
            ),
          );
        },
      ).toList(),
      onChanged: onSelected,
      dropdownColor: Theme.of(context).colorScheme.surface,
      decoration: InputDecoration(
        label: Text(
          label,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Theme.of(context).colorScheme.primary),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        suffixIconColor: Colors.grey,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      style: Theme.of(context).textTheme.bodyMedium,
      iconEnabledColor: Theme.of(context).colorScheme.primary,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
