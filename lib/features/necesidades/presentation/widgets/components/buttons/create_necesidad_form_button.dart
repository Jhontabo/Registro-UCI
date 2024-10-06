import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/common/components/buttons/primary_button.dart';
import 'package:registro_uci/common/extensions/async_value_ui.dart';
import 'package:registro_uci/features/firmas/domain/models/necesidades_params.dart';
import 'package:registro_uci/features/necesidades/data/dto/create_necesidad_dto.dart';
import 'package:registro_uci/features/necesidades/presentation/controllers/add_necesidad_controller.dart';

class CreateNecesidadFormButton extends ConsumerWidget {
  const CreateNecesidadFormButton({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController nombreNecesidadController,
    required this.params,
  })  : _formKey = formKey,
        _nombreNecesidadController = nombreNecesidadController;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _nombreNecesidadController;
  final ReporteParams params;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<void> state =
        ref.watch(addNecesidadToRegistroControllerProvider);

    ref.listen<AsyncValue<void>>(addNecesidadToRegistroControllerProvider,
        (prev, state) {
      state.dialogOnError(context);
      state.popOnSuccess(prev, context);
    });

    return PrimaryButton(
      isLoading: state.isLoading,
      enabled: !state.isLoading,
      child: Text(
        "CREAR NECESIDAD",
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
      ),
      onTap: () async {
        if (_formKey.currentState!.validate()) {
          final dto = CreateNecesidadDto(
            nombreNecesidad: _nombreNecesidadController.text,
          );

          await ref
              .read(addNecesidadToRegistroControllerProvider.notifier)
              .addNecesidadToRegistro(params.idIngreso, params.idRegistro, dto);
        }
      },
    );
  }
}
