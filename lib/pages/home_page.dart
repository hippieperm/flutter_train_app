import 'package:a/pages/station_list_page.dart';
import 'package:a/pages/widgets/common_button.dart';
import 'package:a/pages/widgets/home/train_select_box.dart';
import 'package:a/pages/seat_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final VoidCallback onThemeToggle;
  final bool isDarkMode;

  const HomePage({
    super.key,
    required this.onThemeToggle,
    required this.isDarkMode,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? startStation;
  String? endStation;

  void _onStartStationSelected(String station) {
    setState(() {
      startStation = station;
    });
  }

  void _onEndStationSelected(String station) {
    setState(() {
      endStation = station;
    });
  }

  void _onSeatSelectPressed() {
    if (startStation == null || endStation == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('출발역과 도착역을 모두 선택해주세요.'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SeatPage(
          startStation: startStation!,
          endStation: endStation!,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('기차예매'),
        actions: [
          IconButton(
            icon: Icon(
              Theme.of(context).brightness == Brightness.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
            onPressed: widget.onThemeToggle,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TrainSelectBox(
              startStation: startStation,
              endStation: endStation,
              onStartStationTap: () async {
                final selected = await Navigator.push<String>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StationListPage(
                      title: '출발역',
                      excludeStation: endStation,
                    ),
                  ),
                );
                if (selected != null) {
                  _onStartStationSelected(selected);
                }
              },
              onEndStationTap: () async {
                final selected = await Navigator.push<String>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StationListPage(
                      title: '도착역',
                      excludeStation: startStation,
                    ),
                  ),
                );
                if (selected != null) {
                  _onEndStationSelected(selected);
                }
              },
            ),
            const SizedBox(height: 20),
            CommonButton(
              onPressed: _onSeatSelectPressed,
            ),
          ],
        ),
      ),
    );
  }
}
