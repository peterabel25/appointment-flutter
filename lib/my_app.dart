import 'package:auntie_rafiki_appointments/pages/Home_page.dart';
import 'package:auntie_rafiki_appointments/pages/auth/event_list_page.dart';
import 'package:auntie_rafiki_appointments/pages/auth/login_page.dart';
import 'package:auntie_rafiki_appointments/pages/boom_color_changer_page.dart';
import 'package:auntie_rafiki_appointments/pages/event_page.dart';
import 'package:auntie_rafiki_appointments/providers/auth_provider.dart';
import 'package:auntie_rafiki_appointments/providers/event_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return AuthProvider();
        }),
        ChangeNotifierProvider(create: (context) {
          return EventProvider();
        })
      ],
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
          },
          "events": (context) {
            return EventList();
          }
        },
        onGenerateRoute: (RouteSettings settings) {
          final arguments = settings.arguments as Map<String, dynamic>;

          switch (settings.name) {
            case "event":
              final eventId = arguments['id'];
              return MaterialPageRoute(builder: (_) {
                return EventPage(
                  id: eventId,
                );
              });
          }
          ;
        },
      ),
    );
  }
}
