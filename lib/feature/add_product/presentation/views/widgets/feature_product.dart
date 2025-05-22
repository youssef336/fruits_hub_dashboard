import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/constant.dart';
import 'package:fruits_hub_dashboard/core/utils/text_styles.dart';
import 'package:fruits_hub_dashboard/feature/add_product/presentation/views/widgets/custom_chek_box.dart';

class FeatureProductWidget extends StatefulWidget {
  const FeatureProductWidget({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;
  @override
  State<FeatureProductWidget> createState() => _FeatureProductWidgetState();
}

class _FeatureProductWidgetState extends State<FeatureProductWidget> {
  bool isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomChekBox(
          onChanged: (value) {
            isTermsAccepted = value;
            widget.onChanged(value);
            setState(() {});
          },
          isChecked: isTermsAccepted,
        ),
        const SizedBox(width: 16),
        SizedBox(
          width:
              MediaQuery.of(context).size.width - (KhorzontalPadding * 2) - 48,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "is product Fearures ?\n",
                  style: AppTextStyles.bodySmallSemibold.copyWith(
                    height: 1,
                    fontSize: 16,
                    color: const Color(0xFF949D9E) /* Grayscale-600 */,
                  ),
                ),
              ],
            ),

            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}
