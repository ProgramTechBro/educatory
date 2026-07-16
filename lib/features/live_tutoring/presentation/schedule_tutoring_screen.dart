import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_typography.dart';
import '../../../core/shared_widgets/app_text_field.dart';
import '../../../core/shared_widgets/two_button_bottom_bar.dart';
import '../../../routes/app_routes.dart';
import 'bloc/schedule_tutoring_bloc.dart';
import 'bloc/schedule_tutoring_event.dart';
import 'bloc/schedule_tutoring_state.dart';
import 'local_widgets/calendar_picker_sheet.dart';
import 'local_widgets/schedule_online_checkbox.dart';
import 'local_widgets/time_slot_picker_sheet.dart';

class ScheduleTutoringScreen extends StatelessWidget {
  const ScheduleTutoringScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScheduleTutoringBloc(),
      child: const _ScheduleTutoringScreenBody(),
    );
  }
}

class _ScheduleTutoringScreenBody extends StatelessWidget {
  const _ScheduleTutoringScreenBody();

  static const _sheetShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
    ),
  );

  Future<void> _openCalendarSheet(
    BuildContext context,
    ScheduleTutoringBloc bloc,
  ) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.white,
      shape: _sheetShape,
      builder: (sheetContext) => BlocProvider.value(
        value: bloc,
        child: const CalendarPickerSheet(),
      ),
    );
    if (!context.mounted) return;
    if (bloc.state.selectedDate != null) {
      _openSlotSheet(context, bloc);
    }
  }

  Future<void> _openSlotSheet(
    BuildContext context,
    ScheduleTutoringBloc bloc,
  ) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.white,
      shape: _sheetShape,
      builder: (sheetContext) => BlocProvider.value(
        value: bloc,
        child: TimeSlotPickerSheet(
          onBackToCalendar: () {
            Navigator.of(sheetContext).pop();
            _openCalendarSheet(context, bloc);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ScheduleTutoringBloc>();

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
          'Schedule Tutoring',
          style: AppTypography.bodyLargeRegular.copyWith(
            color: AppColors.neutral900,
          ),
        ),
      ),
      bottomNavigationBar: BlocBuilder<ScheduleTutoringBloc, ScheduleTutoringState>(
        builder: (context, state) {
          return TwoButtonBottomBar(
            trailingLabel: 'Next',
            onTrailingTap: state.isReadyToContinue
                ? () => context.push(AppRoutes.bookingOrderDetails)
                : null,
          );
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Where & When', style: AppTypography.h3SemiBold),
            const SizedBox(height: 4),
            Text(
              'Choose where & when you like to study?',
              style: AppTypography.bodyLargeRegular.copyWith(
                color: AppColors.neutral600,
              ),
            ),
            const SizedBox(height: 32),
            BlocBuilder<ScheduleTutoringBloc, ScheduleTutoringState>(
              builder: (context, state) {
                final label = state.selectedDate != null &&
                        state.selectedSlotIndex != null
                    ? DateFormat('EEEE, d MMMM').format(state.selectedDate!)
                    : 'Choose a slot';

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ScheduleOnlineCheckbox(
                      isChecked: state.isOnline,
                      onChanged: (value) => bloc.add(
                        ScheduleOnlineToggled(value),
                      ),
                    ),
                    const SizedBox(height: 24),
                    AppTextField(
                      label: 'Where?',
                      hint: state.isOnline
                          ? 'Enter Address'
                          : '1901 Thornridge Cir. Shiloh',
                      enabled: !state.isOnline,
                      prefixIcon: state.isOnline
                          ? null
                          : const Icon(
                              Icons.location_on_outlined,
                              size: 20,
                              color: AppColors.neutral500,
                            ),
                    ),
                    const SizedBox(height: 20),
                    AppTextField(
                      label: 'When?',
                      hint: label,
                      readOnly: true,
                      onTap: () => _openCalendarSheet(context, bloc),
                      prefixIcon: const Icon(
                        Icons.calendar_today_outlined,
                        size: 20,
                        color: AppColors.neutral500,
                      ),
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
