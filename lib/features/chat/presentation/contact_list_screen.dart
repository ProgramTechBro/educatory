import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_typography.dart';
import '../../../routes/app_routes.dart';
import '../data/datasources/chat_local_datasource.dart';
import 'local_widgets/contact_tile.dart';

class ContactListScreen extends StatelessWidget {
  const ContactListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final contacts = ChatLocalDataSource().getContacts();

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
          'Messages',
          style: AppTypography.h4Medium.copyWith(fontWeight: FontWeight.w400),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(color: AppColors.neutral300),
                borderRadius: BorderRadius.circular(10),
                boxShadow: AppColors.inputDropShadow,
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.search,
                    size: 20,
                    color: AppColors.neutral500,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      style: AppTypography.bodyLargeRegular.copyWith(
                        color: AppColors.neutral900,
                      ),
                      decoration: InputDecoration(
                        isDense: true,
                        border: InputBorder.none,
                        hintText: 'Search',
                        hintStyle: AppTypography.bodyLargeRegular.copyWith(
                          color: AppColors.neutral500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            for (final contact in contacts) ...[
              ContactTile(
                contact: contact,
                onTap: () => context.push(AppRoutes.chat, extra: contact),
              ),
              if (contact != contacts.last) ...[
                const SizedBox(height: 16),
                const Divider(height: 1, color: AppColors.neutral200),
                const SizedBox(height: 16),
              ],
            ],
          ],
        ),
      ),
    );
  }
}
