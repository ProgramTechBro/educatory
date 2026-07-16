import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_typography.dart';
import '../../domain/entities/contact_entity.dart';

class ChatProfileHeader extends StatelessWidget {
  final ContactEntity contact;
  final VoidCallback onCallTap;
  final VoidCallback onVideoTap;

  const ChatProfileHeader({
    super.key,
    required this.contact,
    required this.onCallTap,
    required this.onVideoTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border(bottom: BorderSide(color: AppColors.neutral200)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Stack(
                children: [
                  ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: contact.avatar,
                      width: 56,
                      height: 56,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        color: contact.isOnline
                            ? AppColors.green500
                            : AppColors.neutral300,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.white, width: 2),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 8),
              Text(contact.name, style: AppTypography.h4Medium),
              const SizedBox(width: 5),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: AppColors.neutral200,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Text(
                  contact.subjectTag,
                  style: AppTypography.bodySmallRegular.copyWith(
                    color: AppColors.neutral600,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                onPressed: onCallTap,
                icon: const Icon(
                  Icons.call_outlined,
                  size: 24,
                  color: AppColors.neutral900,
                ),
              ),
              IconButton(
                onPressed: onVideoTap,
                icon: const Icon(
                  Icons.videocam_outlined,
                  size: 24,
                  color: AppColors.neutral900,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
