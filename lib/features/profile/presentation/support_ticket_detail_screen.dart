import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_typography.dart';
import '../domain/entities/support_ticket_entity.dart';
import 'bloc/support_ticket_detail/support_ticket_detail_bloc.dart';
import 'bloc/support_ticket_detail/support_ticket_detail_event.dart';
import 'bloc/support_ticket_detail/support_ticket_detail_state.dart';
import 'local_widgets/status_pill.dart';

class SupportTicketDetailScreen extends StatelessWidget {
  final SupportTicketEntity ticket;

  const SupportTicketDetailScreen({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SupportTicketDetailBloc(initialMessages: ticket.messages),
      child: _SupportTicketDetailScreenBody(ticket: ticket),
    );
  }
}

class _SupportTicketDetailScreenBody extends StatefulWidget {
  final SupportTicketEntity ticket;

  const _SupportTicketDetailScreenBody({required this.ticket});

  @override
  State<_SupportTicketDetailScreenBody> createState() =>
      _SupportTicketDetailScreenBodyState();
}

class _SupportTicketDetailScreenBodyState
    extends State<_SupportTicketDetailScreenBody> {
  final TextEditingController _replyController = TextEditingController();

  @override
  void dispose() {
    _replyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          widget.ticket.subject,
          style: AppTypography.bodyLargeRegular.copyWith(
            color: AppColors.neutral900,
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          decoration: const BoxDecoration(
            color: AppColors.white,
            border: Border(top: BorderSide(color: AppColors.neutral200)),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.image_outlined,
                size: 24,
                color: AppColors.neutral500,
              ),
              const SizedBox(width: 16),
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
                    controller: _replyController,
                    onSubmitted: (text) {
                      context.read<SupportTicketDetailBloc>().add(
                            SupportTicketReplySent(text),
                          );
                      _replyController.clear();
                    },
                    style: AppTypography.bodyLargeRegular.copyWith(
                      color: AppColors.neutral900,
                    ),
                    decoration: InputDecoration(
                      isDense: true,
                      border: InputBorder.none,
                      hintText: 'Write your problems, recommen...',
                      hintStyle: AppTypography.bodyLargeRegular.copyWith(
                        color: AppColors.neutral500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: BlocBuilder<SupportTicketDetailBloc, SupportTicketDetailState>(
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (final message in state.messages) ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.ticket.ticketNumber,
                        style: AppTypography.bodySmallRegular.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                      Text(
                        message.timeAgo,
                        style: AppTypography.bodySmallRegular.copyWith(
                          color: AppColors.neutral500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(widget.ticket.subject, style: AppTypography.h4Medium),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      StatusPill(
                        label: widget.ticket.status,
                        borderColor: AppColors.primary,
                        showChevron: true,
                      ),
                      const SizedBox(width: 8),
                      StatusPill(
                        label: widget.ticket.priority,
                        borderColor: AppColors.red500,
                        showChevron: true,
                      ),
                      const SizedBox(width: 8),
                      StatusPill(
                        label: '${widget.ticket.commentCount}',
                        borderColor: AppColors.neutral300,
                        contentColor: AppColors.neutral500,
                        leadingIcon: Icons.mode_comment_outlined,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    message.body,
                    style: AppTypography.bodyLargeRegular.copyWith(
                      color: AppColors.neutral700,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Text(
                        'Updated',
                        style: AppTypography.bodySmallRegular.copyWith(
                          color: AppColors.neutral500,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        message.timeAgo,
                        style: AppTypography.bodySmallMedium.copyWith(
                          color: AppColors.neutral900,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        width: 1,
                        height: 16,
                        color: AppColors.neutral200,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Updated by',
                        style: AppTypography.bodySmallRegular.copyWith(
                          color: AppColors.neutral500,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        message.updatedBy,
                        style: AppTypography.bodySmallMedium.copyWith(
                          color: AppColors.neutral900,
                        ),
                      ),
                    ],
                  ),
                  if (message != state.messages.last) ...[
                    const SizedBox(height: 20),
                    const Divider(height: 1, color: AppColors.neutral200),
                    const SizedBox(height: 20),
                  ],
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}
