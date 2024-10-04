import 'package:flutter/material.dart';
import 'package:registro_uci/common/components/form_fields/text_form_field.dart';
import 'package:registro_uci/features/auth/presentation/widgets/components/buttons/login_form_button.dart';
import 'package:registro_uci/features/auth/presentation/widgets/validators/email_validator.dart';
import 'package:registro_uci/features/auth/presentation/widgets/validators/password_validator.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  bool obscuredPassword = true;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.8,
      ),
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      width: MediaQuery.of(context).size.width * .8,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Registro Diario UCI",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 28,
                ),
                textAlign: TextAlign.center,
              ),
              const Text(
                "Inicio de Sesión",
                style: TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              Image.asset(
                'assets/images/logo.png',
                height: 200,
              ),
              const SizedBox(height: 15),
              OutlinedTextFormField(
                label: "Correo",
                maxLines: 1,
                controller: _emailController,
                validator: emailValidator,
                borderColor: Theme.of(context).colorScheme.primary,
                prefixIcon: const Icon(
                  Icons.mail,
                  size: 25,
                ),
                autocorrect: true,
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 15),
              OutlinedTextFormField(
                label: "Contraseña",
                controller: _passwordController,
                validator: passwordValidator,
                obscureText: obscuredPassword,
                maxLines: 1,
                borderColor: Theme.of(context).colorScheme.primary,
                prefixIcon: const Icon(
                  Icons.password,
                  size: 25,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      obscuredPassword = !obscuredPassword;
                    });
                  },
                  icon: obscuredPassword
                      ? const Icon(
                          Icons.remove_red_eye,
                          size: 25,
                        )
                      : const Icon(
                          Icons.visibility_off,
                          size: 25,
                        ),
                ),
              ),
              const SizedBox(height: 30),
              LoginFormButton(
                formKey: _formKey,
                emailController: _emailController,
                passwordController: _passwordController,
              )
            ],
          ),
        ),
      ),
    );
  }
}
