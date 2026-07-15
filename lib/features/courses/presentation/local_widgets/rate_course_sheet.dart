import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_typography.dart';
import '../../../../core/shared_widgets/app_button.dart';
import '../../../../core/shared_widgets/app_text_field.dart';
import '../bloc/rate_course/rate_course_bloc.dart';
import '../bloc/rate_course/rate_course_event.dart';
import '../bloc/rate_course/rate_course_state.dart';

class RateCourseSheet extends StatelessWidget {
  const RateCourseSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      builder: (context) => BlocProvider(
        create: (context) => RateCourseBloc(),
        child: const RateCourseSheet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final commentController = TextEditingController();

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.neutral200,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text('Rate this Course', style: AppTypography.h3SemiBold),
              const SizedBox(height: 4),
              Text(
                'Share your experience to help other learners',
                style: AppTypography.bodyLargeRegular.copyWith(
                  color: AppColors.neutral600,
                ),
              ),
              const SizedBox(height: 20),
              BlocBuilder<RateCourseBloc, RateCourseState>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (var i = 1; i <= 5; i++)
                        GestureDetector(
                          onTap: () => context.read<RateCourseBloc>().add(
                                RateCourseRatingChanged(i),
                              ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: Icon(
                              i <= state.rating
                                  ? Icons.star
                                  : Icons.star_border,
                              size: 36,
                              color: AppColors.orange500,
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 20),
              AppTextField(
                label: 'Your Review',
                hint: 'Write your thoughts about this course',
                controller: commentController,
                maxLines: 4,
              ),
              const SizedBox(height: 20),
              AppButton(
                label: 'Submit Review',
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
