import 'package:flutter/material.dart';

class SeatList extends StatelessWidget {
  int? selectedRow;
  int? selectedCol;
  void Function(int row, int col) onSelected;

  SeatList({
    this.selectedRow,
    this.selectedCol,
    required this.onSelected,
  });

  String getColumnLabel(int col) {
    return String.fromCharCode(65 + col - 1);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ListView(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 왼쪽 좌석 (A, B)
                          for (int col = 1; col <= 2; col++) ...[
                            Column(
                              children: [
                                Container(
                                  height: 30,
                                  width: 50,
                                  alignment: Alignment.center,
                                  child: Text(
                                    getColumnLabel(col),
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                for (int row = 1; row <= 20; row++)
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: seat(row, col),
                                  ),
                              ],
                            ),
                            if (col < 2) SizedBox(width: 4),
                          ],

                          // 가운데 번호
                          SizedBox(width: 20),
                          Column(
                            children: [
                              SizedBox(height: 30),
                              for (int i = 1; i <= 20; i++)
                                Container(
                                  height: 50,
                                  width: 30,
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(bottom: 8),
                                  child: Text(
                                    '$i',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          SizedBox(width: 20),

                          // 오른쪽 좌석 (C, D)
                          for (int col = 3; col <= 4; col++) ...[
                            Column(
                              children: [
                                Container(
                                  height: 30,
                                  width: 50,
                                  alignment: Alignment.center,
                                  child: Text(
                                    getColumnLabel(col),
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                for (int row = 1; row <= 20; row++)
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: seat(row, col),
                                  ),
                              ],
                            ),
                            if (col < 4) SizedBox(width: 4),
                          ],
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget seat(int rowNum, int colNum) {
    return GestureDetector(
      onTap: () => onSelected(rowNum, colNum),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: rowNum == selectedRow && colNum == selectedCol
              ? Colors.purple
              : Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
