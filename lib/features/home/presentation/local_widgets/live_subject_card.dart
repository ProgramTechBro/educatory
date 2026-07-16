import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_typography.dart';
import '../../domain/entities/live_subject_entity.dart';

class LiveSubjectCard extends StatelessWidget {
  final LiveSubjectEntity subject;
  final VoidCallback onTap;

  const LiveSubjectCard({
    super.key,
    required this.subject,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        width: 159,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: subject.gradient,
          ),
          borderRadius: BorderRadius.circular(14),
          boxShadow: const [
            BoxShadow(
              color: Color(0x40000000),
              offset: Offset(0.5, 0.5),
              blurRadius: 2,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              subject.iconAsset,
              width: 32,
              height: 32,
              colorFilter: const ColorFilter.mode(
                AppColors.white,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(height: 12),
            RichText(
              text: TextSpan(
                style: AppTypography.bodyLargeSemiBold.copyWith(
                  color: AppColors.white,
                ),
                children: [
                  TextSpan(text: '${subject.title} ‧ '),
                  TextSpan(
                    text: subject.tutorCount,
                    style: AppTypography.bodyLargeRegular.copyWith(
                      color: AppColors.white.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
