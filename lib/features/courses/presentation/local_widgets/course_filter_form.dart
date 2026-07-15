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

class CourseFilterForm extends StatelessWidget {
  final FilterState state;

  const CourseFilterForm({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<FilterBloc>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextField(
          label: 'Course Category',
          hint: state.category,
          readOnly: true,
          suffixIcon: const Icon(
            Icons.keyboard_arrow_down,
            size: 20,
            color: AppColors.neutral500,
          ),
          onTap: () async {
            final result = await AppBottomSheet.showOptionPicker(
              context: context,
              title: 'Select Category',
              options: courseCategoryOptions,
            );
            if (result != null) bloc.add(FilterCategoryChanged(result));
          },
        ),
        const SizedBox(height: 20),
        AppTextField(
          label: 'Difficulty Level',
          hint: state.difficulty,
          readOnly: true,
          suffixIcon: const Icon(
            Icons.keyboard_arrow_down,
            size: 20,
            color: AppColors.neutral500,
          ),
          onTap: () async {
            final result = await AppBottomSheet.showOptionPicker(
              context: context,
              title: 'Select Difficulty',
              options: difficultyLevelOptions,
            );
            if (result != null) bloc.add(FilterDifficultyChanged(result));
          },
        ),
        const SizedBox(height: 20),
        FilterRatingSelector(
          selectedStars: state.minRatingStars,
          onChanged: (stars) => bloc.add(FilterRatingChanged(stars)),
        ),
        const SizedBox(height: 20),
        FilterPriceRangeSlider(
          label: 'Price Range',
          values: state.priceRange,
          onChanged: (range) => bloc.add(FilterPriceRangeChanged(range)),
        ),
        const SizedBox(height: 20),
        FilterChipRow(
          label: 'Duration',
          options: durationOptions,
          selected: state.duration,
          onChanged: (value) => bloc.add(FilterDurationChanged(value)),
        ),
        const SizedBox(height: 20),
        AppTextField(
          label: 'Released',
          hint: state.released,
          readOnly: true,
          suffixIcon: const Icon(
            Icons.keyboard_arrow_down,
            size: 20,
            color: AppColors.neutral500,
          ),
          onTap: () async {
            final result = await AppBottomSheet.showOptionPicker(
              context: context,
              title: 'Select Release Date',
              options: releasedOptions,
            );
            if (result != null) bloc.add(FilterReleasedChanged(result));
          },
        ),
      ],
    );
  }
}
