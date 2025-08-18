import 'package:appointment_app/core/theming/app_colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen",
        ),
        backgroundColor: AppColors.mainBlue,
      ),
      body: Center(
        child: Text("This is home Screen!!!!!",
        style: TextStyle(
          fontSize: 30,
        ),
        ),
      ),
    );
  }
}
