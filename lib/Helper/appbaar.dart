import 'package:flutter/material.dart';

class AppBaarNavi extends StatelessWidget {
  const AppBaarNavi({
    super.key,
    required this.iconPath,
    required this.label,
  });

  final String iconPath;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            iconPath,
            height: 24,
            width: 24,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
