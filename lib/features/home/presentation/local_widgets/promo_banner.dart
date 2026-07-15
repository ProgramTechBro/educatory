import 'package:flutter/material.dart';
import '../../../../config/app_assets.dart';

class PromoBanner extends StatelessWidget {
  final VoidCallback onRedeemTap;

  const PromoBanner({super.key, required this.onRedeemTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onRedeemTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: SizedBox(
              height: 120,
              width: double.infinity,
              child: Image.asset(
                AppImages.dashboardBannerBackground,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            right: 4,
            bottom: 0,
            child: SizedBox(
              height: 150,
              child: Image.asset(
                AppImages.dashboardBannerBoy,
                fit: BoxFit.contain,
                alignment: Alignment.bottomCenter,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
