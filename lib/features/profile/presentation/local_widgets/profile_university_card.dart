import 'package:flutter/material.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_typography.dart';

class ProfileUniversityCard extends StatelessWidget {
  const ProfileUniversityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: AppColors.inputDropShadow,
      ),
      child: Column(
        children: [
          _InfoRow(label: 'University ID', value: '189204 8923'),
          const SizedBox(height: 12),
          const Divider(height: 1, color: AppColors.neutral200),
          const SizedBox(height: 12),
          _InfoRow(
            label: 'Department',
            value: 'Computer Science Engineering',
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTypography.bodyLargeRegular.copyWith(
            color: AppColors.neutral700,
          ),
        ),
        Flexible(
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: AppTypography.bodyLargeMedium,
          ),
        ),
      ],
    );
  }
}
