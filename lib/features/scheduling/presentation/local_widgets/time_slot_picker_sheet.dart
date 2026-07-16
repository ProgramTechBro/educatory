import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_typography.dart';
import '../../../../core/shared_widgets/two_button_bottom_bar.dart';
import '../../data/datasources/scheduling_local_datasource.dart';
import '../bloc/schedule_tutoring_bloc.dart';
import '../bloc/schedule_tutoring_event.dart';
import '../bloc/schedule_tutoring_state.dart';
import 'time_slot_tile.dart';

class TimeSlotPickerSheet extends StatelessWidget {
  final VoidCallback onBackToCalendar;

  const TimeSlotPickerSheet({super.key, required this.onBackToCalendar});

  @override
  Widget build(BuildContext context) {
    final slots = SchedulingLocalDataSource().getTimeSlots();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 8),
        Container(
          width: 72,
          height: 4,
          decoration: BoxDecoration(
            color: AppColors.neutral200,
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: BlocBuilder<ScheduleTutoringBloc, ScheduleTutoringState>(
            builder: (context, state) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: onBackToCalendar,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        border: Border.all(color: AppColors.neutral300),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: AppColors.inputDropShadow,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  color: AppColors.orange100,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.calendar_today,
                                  size: 16,
                                  color: AppColors.orange500,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                state.selectedDate != null
                                    ? DateFormat('EEEE, d MMMM')
                                        .format(state.selectedDate!)
                                    : '',
                                style: AppTypography.bodyLargeMedium,
                              ),
                            ],
                          ),
                          const Icon(
                            Icons.chevron_right,
                            size: 20,
                            color: AppColors.neutral900,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            for (var i = 0; i < 5; i++) ...[
                              TimeSlotTile(
                                slot: slots[i],
                                isSelected: state.selectedSlotIndex == i,
                                onTap: () => context
                                    .read<ScheduleTutoringBloc>()
                                    .add(ScheduleSlotSelected(i)),
                              ),
                              if (i != 4) const SizedBox(height: 16),
                            ],
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          children: [
                            for (var i = 5; i < 10; i++) ...[
                              TimeSlotTile(
                                slot: slots[i],
                                isSelected: state.selectedSlotIndex == i,
                                onTap: () => context
                                    .read<ScheduleTutoringBloc>()
                                    .add(ScheduleSlotSelected(i)),
                              ),
                              if (i != 9) const SizedBox(height: 16),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        BlocBuilder<ScheduleTutoringBloc, ScheduleTutoringState>(
          builder: (context, state) {
            return TwoButtonBottomBar(
              trailingLabel: 'Confirm Slot',
              onTrailingTap: state.selectedSlotIndex != null
                  ? () => Navigator.of(context).pop()
                  : null,
            );
          },
        ),
      ],
    );
  }
}
