import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:registro_uci/features/auth/presentation/controllers/auth_controller.dart';

final userNameProvider = Provider<String?>((ref) {
  return ref.watch(authControllerProvider).when(
        data: (data) {
          return data.user?.name;
        },
        error: (error, stackTrace) => null,
        loading: () => null,
      );
});
