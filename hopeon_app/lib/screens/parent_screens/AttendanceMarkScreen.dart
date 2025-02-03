import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class AttendanceMarkScreen extends StatefulWidget {
  @override
  _AttendanceMarkScreenState createState() => _AttendanceMarkScreenState();
}

class _AttendanceMarkScreenState extends State<AttendanceMarkScreen> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  bool _schoolAttendance = true;
  bool _homeAttendance = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Attendance Mark"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TableCalendar(
              firstDay: DateTime.now(),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              calendarStyle: CalendarStyle(
                selectedDecoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                todayDecoration: BoxDecoration(
                  color: Colors.blue.shade200,
                  shape: BoxShape.circle,
                ),
              ),
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
              ),
            ),
            SizedBox(height: 20),
            Text("To School", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            RadioListTile<bool>(
              title: Text("Yes, I will come today."),
              value: true,
              groupValue: _schoolAttendance,
              onChanged: (value) => setState(() => _schoolAttendance = value!),
            ),
            RadioListTile<bool>(
              title: Text("No, I will not come today."),
              value: false,
              groupValue: _schoolAttendance,
              onChanged: (value) => setState(() => _schoolAttendance = value!),
            ),
            SizedBox(height: 10),
            Text("To Home", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            RadioListTile<bool>(
              title: Text("Yes, I will come today."),
              value: true,
              groupValue: _homeAttendance,
              onChanged: (value) => setState(() => _homeAttendance = value!),
            ),
            RadioListTile<bool>(
              title: Text("No, I will not come today."),
              value: false,
              groupValue: _homeAttendance,
              onChanged: (value) => setState(() => _homeAttendance = value!),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
                onPressed: () {
                  // Handle submit action
                },
                child: Text("Submit", style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
