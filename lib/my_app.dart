

import 'package:auntie_rafiki_appointments/pages/Home_page.dart';
import 'package:auntie_rafiki_appointments/pages/auth/login_page.dart';
import 'package:auntie_rafiki_appointments/pages/boom_color_changer_page.dart';
import 'package:auntie_rafiki_appointments/providers/auth_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  build(BuildContext context) async {
    return ChangeNotifierProvider(
      create: (context) {
        return AuthProvider();
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LogInPage(),
        routes: {
          "boom_color_changer": (context) {
            return BoomColorChanger();
          },
          "home_page": (context) {
            return HomePage();
          }
        },
      ),
    );
  }
}
