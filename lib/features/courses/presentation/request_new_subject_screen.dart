import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_typography.dart';
import '../../../core/shared_widgets/app_bottom_sheet.dart';
import '../../../core/shared_widgets/app_button.dart';
import '../../../core/shared_widgets/app_text_field.dart';
import 'bloc/request_subject_bloc.dart';
import 'bloc/request_subject_event.dart';
import 'bloc/request_subject_state.dart';
import 'local_widgets/filter_chip_row.dart';
import 'local_widgets/request_subject_header.dart';
import 'request_subject_options.dart';

class RequestNewSubjectScreen extends StatelessWidget {
  const RequestNewSubjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RequestSubjectBloc(),
      child: const _RequestNewSubjectScreenBody(),
    );
  }
}

class _RequestNewSubjectScreenBody extends StatefulWidget {
  const _RequestNewSubjectScreenBody();

  @override
  State<_RequestNewSubjectScreenBody> createState() =>
      _RequestNewSubjectScreenBodyState();
}

class _RequestNewSubjectScreenBodyState
    extends State<_RequestNewSubjectScreenBody> {
  final TextEditingController _subjectNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _subjectNameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _submit() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Subject request submitted!')),
    );
    context.pop();
  }

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
          'Request New Subject',
          style: AppTypography.h4Medium.copyWith(fontWeight: FontWeight.w400),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
          decoration: const BoxDecoration(
            color: AppColors.white,
            border: Border(top: BorderSide(color: AppColors.neutral200)),
          ),
          child: Row(
            children: [
              Expanded(
                child: AppButton(
                  label: 'Cancel',
                  variant: AppButtonVariant.outline,
                  height: 40,
                  onPressed: () => context.pop(),
                ),
              ),
              const SizedBox(width: 11),
              Expanded(
                child: AppButton(
                  label: 'Request Subject',
                  height: 40,
                  onPressed: _submit,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const RequestSubjectHeader(),
              const SizedBox(height: 24),
              AppTextField(
                label: 'Subject Name',
                hint: 'e.g. Organic Chemistry',
                controller: _subjectNameController,
              ),
              const SizedBox(height: 20),
              BlocBuilder<RequestSubjectBloc, RequestSubjectState>(
                builder: (context, state) {
                  final bloc = context.read<RequestSubjectBloc>();
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTextField(
                        label: 'Category',
                        hint: state.category ?? 'Select a category',
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
                            options: requestSubjectCategoryOptions,
                          );
                          if (result != null) {
                            bloc.add(RequestSubjectCategoryChanged(result));
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      AppTextField(
                        label: 'Preferred Level',
                        hint: state.level ?? 'Select a level',
                        readOnly: true,
                        suffixIcon: const Icon(
                          Icons.keyboard_arrow_down,
                          size: 20,
                          color: AppColors.neutral500,
                        ),
                        onTap: () async {
                          final result = await AppBottomSheet.showOptionPicker(
                            context: context,
                            title: 'Select Level',
                            options: requestSubjectLevelOptions,
                          );
                          if (result != null) {
                            bloc.add(RequestSubjectLevelChanged(result));
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      FilterChipRow(
                        label: 'Urgency',
                        options: requestSubjectUrgencyOptions,
                        selected: state.urgency ?? '',
                        onChanged: (value) =>
                            bloc.add(RequestSubjectUrgencyChanged(value)),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 20),
              AppTextField(
                label: 'Description',
                hint: 'Write a description about the subject...',
                controller: _descriptionController,
                maxLines: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
