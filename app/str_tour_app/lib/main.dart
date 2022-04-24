import 'package:flutter/material.dart';
import 'package:str_tour_app/features/str_tour/presentation/pages/map_web.dart';
// import 'package:str_tour_app/features/str_tour/presentation/pages/virtual_tour.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // color: Colors.transparent,
      //shadowColor: Colors.transparent,
      title: 'Стерлитамак',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle:
              TextStyle(color: Color.fromARGB(255, 3, 24, 41), fontSize: 30),
          backgroundColor: Colors.white,
          // textTheme: TextTheme(
          //   titleLarge: TextStyle(color: Colors.black),
          // )
        ),
        //primarySwatch:MaterialColor(1, Colors.white70) ,
        textTheme: const TextTheme(
          titleLarge: TextStyle(color: Color.fromARGB(255, 3, 24, 41)),
        ),
      ),
      home: const MyMapWeb(), //WebViewPage(),
    );
  }
}
