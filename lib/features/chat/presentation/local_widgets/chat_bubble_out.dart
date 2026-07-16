import 'package:flutter/material.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_typography.dart';

class ChatBubbleOut extends StatelessWidget {
  final String text;
  final String time;

  const ChatBubbleOut({super.key, required this.text, required this.time});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.75,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: AppColors.accent,
                border: Border.all(color: AppColors.buttonGlassBorder),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                boxShadow: AppColors.cardShadow,
              ),
              child: Text(
                text,
                style: AppTypography.bodySmallRegular.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            time,
            style: AppTypography.bodySmallRegular.copyWith(
              color: AppColors.chatTimeColor,
            ),
          ),
        ],
      ),
    );
  }
}
