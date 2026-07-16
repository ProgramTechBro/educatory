import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_typography.dart';
import '../../../core/shared_widgets/confirm_alert_dialog.dart';
import '../../../routes/app_routes.dart';
import 'bloc/payment_methods/payment_methods_bloc.dart';
import 'bloc/payment_methods/payment_methods_event.dart';
import 'bloc/payment_methods/payment_methods_state.dart';
import '../data/datasources/payment_methods_local_datasource.dart';
import 'local_widgets/payment_card_tile.dart';

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentMethodsBloc(
        initialCards: PaymentMethodsLocalDataSource().getPaymentCards(),
      ),
      child: const _PaymentMethodsScreenBody(),
    );
  }
}

class _PaymentMethodsScreenBody extends StatelessWidget {
  const _PaymentMethodsScreenBody();

  Future<void> _confirmRemove(BuildContext context, String cardId) async {
    final confirmed = await ConfirmAlertDialog.show(
      context,
      title: 'Remove this Card',
      message: 'Are you sure you want to remove this Card?',
      cancelLabel: 'No, Cancel',
      confirmLabel: 'Yes, Remove',
    );
    if (confirmed == true && context.mounted) {
      context.read<PaymentMethodsBloc>().add(PaymentCardRemoved(cardId));
    }
  }

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
          'Payment Methods',
          style: AppTypography.bodyLargeRegular.copyWith(
            color: AppColors.neutral900,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Payment', style: AppTypography.h3SemiBold),
            BlocBuilder<PaymentMethodsBloc, PaymentMethodsState>(
              builder: (context, state) {
                return Column(
                  children: [
                    for (final card in state.cards)
                      PaymentCardTile(
                        card: card,
                        onRemoveTap: () => _confirmRemove(context, card.id),
                      ),
                  ],
                );
              },
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: TextButton.icon(
                onPressed: () => context.push(AppRoutes.addNewCard),
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.secondaryButtonFill,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                icon: const Icon(
                  Icons.add_circle_outline,
                  size: 20,
                  color: AppColors.primary,
                ),
                label: Text(
                  'Add New Method',
                  style: AppTypography.bodyLargeMedium.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: SizedBox(
                width: 187,
                child: OutlinedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Account removed')),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: AppColors.white,
                    side: const BorderSide(color: AppColors.neutral300),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  icon: const Icon(
                    Icons.delete_outline,
                    size: 20,
                    color: AppColors.neutral600,
                  ),
                  label: Text(
                    'Remove Account',
                    style: AppTypography.bodyLargeMedium.copyWith(
                      color: AppColors.neutral600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
