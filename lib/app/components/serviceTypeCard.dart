import 'package:alfiyah_apps/app/Utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

String _formatRupiah(String rawPrice) {
  final parsed = double.tryParse(rawPrice) ?? 0;
  final value = parsed.round();
  final digits = value.toString().split('');
  final buffer = StringBuffer('Rp ');
  for (var i = 0; i < digits.length; i++) {
    final reverseIndex = digits.length - i;
    buffer.write(digits[i]);
    if (reverseIndex > 1 && reverseIndex % 3 == 1) {
      buffer.write('.');
    }
  }
  return buffer.toString();
}

Widget serviceTypeCard({
  required String name,
  required String description,
  required String price,
  required VoidCallback onTap,
}) {
  return Material(
    color: Colors.transparent,
    child: InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.primary.withValues(alpha: 0.12),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Gap(8),
            Text(
              description,
              style: TextStyle(
                fontSize: 12,
                color: Colors.black.withValues(alpha: 0.6),
              ),
            ),
            const Gap(12),
            Text(
              _formatRupiah(price),
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
