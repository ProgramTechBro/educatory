import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_typography.dart';
import '../../../core/shared_widgets/app_bottom_sheet.dart';
import '../../../core/shared_widgets/app_text_field.dart';
import '../../../core/shared_widgets/confirm_alert_dialog.dart';
import '../../../core/shared_widgets/two_button_bottom_bar.dart';
import '../../../routes/app_routes.dart';
import 'bloc/delete_account/delete_account_bloc.dart';
import 'bloc/delete_account/delete_account_event.dart';
import 'bloc/delete_account/delete_account_state.dart';

const List<String> _deleteReasonOptions = [
  "I don't need this anymore",
  'I found a better alternative',
  'Privacy concerns',
  'Too many notifications',
  'Other',
];

class DeleteAccountScreen extends StatelessWidget {
  const DeleteAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeleteAccountBloc(),
      child: const _DeleteAccountScreenBody(),
    );
  }
}

class _DeleteAccountScreenBody extends StatefulWidget {
  const _DeleteAccountScreenBody();

  @override
  State<_DeleteAccountScreenBody> createState() =>
      _DeleteAccountScreenBodyState();
}

class _DeleteAccountScreenBodyState extends State<_DeleteAccountScreenBody> {
  final TextEditingController _detailsController = TextEditingController();

  @override
  void dispose() {
    _detailsController.dispose();
    super.dispose();
  }

  Future<void> _confirmDelete(BuildContext context) async {
    final confirmed = await ConfirmAlertDialog.show(
      context,
      title: 'Confirm Delete Account',
      message: "Your account and all it's data will be deleted permanently.",
      cancelLabel: 'Cancel',
      confirmLabel: 'Confirm Deleting',
    );
    if (confirmed == true && context.mounted) {
      context.go(AppRoutes.loginPhone);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<DeleteAccountBloc>();

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
          'Back',
          style: AppTypography.bodyLargeRegular.copyWith(
            color: AppColors.neutral900,
          ),
        ),
      ),
      bottomNavigationBar: TwoButtonBottomBar(
        trailingLabel: 'Click Here',
        onTrailingTap: () => _confirmDelete(context),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Delete Account', style: AppTypography.h3SemiBold),
            const SizedBox(height: 4),
            Text(
              'Please be informed about below information before deleting',
              style: AppTypography.bodyLargeRegular.copyWith(
                color: AppColors.neutral600,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '•  Account deletion is permanent\n'
              '•  We remove all your data\n'
              "•  You can't log in to this account anymore\n"
              '•  Any services that are currently on progress will be '
              'suspended',
              style: AppTypography.bodyLargeRegular.copyWith(
                color: AppColors.neutral600,
                height: 1.6,
              ),
            ),
            const SizedBox(height: 24),
            BlocBuilder<DeleteAccountBloc, DeleteAccountState>(
              builder: (context, state) {
                return AppTextField(
                  label: 'Delete reason',
                  hint: state.reason,
                  readOnly: true,
                  suffixIcon: const Icon(
                    Icons.keyboard_arrow_down,
                    size: 20,
                    color: AppColors.neutral500,
                  ),
                  onTap: () async {
                    final result = await AppBottomSheet.showOptionPicker(
                      context: context,
                      title: 'Select Reason',
                      options: _deleteReasonOptions,
                    );
                    if (result != null) {
                      bloc.add(DeleteAccountReasonChanged(result));
                    }
                  },
                );
              },
            ),
            const SizedBox(height: 16),
            AppTextField(
              label: 'Details',
              hint: 'Write in details',
              controller: _detailsController,
              maxLines: 4,
            ),
          ],
        ),
      ),
    );
  }
}
