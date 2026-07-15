import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_typography.dart';
import '../../../core/shared_widgets/two_button_bottom_bar.dart';
import '../../../routes/app_routes.dart';
import '../data/datasources/cart_local_datasource.dart';
import 'local_widgets/order_summary_row.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final order = CartLocalDataSource().getOrderSummary();

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
          'Order Details',
          style: AppTypography.h4Medium.copyWith(fontWeight: FontWeight.w400),
        ),
      ),
      bottomNavigationBar: TwoButtonBottomBar(
        leadingLabel: 'Add to Cart',
        onLeadingTap: () => context.pop(),
        trailingLabel: 'Purchase Now',
        onTrailingTap: () => context.push(AppRoutes.payment),
      ),
      body: Container(
        color: AppColors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    order.courseName,
                    style: AppTypography.bodyLargeRegular.copyWith(
                      color: AppColors.neutral500,
                    ),
                  ),
                ),
                Text(
                  '\$${order.subtotal.toStringAsFixed(0)}',
                  style: AppTypography.bodyLargeMedium,
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(height: 1, color: AppColors.neutral200),
            const SizedBox(height: 12),
            OrderSummaryRow(
              label: 'Subtotal',
              value: '\$${order.subtotal.toStringAsFixed(0)}',
            ),
            const SizedBox(height: 12),
            OrderSummaryRow(
              label: 'Discount',
              value: '-\$${order.discount.toStringAsFixed(0)}',
            ),
            const SizedBox(height: 12),
            OrderSummaryRow(
              label: 'Vat',
              value:
                  '(+${order.vatPercent.toStringAsFixed(0)}%) \$${order.vatAmount.toStringAsFixed(2)}',
            ),
            const SizedBox(height: 16),
            const Divider(height: 1, color: AppColors.neutral200),
            const SizedBox(height: 16),
            OrderSummaryRow(
              label: 'Total',
              value: '\$${order.total.toStringAsFixed(2)}',
              emphasize: true,
            ),
          ],
        ),
      ),
    );
  }
}
