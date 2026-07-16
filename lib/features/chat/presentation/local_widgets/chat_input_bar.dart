import 'package:flutter/material.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_typography.dart';

class ChatInputBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;

  const ChatInputBar({
    super.key,
    required this.controller,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.fromLTRB(24, 20, 24, 8),
        decoration: const BoxDecoration(
          color: AppColors.white,
          border: Border(top: BorderSide(color: AppColors.neutral200)),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.emoji_emotions_outlined,
              size: 24,
              color: AppColors.neutral500,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(color: AppColors.neutral300),
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: AppColors.inputDropShadow,
                ),
                child: TextField(
                  controller: controller,
                  onSubmitted: (_) => onSend(),
                  style: AppTypography.bodyLargeRegular.copyWith(
                    color: AppColors.neutral900,
                  ),
                  decoration: InputDecoration(
                    isDense: true,
                    border: InputBorder.none,
                    hintText: 'Write your message...',
                    hintStyle: AppTypography.bodyLargeRegular.copyWith(
                      color: AppColors.neutral500,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            const Icon(
              Icons.attach_file,
              size: 24,
              color: AppColors.neutral500,
            ),
            const SizedBox(width: 16),
            IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: onSend,
              icon: const Icon(
                Icons.mic_none_outlined,
                size: 24,
                color: AppColors.neutral500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
