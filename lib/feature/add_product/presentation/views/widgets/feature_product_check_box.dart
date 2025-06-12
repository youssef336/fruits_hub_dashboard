import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/text_styles.dart';
import 'package:fruits_hub_dashboard/feature/add_product/presentation/views/widgets/custom_chek_box.dart';

class FeatureProductCheckBox extends StatefulWidget {
  const FeatureProductCheckBox({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;
  @override
  State<FeatureProductCheckBox> createState() => _FeatureProductCheckBoxState();
}

class _FeatureProductCheckBoxState extends State<FeatureProductCheckBox> {
  bool isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start, // Centers children vertically
      children: [
        Expanded(
          child: Text(
            'Is Feature Product ?',
            style: AppTextStyles.bodyBaseBold.copyWith(
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        const SizedBox(width: 8),
        CustomChekBox(
          onChanged: (value) {
            isTermsAccepted = value;
            widget.onChanged(value);
            setState(() {});
          },
          isChecked: isTermsAccepted,
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}
