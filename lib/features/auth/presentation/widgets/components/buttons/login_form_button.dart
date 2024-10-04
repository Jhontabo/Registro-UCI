import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/components/buttons/primary_button.dart';
import 'package:registro_uci/common/extensions/async_value_ui.dart';
import 'package:registro_uci/features/auth/data/dto/login_dto.dart';
import 'package:registro_uci/features/auth/presentation/controllers/auth_controller.dart';

class LoginFormButton extends ConsumerWidget {
  const LoginFormButton({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  })  : _formKey = formKey,
        _emailController = emailController,
        _passwordController = passwordController;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<void> state = ref.watch(authControllerProvider);

    ref.listen<AsyncValue<void>>(authControllerProvider, (prev, state) {
      state.dialogOnError(context);
    });

    return PrimaryButton(
      isLoading: state.isLoading,
      enabled: !state.isLoading,
      child: Text(
        "INGRESAR",
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
      ),
      onTap: () async {
        if (_formKey.currentState!.validate()) {
          final dto = LoginDto(
            email: _emailController.text,
            password: _passwordController.text,
          );

          await ref.read(authControllerProvider.notifier).login(dto);
        }
      },
    );
  }
}
