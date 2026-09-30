import 'package:flutter/material.dart';

class SocialIcon extends StatelessWidget {
  const SocialIcon({required this.icon});
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Image.asset(icon, width: 44, height: 44),
    );
  }
}