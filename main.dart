import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'signup_screen.dart';
import 'login_screen.dart';
import 'data_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DataStorage.loadUserData();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habit Tracker',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/signup',
      routes: {
        '/signup': (context) => SignupScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
