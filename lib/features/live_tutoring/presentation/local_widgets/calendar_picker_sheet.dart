import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_typography.dart';
import '../bloc/schedule_tutoring_bloc.dart';
import '../bloc/schedule_tutoring_event.dart';
import '../bloc/schedule_tutoring_state.dart';

class CalendarPickerSheet extends StatelessWidget {
  const CalendarPickerSheet({super.key});

  List<DateTime> _buildGridDays(DateTime month) {
    final firstDayOfMonth = DateTime(month.year, month.month, 1);
    final leadingDays = firstDayOfMonth.weekday - 1;
    final gridStart = firstDayOfMonth.subtract(Duration(days: leadingDays));
    return List.generate(42, (index) => gridStart.add(Duration(days: index)));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 72,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.neutral200,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            const SizedBox(height: 24),
            BlocBuilder<ScheduleTutoringBloc, ScheduleTutoringState>(
              builder: (context, state) {
                final days = _buildGridDays(state.visibleMonth);

                return Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        border: Border.all(color: AppColors.neutral300),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: AppColors.inputDropShadow,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () => context
                                .read<ScheduleTutoringBloc>()
                                .add(const ScheduleMonthChanged(-1)),
                            icon: const Icon(Icons.chevron_left, size: 24),
                            color: AppColors.neutral900,
                          ),
                          Text(
                            DateFormat('MMMM')
                                .format(state.visibleMonth)
                                .toUpperCase(),
                            style: AppTypography.bodyLargeRegular.copyWith(
                              color: AppColors.neutral900,
                            ),
                          ),
                          IconButton(
                            onPressed: () => context
                                .read<ScheduleTutoringBloc>()
                                .add(const ScheduleMonthChanged(1)),
                            icon: const Icon(Icons.chevron_right, size: 24),
                            color: AppColors.neutral900,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        for (final label in const [
                          'Mon',
                          'Tue',
                          'Wed',
                          'Thu',
                          'Fri',
                          'Sat',
                          'Sun',
                        ])
                          Expanded(
                            child: Center(
                              child: Text(
                                label,
                                style: AppTypography.bodyLargeRegular
                                    .copyWith(color: AppColors.neutral800),
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    for (var row = 0; row < 6; row++)
                      Row(
                        children: [
                          for (var col = 0; col < 7; col++)
                            _DayCell(
                              date: days[row * 7 + col],
                              visibleMonth: state.visibleMonth,
                              selectedDate: state.selectedDate,
                            ),
                        ],
                      ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _DayCell extends StatelessWidget {
  final DateTime date;
  final DateTime visibleMonth;
  final DateTime? selectedDate;

  const _DayCell({
    required this.date,
    required this.visibleMonth,
    required this.selectedDate,
  });

  bool get _isCurrentMonth => date.month == visibleMonth.month;

  bool get _isSelected =>
      selectedDate != null &&
      selectedDate!.year == date.year &&
      selectedDate!.month == date.month &&
      selectedDate!.day == date.day;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: _isCurrentMonth
            ? () {
                context
                    .read<ScheduleTutoringBloc>()
                    .add(ScheduleDateSelected(date));
                Navigator.of(context).pop();
              }
            : null,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 46,
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(vertical: 1),
          decoration: BoxDecoration(
            color: _isSelected ? AppColors.accent : Colors.transparent,
            border: _isSelected
                ? Border.all(color: AppColors.buttonGlassBorder)
                : null,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            '${date.day}',
            style: AppTypography.bodyLargeMedium.copyWith(
              color: _isSelected
                  ? AppColors.white
                  : _isCurrentMonth
                      ? AppColors.neutral800
                      : AppColors.neutral400,
            ),
          ),
        ),
      ),
    );
  }
}
