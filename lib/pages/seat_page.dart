import 'package:a/pages/widgets/common_button.dart';
import 'package:a/pages/widgets/seat/seat_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SeatPage extends StatefulWidget {
  final String startStation;
  final String endStation;

  const SeatPage({
    super.key,
    required this.startStation,
    required this.endStation,
  });

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

  void _showBookingConfirmDialog() {
    if (selectedRow == null || selectedCol == null) return;

    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('예매 확인'),
        content: Text(
          '${widget.startStation}에서 ${widget.endStation}까지\n${selectedRow}열 ${String.fromCharCode(64 + selectedCol!)}석을 예매하시겠습니까?',
        ),
        actions: [
          CupertinoDialogAction(
            child: const Text(
              '취소',
              style: TextStyle(color: Colors.red),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          CupertinoDialogAction(
            child: const Text(
              '확인',
              style: TextStyle(color: Colors.blue),
            ),
            onPressed: () async {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
          ),
        ],
      ),
    );
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            buildStationHeader(),
            const SizedBox(height: 20),
            buildSeatLegend(),
            SeatList(
              selectedCol: selectedCol,
              selectedRow: selectedRow,
              onSelected: onSelected,
            ),
            CommonButton(
              onPressed: _showBookingConfirmDialog,
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Row buildStationHeader() {
    return Row(
      children: [
        Expanded(
          child: Center(
            child: Text(
              widget.startStation,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.purple,
                fontSize: 30,
              ),
            ),
          ),
        ),
        const Icon(Icons.arrow_circle_right_outlined),
        Expanded(
          child: Center(
            child: Text(
              widget.endStation,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.purple,
                fontSize: 30,
              ),
            ),
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
      const SizedBox(width: 4),
      const Text('선택됨'),
      const SizedBox(width: 20),
      Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: Colors.grey[300]!,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      const SizedBox(width: 4),
      const Text('선택됨'),
    ],
  );
}
