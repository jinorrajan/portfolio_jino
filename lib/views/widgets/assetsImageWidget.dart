import 'package:flutter/material.dart';

import '../../contoller/assetController.dart';

class AssetImageWidget extends StatelessWidget {
  final String category;
  final String name;
   double? width;
   double? height;

   AssetImageWidget({
    super.key,
    required this.category,
    required this.name,
     this.width,
     this.height,
  });

  @override
  Widget build(BuildContext context) {
    final assetPath = AssetController().getAsset(category, name);

    if (assetPath.isEmpty) {
      return const Text(
        "Asset not found",
        style: TextStyle(color: Colors.red),
      );
    }

    return Image.asset(
      assetPath,
      width: width,
      height: height,
    );
  }
}
