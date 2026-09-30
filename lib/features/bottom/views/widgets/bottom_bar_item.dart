import 'package:flutter/material.dart';

class BottomBarItem extends StatelessWidget {
  final int index;
  final int currentIndex;
  final String icon;
  final String label;
  final int? badgeCount;
  final ValueChanged<int> onTap;

  const BottomBarItem({
    required this.index,
    required this.currentIndex,
    required this.icon,
    required this.label,
    required this.onTap,
    this.badgeCount,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = index == currentIndex;

    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(index),
        behavior: HitTestBehavior.opaque,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset(
                  icon,
                  width: 20,
                  height: 20,
                  color: isSelected
                      ? Colors.white
                      : const Color(0xFF858585),
                  fit: BoxFit.contain,
                ),

                if (badgeCount != null)
                  Positioned(
                    top: -7,
                    right: -5,
                    child: Container(
                      width: 15,
                      height: 15,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Color(0xFFE50914),
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '$badgeCount',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
              ],
            ),

            const SizedBox(height: 2),

            Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.visible,
              style: TextStyle(
                color: isSelected
                    ? Colors.white
                    : const Color(0xFF858585),
                fontSize: 10,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}