import 'dart:convert';
import 'package:flutter/services.dart'; // For rootBundle to load file contents

class DataStorage {
  static Map<String, String> _userData = {};

  // Load user data from JSON file (For initial setup)
  static Future<void> loadUserData() async {
    try {
      final jsonString = await rootBundle.loadString('assets/user_data.json');
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      _userData = Map<String, String>.from(jsonData);
    } catch (e) {
      print('Error loading user data: $e');
    }
  }

  // Save new user data
  static void saveUserData(String username, String password) {
    _userData[username] = password;
    // Normally, you'd write to a file or database here.
  }

  // Validate user login
  static bool validateUser(String username, String password) {
    return _userData[username] == password;
  }
}
