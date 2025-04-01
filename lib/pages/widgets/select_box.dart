import 'package:flutter/material.dart';

class SelectBox extends StatelessWidget {
  const SelectBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '출발역',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '선택',
              style: TextStyle(
                fontSize: 40,
              ),
            ),
          ],
        ),
        Container(
          width: 2,
          height: 50,
          color: Colors.grey[400],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '출발역',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '선택',
              style: TextStyle(
                fontSize: 40,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
