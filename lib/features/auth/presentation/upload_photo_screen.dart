import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_typography.dart';
import '../../../core/shared_widgets/app_button.dart';
import '../../../routes/app_routes.dart';
import 'local_widgets/auth_back_button.dart';
import 'local_widgets/auth_header.dart';
import 'local_widgets/linear_stepper.dart';

class UploadPhotoScreen extends StatefulWidget {
  const UploadPhotoScreen({super.key});

  @override
  State<UploadPhotoScreen> createState() => _UploadPhotoScreenState();
}

class _UploadPhotoScreenState extends State<UploadPhotoScreen> {
  bool _hasPhoto = false;

  void _continue() => context.push(AppRoutes.registerCongrats);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
          decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: AppColors.neutral200)),
          ),
          child: Row(
            children: [
              Expanded(
                child: AppButton(
                  label: 'Skip for Later',
                  variant: AppButtonVariant.outline,
                  height: 40,
                  onPressed: _continue,
                ),
              ),
              const SizedBox(width: 11),
              Expanded(
                child: AppButton(
                  label: 'Continue',
                  height: 40,
                  onPressed: _continue,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AuthBackButton(),
              const SizedBox(height: 16),
              const LinearStepper(stepCount: 3, currentStep: 2),
              const SizedBox(height: 24),
              const AuthHeader(
                title: 'Upload photo',
                subtitle: 'Upload your profile photo to finish signing up',
              ),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: () => setState(() => _hasPhoto = !_hasPhoto),
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.secondaryButtonFill,
                            border: Border.all(
                              color: AppColors.primary,
                              width: 1.5,
                              style: BorderStyle.solid,
                            ),
                          ),
                          child: Icon(
                            _hasPhoto
                                ? Icons.check_circle
                                : Icons.add_a_photo_outlined,
                            size: 48,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        _hasPhoto
                            ? 'Photo Selected'
                            : 'Click Circle to\nUpload Your Photo',
                        textAlign: TextAlign.center,
                        style: AppTypography.h4Medium,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
