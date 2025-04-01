import 'package:a/data/data.dart';
import 'package:flutter/material.dart';

class TrainList extends StatelessWidget {
  final String? excludeStation;

  const TrainList({
    super.key,
    this.excludeStation,
  });

  @override
  Widget build(BuildContext context) {
    final filteredStations = excludeStation != null
        ? trainStations.where((station) => station != excludeStation).toList()
        : trainStations;

    return ListView.builder(
      itemCount: filteredStations.length,
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          Navigator.pop(context, filteredStations[index]);
        },
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey[300]!,
                width: 1,
              ),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  '${filteredStations[index]}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
