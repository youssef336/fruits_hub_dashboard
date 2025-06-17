import 'package:flutter/material.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/text_styles.dart';

class NotificationHeader extends StatelessWidget {
  const NotificationHeader({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text("New", style: AppTextStyles.bodyBaseBold),
        const SizedBox(width: 6),
        CircleAvatar(
          radius: 11,
          backgroundColor: const Color(0xFFEBF9F1),
          child: Center(
            child: Text(
              index.toString(),
              style: const TextStyle(
                fontSize: 12, // smaller font to fit inside small circle
                fontWeight: FontWeight.bold,
                color: KprimaryColorDark,
              ),
            ),
          ),
        ),
        const Spacer(),
        Text(
          "all",
          textAlign: TextAlign.center,
          style: AppTextStyles.bodyBaseRegular.copyWith(
            color: const Color(0xFF949D9E),
            height: 1.60,
          ),
        ),
      ],
    );
  }
}
