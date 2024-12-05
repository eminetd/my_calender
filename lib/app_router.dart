import 'package:flutter/material.dart';
import 'package:my_calendar/home_screen.dart';
import 'package:my_calendar/calendar_screen.dart';

import '../route_names.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case RouteNames.calendar:
        final Map<String, dynamic>? arguments =
            settings.arguments as Map<String, dynamic>?;
        final String selectedDay = arguments?['selectedDay'] ?? 'Sunday';

        final int customDays = arguments?['customDays'] ?? 0;
        return MaterialPageRoute(
          builder: (_) => CalendarScreen(
            selectedDay: selectedDay,
            customDays: customDays,
          ),
        );

      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}
