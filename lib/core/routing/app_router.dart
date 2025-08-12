import 'package:appointment_app/core/routing/routes.dart';
import 'package:appointment_app/features/login/presentation/screen/login_screen.dart';
import 'package:appointment_app/features/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';

class AppRouter{

  Route generateRoute(RouteSettings settings){
    switch(settings.name){
      case Routes.onboardingScreen:
        return MaterialPageRoute(builder: (_)=>OnboardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_)=>LoginScreen());
      default:
        return MaterialPageRoute(builder: (_)=>Scaffold(
          body: Text("No routing in ${settings.name}",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),),
        ));
    }
  }
}