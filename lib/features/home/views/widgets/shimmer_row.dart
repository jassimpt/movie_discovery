import 'package:flutter/material.dart';

class ShimmerRow extends StatelessWidget {
  const ShimmerRow({super.key, required this.isCircle});
  final bool isCircle;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      itemCount: 8,
      separatorBuilder: (_, __) => const SizedBox(width: 10),
      itemBuilder: (_, __) {
        return isCircle
            ? Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF1A1A1A),
                ),
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Container(
                  width: 107,
                  height: 160,
                  color: const Color(0xFF1A1A1A),
                ),
              );
      },
    );
    ;
  }
}
