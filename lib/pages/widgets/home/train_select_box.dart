import 'package:flutter/material.dart';

class TrainSelectBox extends StatelessWidget {
  final String? startStation;
  final String? endStation;
  final VoidCallback onStartStationTap;
  final VoidCallback onEndStationTap;

  const TrainSelectBox({
    super.key,
    this.startStation,
    this.endStation,
    required this.onStartStationTap,
    required this.onEndStationTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF2D2D2D) : Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: onStartStationTap,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '출발역',
                  style: TextStyle(
                    fontSize: 16,
                    color: isDark ? Colors.grey[400] : Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  startStation ?? '선택',
                  style: TextStyle(
                    fontSize: 40,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 2,
            height: 50,
            color: isDark ? Colors.grey[700] : Colors.grey[400],
          ),
          GestureDetector(
            onTap: onEndStationTap,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '도착역',
                  style: TextStyle(
                    fontSize: 16,
                    color: isDark ? Colors.grey[400] : Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  endStation ?? '선택',
                  style: TextStyle(
                    fontSize: 40,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
