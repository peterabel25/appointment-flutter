import 'package:auntie_rafiki_appointments/pages/boom_color_changer_page.dart';
import 'package:auntie_rafiki_appointments/pages/home_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        'boom_color_changer': (context) {
          return BoomColorChangerPage();
        }
      },
    );
  }
}
