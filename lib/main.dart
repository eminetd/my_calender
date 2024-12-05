import 'package:flutter/material.dart';
import 'package:my_calendar/app_router.dart';
import 'package:my_calendar/route_names.dart';
// ignore: unused_import
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calendar App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: 'Georgia',
        primarySwatch: Colors.blue,
      ),
      initialRoute: RouteNames.home,
      onGenerateRoute: _appRouter.generateRoute,
    );
  }
}
