import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_typography.dart';
import '../../../../core/shared_widgets/app_text_field.dart';
import '../../../../core/shared_widgets/two_button_bottom_bar.dart';
import '../bloc/session_rating/session_rating_bloc.dart';
import '../bloc/session_rating/session_rating_event.dart';
import '../bloc/session_rating/session_rating_state.dart';
import '../../data/datasources/live_tutoring_local_datasource.dart';

class SessionRatingSheet extends StatelessWidget {
  const SessionRatingSheet({super.key});

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
        create: (context) => SessionRatingBloc(),
        child: const SessionRatingSheet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tutorFirstName =
        LiveTutoringLocalDataSource().getSubjectTutors().first.name.split(
              ' ',
            )[0];
    final commentController = TextEditingController();

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
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'How would you rate your overall experience with '
                  '$tutorFirstName?',
                  style: AppTypography.h4SemiBold,
                ),
                const SizedBox(height: 16),
                BlocBuilder<SessionRatingBloc, SessionRatingState>(
                  builder: (context, state) {
                    return Row(
                      children: [
                        for (var i = 1; i <= 5; i++)
                          GestureDetector(
                            onTap: () => context
                                .read<SessionRatingBloc>()
                                .add(SessionRatingChanged(i)),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: Icon(
                                i <= state.rating
                                    ? Icons.star
                                    : Icons.star_border,
                                size: 28,
                                color: AppColors.orange500,
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 16),
                AppTextField(
                  label: 'Comment',
                  hint: 'e.g. Robert was good and assiste...',
                  controller: commentController,
                  maxLines: 3,
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          TwoButtonBottomBar(
            leadingLabel: 'Cancel',
            onLeadingTap: () => Navigator.of(context).pop(),
            trailingLabel: 'Submit Review',
            onTrailingTap: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
