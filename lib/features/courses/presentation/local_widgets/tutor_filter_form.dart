import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/app_colors.dart';
import '../../../../core/shared_widgets/app_bottom_sheet.dart';
import '../../../../core/shared_widgets/app_text_field.dart';
import '../bloc/filter_bloc.dart';
import '../bloc/filter_event.dart';
import '../bloc/filter_state.dart';
import '../filter_options.dart';
import 'filter_chip_row.dart';
import 'filter_price_range_slider.dart';
import 'filter_rating_selector.dart';

class TutorFilterForm extends StatelessWidget {
  final FilterState state;

  const TutorFilterForm({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<FilterBloc>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextField(
          label: 'Subject',
          hint: state.subject,
          readOnly: true,
          suffixIcon: const Icon(
            Icons.keyboard_arrow_down,
            size: 20,
            color: AppColors.neutral500,
          ),
          onTap: () async {
            final result = await AppBottomSheet.showOptionPicker(
              context: context,
              title: 'Select Subject',
              options: subjectOptions,
            );
            if (result != null) bloc.add(FilterSubjectChanged(result));
          },
        ),
        const SizedBox(height: 20),
        FilterChipRow(
          label: 'Availability',
          options: availabilityDays,
          selected: state.availabilityDay,
          onChanged: (value) => bloc.add(FilterAvailabilityChanged(value)),
        ),
        const SizedBox(height: 20),
        FilterChipRow(
          label: 'Timeslots',
          options: timeslotOptions,
          selected: state.timeslot,
          onChanged: (value) => bloc.add(FilterTimeslotChanged(value)),
        ),
        const SizedBox(height: 20),
        AppTextField(
          label: 'Tutoring Experience',
          hint: state.experience,
          readOnly: true,
          suffixIcon: const Icon(
            Icons.keyboard_arrow_down,
            size: 20,
            color: AppColors.neutral500,
          ),
          onTap: () async {
            final result = await AppBottomSheet.showOptionPicker(
              context: context,
              title: 'Select Experience',
              options: experienceOptions,
            );
            if (result != null) bloc.add(FilterExperienceChanged(result));
          },
        ),
        const SizedBox(height: 20),
        AppTextField(
          label: 'Degrees and certifications',
          hint: state.certification,
          readOnly: true,
          suffixIcon: const Icon(
            Icons.keyboard_arrow_down,
            size: 20,
            color: AppColors.neutral500,
          ),
          onTap: () async {
            final result = await AppBottomSheet.showOptionPicker(
              context: context,
              title: 'Select Certification',
              options: certificationOptions,
            );
            if (result != null) bloc.add(FilterCertificationChanged(result));
          },
        ),
        const SizedBox(height: 20),
        FilterRatingSelector(
          selectedStars: state.minRatingStars,
          onChanged: (stars) => bloc.add(FilterRatingChanged(stars)),
        ),
        const SizedBox(height: 20),
        FilterPriceRangeSlider(
          label: 'Hourly Rate',
          values: state.priceRange,
          onChanged: (range) => bloc.add(FilterPriceRangeChanged(range)),
        ),
      ],
    );
  }
}
