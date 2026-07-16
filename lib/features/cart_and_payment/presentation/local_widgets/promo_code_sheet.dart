import 'package:flutter/material.dart';
import '../../../../config/app_colors.dart';
import '../../../../core/shared_widgets/app_text_field.dart';
import '../../../../core/shared_widgets/two_button_bottom_bar.dart';

class PromoCodeSheet extends StatelessWidget {
  const PromoCodeSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (context) => const PromoCodeSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 8),
          Container(
            width: 72,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.neutral200,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: AppTextField(label: 'Promocode', hint: 'Promo123'),
          ),
          const SizedBox(height: 24),
          TwoButtonBottomBar(
            leadingLabel: 'Cancel',
            onLeadingTap: () => Navigator.of(context).pop(),
            trailingLabel: 'Apply Code',
            onTrailingTap: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
