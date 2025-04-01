import 'package:flutter/material.dart';

class SelectBox extends StatelessWidget {
  const SelectBox({
    super.key,
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
          const Column(
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
          const Column(
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
      ),
    );
  }
}
