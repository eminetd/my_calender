import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarScreen extends StatefulWidget {
  final String selectedDay;
  final int customDays;

  const CalendarScreen({
    Key? key,
    required this.selectedDay,
    required this.customDays,
  }) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late DateTime _currentMonth;

  @override
  void initState() {
    super.initState();
    _currentMonth = DateTime(DateTime.now().year, 7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calendar App',
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              DateFormat.yMMMM().format(_currentMonth),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 0, 0),
                backgroundColor: Color.fromARGB(255, 242, 255, 0),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return Container(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 6,
                            childAspectRatio: 1.0,
                            crossAxisSpacing: 0,
                            mainAxisExtent: (constraints.maxHeight - 200) / 5,
                            mainAxisSpacing: 0,
                          ),
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 42,
                          itemBuilder: (BuildContext context, int index) {
                            int i = (index % 6);
                            int j = (index / 6).floor();
                            if (i == 0 && j <= 6) {
                              return Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blue),
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                ),
                                child: Text(
                                  _getWeekDays()[j],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: _getWeekDays()[j] == 'Sun'
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              );
                            } else {
                              int firstDayOfWeekIndex =
                                  _getDayIndex(widget.selectedDay);
                              int numDaysInMonth = widget.customDays;
                              int gridValue =
                                  ((i * 7) + j) - firstDayOfWeekIndex - 6;
                              int dateValue =
                                  gridValue == -5 && numDaysInMonth >= 30
                                      ? gridValue = 30
                                      : gridValue == -4 && numDaysInMonth == 31
                                          ? gridValue = 31
                                          : gridValue <= 0 ||
                                                  gridValue > numDaysInMonth
                                              ? 0
                                              : gridValue;
                              print(dateValue);

                              return dateValue == 0
                                  ? Container()
                                  : AspectRatio(
                                      aspectRatio: 1.0,
                                      child: Padding(
                                        padding: EdgeInsets.zero,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: const Color.fromARGB(
                                                  255, 255, 0, 4),
                                            ),
                                          ),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              gridValue.toString(),
                                              style: const TextStyle(
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                              );
                            }
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 166, 39, 176),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.home),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.settings),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<String> _getWeekDays() {
    final DateFormat dateFormat = DateFormat.E();
    final DateTime firstDayOfWeek = _currentMonth.subtract(
        Duration(days: (_currentMonth.weekday - DateTime.sunday + 7) % 7));
    return List.generate(7, (index) {
      final day = firstDayOfWeek.add(Duration(days: index));
      return dateFormat.format(day);
    });
  }

  int _getDayIndex(String day) {
    switch (day) {
      case 'Sunday':
        return 0;
      case 'Monday':
        return 1;
      case 'Tuesday':
        return 2;
      case 'Wednesday':
        return 3;
      case 'Thursday':
        return 4;
      case 'Friday':
        return 5;
      case 'Saturday':
        return 6;
      default:
        return 0;
    }
  }
}
