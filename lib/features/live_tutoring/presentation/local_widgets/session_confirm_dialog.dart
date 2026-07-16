import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../config/app_assets.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_typography.dart';
import '../../../../core/shared_widgets/app_button.dart';

class SessionConfirmDialog extends StatelessWidget {
  final String tutorName;

  const SessionConfirmDialog({super.key, required this.tutorName});

  static Future<bool?> show(BuildContext context, String tutorName) {
    return showDialog<bool>(
      context: context,
      builder: (context) => SessionConfirmDialog(tutorName: tutorName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () => Navigator.of(context).pop(false),
                icon: const Icon(
                  Icons.close,
                  size: 24,
                  color: AppColors.neutral500,
                ),
              ),
            ),
            const SizedBox(height: 16),
            SvgPicture.asset(
              AppIcons.sessionRequestIllustration,
              height: 137,
            ),
            const SizedBox(height: 24),
            Text('Send a Request?', style: AppTypography.h3SemiBold),
            const SizedBox(height: 8),
            Text(
              'Send 1 hour video teaching session request to $tutorName?',
              textAlign: TextAlign.center,
              style: AppTypography.bodyLargeRegular.copyWith(
                color: AppColors.neutral600,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    label: 'No, Cancel',
                    variant: AppButtonVariant.outline,
                    height: 40,
                    onPressed: () => Navigator.of(context).pop(false),
                  ),
                ),
                const SizedBox(width: 11),
                Expanded(
                  child: AppButton(
                    label: 'Send Now',
                    height: 40,
                    onPressed: () => Navigator.of(context).pop(true),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
