import 'package:flutter/material.dart';
import 'habit_details_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> habits = [];

  void addHabit(String habit) {
    setState(() {
      habits.add(habit);
    });
  }

  void resetHabits() {
    setState(() {
      habits.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Habit Tracker'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: resetHabits,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: habits.length,
        itemBuilder: (context, index) {
          final habit = habits[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            color: Colors.blueAccent.withOpacity(0.2),
            child: ListTile(
              title: Text(
                habit,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => HabitDetailsScreen(habit: habit),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newHabit = await showDialog<String>(
            context: context,
            builder: (context) => AddHabitDialog(),
          );
          if (newHabit != null) {
            addHabit(newHabit);
          }
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.pinkAccent,
      ),
    );
  }
}

class AddHabitDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return AlertDialog(
      title: Text('Add New Habit'),
      content: TextField(
        controller: controller,
        decoration: InputDecoration(hintText: 'Enter habit name'),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(controller.text);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.pinkAccent,
          ),
          child: Text('Add'),
        ),
      ],
    );
  }
}
