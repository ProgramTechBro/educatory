import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_typography.dart';
import '../../../../core/shared_widgets/app_bottom_sheet.dart';
import '../../../../core/shared_widgets/app_text_field.dart';
import '../../../../core/shared_widgets/two_button_bottom_bar.dart';
import '../bloc/create_ticket/create_ticket_bloc.dart';
import '../bloc/create_ticket/create_ticket_event.dart';
import '../bloc/create_ticket/create_ticket_state.dart';

const List<String> _subjectOptions = [
  'Login Issue',
  'Payment Issue',
  'Course Access',
  'Technical Bug',
  'Other',
];

const List<String> _priorityOptions = ['Low', 'Medium', 'High', 'Urgent'];

class CreateTicketSheet extends StatelessWidget {
  const CreateTicketSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (context) => BlocProvider(
        create: (context) => CreateTicketBloc(),
        child: const CreateTicketSheet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();
    final bloc = context.read<CreateTicketBloc>();

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          Container(
            width: 72,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.neutral200,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Create a Support Ticket',
                      style: AppTypography.h3SemiBold,
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(
                        Icons.close,
                        size: 24,
                        color: AppColors.neutral500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                BlocBuilder<CreateTicketBloc, CreateTicketState>(
                  builder: (context, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppTextField(
                          label: 'Subject',
                          hint: state.subject ?? 'Choose a Subject',
                          readOnly: true,
                          suffixIcon: const Icon(
                            Icons.keyboard_arrow_down,
                            size: 20,
                            color: AppColors.neutral500,
                          ),
                          onTap: () async {
                            final result =
                                await AppBottomSheet.showOptionPicker(
                              context: context,
                              title: 'Select a Subject',
                              options: _subjectOptions,
                            );
                            if (result != null) {
                              bloc.add(CreateTicketSubjectChanged(result));
                            }
                          },
                        ),
                        const SizedBox(height: 16),
                        AppTextField(
                          label: 'Ticket title',
                          hint: 'Choose a Subject',
                          controller: titleController,
                        ),
                        const SizedBox(height: 16),
                        AppTextField(
                          label: 'Priority',
                          hint: state.priority ?? 'Choose a Priority',
                          readOnly: true,
                          suffixIcon: const Icon(
                            Icons.keyboard_arrow_down,
                            size: 20,
                            color: AppColors.neutral500,
                          ),
                          onTap: () async {
                            final result =
                                await AppBottomSheet.showOptionPicker(
                              context: context,
                              title: 'Select a Priority',
                              options: _priorityOptions,
                            );
                            if (result != null) {
                              bloc.add(CreateTicketPriorityChanged(result));
                            }
                          },
                        ),
                        const SizedBox(height: 16),
                        AppTextField(
                          label: 'Description',
                          hint: "e.g. client didn't meet...",
                          controller: descriptionController,
                          maxLines: 3,
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          TwoButtonBottomBar(
            leadingLabel: 'Cancel',
            onLeadingTap: () => Navigator.of(context).pop(),
            trailingLabel: 'Create Ticket',
            onTrailingTap: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
