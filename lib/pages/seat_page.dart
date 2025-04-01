import 'package:a/pages/widgets/seat/seat_list.dart';
import 'package:flutter/material.dart';

class SeatPage extends StatefulWidget {
  const SeatPage({super.key});

  @override
  State<SeatPage> createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  int? selectedRow;
  int? selectedCol;

  void onSelected(int row, int col) {
    setState(() {
      selectedRow = row;
      selectedCol = col;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('좌석 선택'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          buildStationHeader(),
          SizedBox(height: 20),
          buildSeatLegend(),
          SeatList(
            selectedCol: selectedCol,
            selectedRow: selectedRow,
            onSelected: onSelected,
          ),
        ],
      ),
    );
  }

  Row buildStationHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          '출발역',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.purple,
            fontSize: 30,
          ),
        ),
        Icon(Icons.arrow_circle_right_outlined),
        Text(
          '도착역',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.purple,
            fontSize: 30,
          ),
        ),
      ],
    );
  }
}

Row buildSeatLegend() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      SizedBox(width: 4),
      Text('선택됨'),
      SizedBox(width: 20),
      Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: Colors.grey[300]!,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      SizedBox(width: 4),
      Text('선택됨'),
    ],
  );
}
