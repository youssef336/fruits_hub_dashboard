import 'package:flutter/material.dart';

class ImageFeild extends StatelessWidget {
  const ImageFeild({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),

        border: Border.all(color: Colors.grey),
      ),
      child: Icon(size: 180, Icons.image_outlined),
    );
  }
}
