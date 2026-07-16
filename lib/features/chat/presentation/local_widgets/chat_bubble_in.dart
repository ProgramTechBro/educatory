import 'package:flutter/material.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_typography.dart';

class ChatBubbleIn extends StatelessWidget {
  final String text;
  final String time;

  const ChatBubbleIn({super.key, required this.text, required this.time});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                color: AppColors.white,
                border: Border.all(color: AppColors.neutral300),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                boxShadow: AppColors.inputDropShadow,
              ),
              child: Text(
                text,
                style: AppTypography.bodySmallRegular.copyWith(
                  color: AppColors.neutral600,
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
