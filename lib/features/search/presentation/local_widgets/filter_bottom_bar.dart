import 'package:flutter/material.dart';
import '../../../../config/app_colors.dart';
import '../../../../core/shared_widgets/app_button.dart';

class FilterBottomBar extends StatelessWidget {
  final VoidCallback onReset;
  final VoidCallback onApply;

  const FilterBottomBar({
    super.key,
    required this.onReset,
    required this.onApply,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
        decoration: const BoxDecoration(
          color: AppColors.white,
          border: Border(top: BorderSide(color: AppColors.neutral200)),
        ),
        child: Row(
          children: [
            Expanded(
              child: AppButton(
                label: 'Reset Filter',
                variant: AppButtonVariant.outline,
                height: 40,
                onPressed: onReset,
              ),
            ),
            const SizedBox(width: 11),
            Expanded(
              child: AppButton(
                label: 'Apply Filter',
                height: 40,
                onPressed: onApply,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
