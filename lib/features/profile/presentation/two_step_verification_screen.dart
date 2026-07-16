import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_typography.dart';
import '../../../core/shared_widgets/phone_number_field.dart';
import '../../../core/shared_widgets/two_button_bottom_bar.dart';
import '../../../routes/app_routes.dart';
import 'bloc/two_step_verification/two_step_verification_bloc.dart';
import 'bloc/two_step_verification/two_step_verification_event.dart';
import 'bloc/two_step_verification/two_step_verification_state.dart';

class TwoStepVerificationScreen extends StatelessWidget {
  const TwoStepVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TwoStepVerificationBloc(),
      child: const _TwoStepVerificationScreenBody(),
    );
  }
}

class _TwoStepVerificationScreenBody extends StatelessWidget {
  const _TwoStepVerificationScreenBody();

  @override
  Widget build(BuildContext context) {
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
          '2-Step Verification',
          style: AppTypography.bodyLargeRegular.copyWith(
            color: AppColors.neutral900,
          ),
        ),
      ),
      bottomNavigationBar: TwoButtonBottomBar(
        trailingLabel: 'Click Here',
        onTrailingTap: () => context.push(AppRoutes.verifyCode),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: BlocBuilder<TwoStepVerificationBloc, TwoStepVerificationState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '2-Step Verification',
                      style: AppTypography.h3SemiBold,
                    ),
                    Switch(
                      value: state.isEnabled,
                      activeThumbColor: AppColors.white,
                      activeTrackColor: AppColors.primary,
                      inactiveTrackColor: AppColors.neutral300,
                      onChanged: (value) => context
                          .read<TwoStepVerificationBloc>()
                          .add(TwoStepVerificationToggled(value)),
                    ),
                  ],
                ),
                Text(
                  'Additional layer of security for your account',
                  style: AppTypography.bodyLargeRegular.copyWith(
                    color: AppColors.neutral600,
                  ),
                ),
                const SizedBox(height: 24),
                PhoneNumberField(onChanged: (_) {}),
              ],
            );
          },
        ),
      ),
    );
  }
}
