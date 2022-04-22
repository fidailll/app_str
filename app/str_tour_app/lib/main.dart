import 'package:flutter/material.dart';
import 'package:str_tour_app/features/str_tour/presentation/pages/map.dart';
import 'package:str_tour_app/features/str_tour/presentation/pages/virtual_tour.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Стерлитамак',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyMap(), //WebViewPage(),
    );
  }
}
