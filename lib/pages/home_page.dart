import 'package:a/pages/widgets/common_button.dart';
import 'package:a/pages/widgets/select_box.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('기차예매'),
      ),
      backgroundColor: Colors.grey[200],
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectBox(),
            SizedBox(height: 20),
            CommonButton(),
          ],
        ),
      ),
    );
  }
}
