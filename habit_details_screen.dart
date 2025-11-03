import 'package:flutter/material.dart';

class HabitDetailsScreen extends StatefulWidget {
  final String habit;

  HabitDetailsScreen({required this.habit});

  @override
  _HabitDetailsScreenState createState() => _HabitDetailsScreenState();
}

class _HabitDetailsScreenState extends State<HabitDetailsScreen> {
  bool isDone = false;

  void _toggleDone() {
    setState(() {
      isDone = !isDone;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Habit Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.habit,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleDone,
              child: Text(isDone ? 'Mark as Undone' : 'Mark as Done'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
              ),
            ),
            if (isDone)
              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 100,
              ),
          ],
        ),
      ),
    );
  }
}
