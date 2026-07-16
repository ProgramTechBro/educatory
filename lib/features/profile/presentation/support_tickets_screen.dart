import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_typography.dart';
import '../../../routes/app_routes.dart';
import '../data/datasources/support_tickets_local_datasource.dart';
import 'local_widgets/create_ticket_sheet.dart';
import 'local_widgets/support_ticket_card.dart';

class SupportTicketsScreen extends StatelessWidget {
  const SupportTicketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tickets = SupportTicketsLocalDataSource().getSupportTickets();

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(
            Icons.chevron_left,
            size: 24,
            color: AppColors.neutral900,
          ),
        ),
        title: Text(
          'Support Tickets',
          style: AppTypography.bodyLargeRegular.copyWith(
            color: AppColors.neutral900,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Support Tickets', style: AppTypography.h3SemiBold),
                ElevatedButton.icon(
                  onPressed: () => CreateTicketSheet.show(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accent,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  icon: const Icon(
                    Icons.add_circle_outline,
                    size: 16,
                    color: AppColors.white,
                  ),
                  label: Text(
                    'New Ticket',
                    style: AppTypography.bodyLargeMedium.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            for (final ticket in tickets) ...[
              SupportTicketCard(
                ticket: ticket,
                onTap: () =>
                    context.push(AppRoutes.supportTicketDetail, extra: ticket),
              ),
              if (ticket != tickets.last) const SizedBox(height: 12),
            ],
          ],
        ),
      ),
    );
  }
}
