import 'package:a/data/data.dart';
import 'package:flutter/material.dart';

class StationListPage extends StatelessWidget {
  const StationListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('출발역'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        itemCount: trainStations.length,
        itemBuilder: (context, index) => Text(
          '${trainStations[index]}',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
