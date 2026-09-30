import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  const EmptyState();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Nothing to show',
        style: TextStyle(color: Colors.grey, fontSize: 13),
      ),
    );
  }
}