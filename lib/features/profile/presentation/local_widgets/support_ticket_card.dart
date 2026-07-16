import 'package:flutter/material.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_typography.dart';
import '../../domain/entities/support_ticket_entity.dart';
import 'status_pill.dart';

class SupportTicketCard extends StatelessWidget {
  final SupportTicketEntity ticket;
  final VoidCallback onTap;

  const SupportTicketCard({
    super.key,
    required this.ticket,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.neutral300),
          borderRadius: BorderRadius.circular(12),
          boxShadow: AppColors.inputDropShadow,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  ticket.ticketNumber,
                  style: AppTypography.bodySmallRegular.copyWith(
                    color: AppColors.primary,
                  ),
                ),
                Text(
                  ticket.timeAgo,
                  style: AppTypography.bodySmallRegular.copyWith(
                    color: AppColors.neutral500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(ticket.subject, style: AppTypography.h4Medium),
            Text(
              ticket.previewText,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTypography.bodySmallRegular.copyWith(
                color: AppColors.neutral600,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                StatusPill(
                  label: ticket.status,
                  borderColor: AppColors.primary,
                  showChevron: true,
                ),
                const SizedBox(width: 8),
                StatusPill(
                  label: ticket.priority,
                  borderColor: AppColors.red500,
                  showChevron: true,
                ),
                const SizedBox(width: 8),
                StatusPill(
                  label: '${ticket.commentCount}',
                  borderColor: AppColors.neutral300,
                  contentColor: AppColors.neutral500,
                  leadingIcon: Icons.mode_comment_outlined,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
