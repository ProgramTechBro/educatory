import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_typography.dart';
import '../../../routes/app_routes.dart';
import '../domain/entities/search_target.dart';
import 'bloc/filter_bloc.dart';
import 'bloc/filter_event.dart';
import 'bloc/filter_state.dart';
import 'local_widgets/course_filter_form.dart';
import 'local_widgets/filter_bottom_bar.dart';
import 'local_widgets/search_target_toggle.dart';
import 'local_widgets/tutor_filter_form.dart';

class FilterScreen extends StatelessWidget {
  final SearchTarget initialTarget;

  const FilterScreen({super.key, this.initialTarget = SearchTarget.tutors});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FilterBloc()
        ..add(FilterTargetChanged(initialTarget)),
      child: const _FilterScreenBody(),
    );
  }
}

class _FilterScreenBody extends StatelessWidget {
  const _FilterScreenBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackground,
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
          'Filters',
          style: AppTypography.h4Medium.copyWith(fontWeight: FontWeight.w400),
        ),
      ),
      bottomNavigationBar: BlocBuilder<FilterBloc, FilterState>(
        builder: (context, state) {
          return FilterBottomBar(
            onReset: () => context.read<FilterBloc>().add(const FilterReset()),
            onApply: () {
              context.push(
                AppRoutes.filteredResults,
                extra: {
                  'target': state.target,
                  'filterCount': state.activeFilterCount,
                },
              );
            },
          );
        },
      ),
      body: BlocBuilder<FilterBloc, FilterState>(
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SearchTargetToggle(
                    target: state.target,
                    onChanged: (target) => context
                        .read<FilterBloc>()
                        .add(FilterTargetChanged(target)),
                  ),
                  const SizedBox(height: 20),
                  state.target == SearchTarget.tutors
                      ? TutorFilterForm(state: state)
                      : CourseFilterForm(state: state),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
