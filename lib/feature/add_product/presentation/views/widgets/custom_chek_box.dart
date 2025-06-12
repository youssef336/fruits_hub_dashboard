import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/constant.dart';

class CustomChekBox extends StatelessWidget {
  const CustomChekBox({
    super.key,
    required this.isChecked,
    required this.onChanged,
  });
  final bool isChecked;
  final ValueChanged<bool> onChanged;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!isChecked);
      },
      child: AnimatedContainer(
        width: 24,
        height: 24,
        duration: const Duration(milliseconds: 120),
        decoration: ShapeDecoration(
          color: isChecked ? KprimaryColor : Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1.50,
              color: isChecked ? Colors.transparent : const Color(0xFFDCDEDE),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child:
            isChecked
                ? const Icon(Icons.check, color: Colors.white)
                : const SizedBox.shrink(),
      ),
    );
  }
}
