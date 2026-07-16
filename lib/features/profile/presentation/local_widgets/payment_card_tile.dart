import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../config/app_assets.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_typography.dart';
import '../../domain/entities/payment_card_entity.dart';

class PaymentCardTile extends StatelessWidget {
  final PaymentCardEntity card;
  final VoidCallback onRemoveTap;

  const PaymentCardTile({
    super.key,
    required this.card,
    required this.onRemoveTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: const BoxDecoration(
              color: AppColors.purple50,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: card.type == PaymentCardType.visa
                ? const Icon(
                    Icons.credit_card,
                    size: 24,
                    color: AppColors.accent,
                  )
                : SvgPicture.asset(AppIcons.paypal, width: 24, height: 24),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(card.label, style: AppTypography.bodyLargeMedium),
                Text(
                  card.subtitle,
                  style: AppTypography.bodySmallRegular.copyWith(
                    color: AppColors.neutral500,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onRemoveTap,
            icon: const Icon(
              Icons.delete_outline,
              size: 24,
              color: AppColors.accent,
            ),
          ),
        ],
      ),
    );
  }
}
