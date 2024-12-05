import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:my_calendar/app_router.dart';
import 'package:my_calendar/route_names.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String selectedDay;
  int? customDays;

  @override
  void initState() {
    super.initState();
    selectedDay = 'Sunday';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Select a day:',
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                for (final day in [
                  'Sunday',
                  'Monday',
                  'Tuesday',
                  'Wednesday',
                  'Thursday',
                  'Friday',
                  'Saturday'
                ])
                  RadioListTile<String>(
                    title: Text(day),
                    value: day,
                    groupValue: selectedDay,
                    onChanged: (value) {
                      setState(() {
                        selectedDay = value!;
                      });
                    },
                  ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Custom days in the month:',
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (final days in [28, 29, 30, 31])
                  Row(
                    children: [
                      Radio<int>(
                        value: days,
                        groupValue: customDays,
                        onChanged: (value) {
                          setState(() {
                            customDays = value;
                          });
                        },
                      ),
                      Text(days.toString()),
                    ],
                  ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (customDays != null && customDays! > 0) {
                  Navigator.pushNamed(
                    context,
                    RouteNames.calendar,
                    arguments: {
                      'selectedDay': selectedDay,
                      'customDays': customDays,
                    },
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.purple, // Set the button color to purple
              ),
              child: const Text('Open Calendar'),
            ),
          ],
        ),
      ),
    );
  }
}
