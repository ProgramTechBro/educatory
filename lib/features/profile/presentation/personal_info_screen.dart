import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_typography.dart';
import '../../../core/shared_widgets/app_bottom_sheet.dart';
import '../../../core/shared_widgets/app_text_field.dart';
import '../../../core/shared_widgets/phone_number_field.dart';
import '../../../core/shared_widgets/two_button_bottom_bar.dart';
import 'bloc/personal_info/personal_info_bloc.dart';
import 'bloc/personal_info/personal_info_event.dart';
import 'bloc/personal_info/personal_info_state.dart';

const List<String> _majorOptions = [
  'Computer Science Engineering',
  'Electrical Engineering',
  'Business Administration',
  'Mechanical Engineering',
  'Psychology',
];

const List<String> _universityOptions = [
  'University of Philadelphia',
  'University of California',
  'University of Texas',
  'University of Washington',
];

class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PersonalInfoBloc(),
      child: const _PersonalInfoScreenBody(),
    );
  }
}

class _PersonalInfoScreenBody extends StatefulWidget {
  const _PersonalInfoScreenBody();

  @override
  State<_PersonalInfoScreenBody> createState() =>
      _PersonalInfoScreenBodyState();
}

class _PersonalInfoScreenBodyState extends State<_PersonalInfoScreenBody> {
  final TextEditingController _fullNameController =
      TextEditingController(text: 'Muhammad Shahin');
  final TextEditingController _emailController =
      TextEditingController(text: 'shahin98.design@gmail.com');
  final TextEditingController _universityIdController =
      TextEditingController(text: '189204 8923');

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _universityIdController.dispose();
    super.dispose();
  }

  void _save() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Changes saved!')),
    );
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<PersonalInfoBloc>();

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
          'Personal Information',
          style: AppTypography.bodyLargeRegular.copyWith(
            color: AppColors.neutral900,
          ),
        ),
      ),
      bottomNavigationBar: TwoButtonBottomBar(
        trailingLabel: 'Save Changes',
        onTrailingTap: _save,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Personal Info', style: AppTypography.h3SemiBold),
            const SizedBox(height: 16),
            AppTextField(label: 'Full Name', controller: _fullNameController),
            const SizedBox(height: 12),
            PhoneNumberField(onChanged: (_) {}),
            const SizedBox(height: 12),
            AppTextField(
              label: 'First Name',
              controller: _emailController,
              prefixIcon: const Icon(
                Icons.mail_outline,
                size: 20,
                color: AppColors.neutral500,
              ),
            ),
            const SizedBox(height: 32),
            Text('Your education', style: AppTypography.h3SemiBold),
            const SizedBox(height: 16),
            AppTextField(
              label: 'University ID',
              controller: _universityIdController,
            ),
            const SizedBox(height: 12),
            BlocBuilder<PersonalInfoBloc, PersonalInfoState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppTextField(
                      label: 'Major',
                      hint: state.major,
                      readOnly: true,
                      suffixIcon: const Icon(
                        Icons.keyboard_arrow_down,
                        size: 20,
                        color: AppColors.neutral500,
                      ),
                      onTap: () async {
                        final result = await AppBottomSheet.showOptionPicker(
                          context: context,
                          title: 'Select Major',
                          options: _majorOptions,
                        );
                        if (result != null) {
                          bloc.add(PersonalInfoMajorChanged(result));
                        }
                      },
                    ),
                    const SizedBox(height: 12),
                    AppTextField(
                      label: 'University',
                      hint: state.university,
                      readOnly: true,
                      suffixIcon: const Icon(
                        Icons.keyboard_arrow_down,
                        size: 20,
                        color: AppColors.neutral500,
                      ),
                      onTap: () async {
                        final result = await AppBottomSheet.showOptionPicker(
                          context: context,
                          title: 'Select University',
                          options: _universityOptions,
                        );
                        if (result != null) {
                          bloc.add(PersonalInfoUniversityChanged(result));
                        }
                      },
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
