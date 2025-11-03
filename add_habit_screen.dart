import 'package:flutter/material.dart';

class AddHabitScreen extends StatelessWidget {
  final Function(String) onAddHabit;

  AddHabitScreen({required this.onAddHabit});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Habit'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(hintText: 'Enter habit name'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final habit = controller.text;
                if (habit.isNotEmpty) {
                  onAddHabit(habit);
                  Navigator.of(context).pop();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
              ),
              child: Text('Add Habit'),
            ),
          ],
        ),
      ),
    );
  }
}
