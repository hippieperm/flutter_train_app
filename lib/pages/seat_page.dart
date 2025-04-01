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
        title: Text('예매 확인'),
        content: Text(
          '${widget.startStation}에서 ${widget.endStation}까지\n${selectedRow}열 ${String.fromCharCode(64 + selectedCol!)}석을 예매하시겠습니까?',
        ),
        actions: [
          CupertinoDialogAction(
            child: Text(
              '취소',
              style: TextStyle(color: Colors.red),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          CupertinoDialogAction(
            child: Text(
              '확인',
              style: TextStyle(color: Colors.blue),
            ),
            onPressed: () async {
              Navigator.pop(context); // 다이얼로그 닫기
              await Future.delayed(Duration(milliseconds: 200));
              Navigator.pop(context); // SeatPage 닫기
              await Future.delayed(Duration(milliseconds: 200));
              Navigator.pop(context); // HomePage로 이동
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
            buildStationHeader(),
            SizedBox(height: 20),
            buildSeatLegend(),
            SeatList(
              selectedCol: selectedCol,
              selectedRow: selectedRow,
              onSelected: onSelected,
            ),
            CommonButton(
              onPressed: _showBookingConfirmDialog,
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Row buildStationHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          widget.startStation,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.purple,
            fontSize: 30,
          ),
        ),
        Icon(Icons.arrow_circle_right_outlined),
        Text(
          widget.endStation,
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
