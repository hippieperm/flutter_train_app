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
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
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
                const Text(
                  '출발역',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  startStation ?? '선택',
                  style: TextStyle(
                    fontSize: 40,
                    // color: startStation == null ? Colors.black : Colors.purple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 2,
            height: 50,
            color: Colors.grey[400],
          ),
          GestureDetector(
            onTap: onEndStationTap,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '도착역',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  endStation ?? '선택',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
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
