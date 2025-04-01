import 'package:a/data/data.dart';
import 'package:a/pages/widgets/list/train_list.dart';
import 'package:flutter/material.dart';

class StationListPage extends StatelessWidget {
  final String title;
  final String? excludeStation; // 제외할 역

  const StationListPage({
    super.key,
    required this.title,
    this.excludeStation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: IconButton(
          icon:  const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TrainList(
          excludeStation: excludeStation,
        ),
      ),
    );
  }
}
