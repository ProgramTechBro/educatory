import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_typography.dart';
import '../../../routes/app_routes.dart';
import 'bloc/session_timer/session_timer_bloc.dart';
import 'bloc/session_timer/session_timer_state.dart';
import '../data/datasources/live_tutoring_local_datasource.dart';
import 'local_widgets/contact_status_card.dart';

class SessionProcessingScreen extends StatelessWidget {
  const SessionProcessingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SessionTimerBloc(),
      child: const _SessionProcessingScreenBody(),
    );
  }
}

class _SessionProcessingScreenBody extends StatelessWidget {
  const _SessionProcessingScreenBody();

  @override
  Widget build(BuildContext context) {
    final tutor = LiveTutoringLocalDataSource().getSubjectTutors().first;

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
          'Processing',
          style: AppTypography.bodyLargeRegular.copyWith(
            color: AppColors.neutral900,
          ),
        ),
      ),
      body: BlocConsumer<SessionTimerBloc, SessionTimerState>(
        listenWhen: (previous, current) =>
            !previous.isComplete && current.isComplete,
        listener: (context, state) {
          context.pushReplacement(AppRoutes.sessionFallback);
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ContactStatusCard(tutor: tutor),
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 248,
                          height: 248,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox.expand(
                                child: CircularProgressIndicator(
                                  value: state.progress,
                                  strokeWidth: 10,
                                  backgroundColor: AppColors.neutral200,
                                  valueColor:
                                      const AlwaysStoppedAnimation<Color>(
                                    AppColors.primary,
                                  ),
                                ),
                              ),
                              Text(
                                state.formattedTime,
                                style: AppTypography.h3Bold.copyWith(
                                  fontSize: 40,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 32),
                        Text('Request Sent', style: AppTypography.h3SemiBold),
                        const SizedBox(height: 8),
                        Text(
                          '${tutor.name} has been notified of your request '
                          'and will respond shortly. Please wait for few '
                          'moments',
                          textAlign: TextAlign.center,
                          style: AppTypography.bodyLargeRegular.copyWith(
                            color: AppColors.neutral600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
