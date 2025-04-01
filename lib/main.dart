import 'package:a/pages/home_page.dart';
import 'package:a/pages/seat_page.dart';
import 'package:a/pages/station_list_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: HomePage(),
      // home: StationListPage(),
      home: SeatPage(),
    );
  }
}
