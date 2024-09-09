import 'package:flutter/material.dart';
import 'package:registro_uci/common/components/icon_buttons/go_back_icon_button.dart';
import 'package:registro_uci/common/components/icon_buttons/go_forward_icon_button.dart';

class PaginationWidget extends StatelessWidget {
  const PaginationWidget({
    super.key,
    required this.totalPages,
    required this.currentPage,
    required this.onForward,
    required this.onBack,
  });

  final int totalPages;
  final int currentPage;
  final VoidCallback onForward;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    final bool isLastPage = currentPage == totalPages;
    final bool isFirstPage = currentPage == 1;

    return Container(
      color: Theme.of(context).colorScheme.surfaceContainer,
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GoBackButton(
            onTap: onBack,
            enabled: !isFirstPage,
          ),
          Text(
            "Página $currentPage de ${totalPages == 0 ? 1 : totalPages}",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          GoForwardButton(
            onTap: onForward,
            enabled: !isLastPage && totalPages != 0,
          ),
        ],
      ),
    );
  }
}
