import 'package:appointment_app/core/di/dependancy_injection.dart';
import 'package:appointment_app/core/routing/routes.dart';
import 'package:appointment_app/features/home/logic/home_cubit.dart';
import 'package:appointment_app/features/home/presentation/home_screen.dart';
import 'package:appointment_app/features/login/logic/login_cubit.dart';
import 'package:appointment_app/features/sign_up/logic/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../features/login/presentation/login_screen.dart';
import '../../features/onboarding/onboarding_screen.dart';
import '../../features/sign_up/presentation/sign_up_screen.dart';

class AppRouter {

  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) =>
            BlocProvider(
              create: (context) => getIt<LoginCubit>(),
              child: LoginScreen(),
            ));
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) =>
            BlocProvider(
              create: (context) => HomeCubit(getIt())..getSpecialization(),
              child: HomeScreen(),
            ));
      case Routes.signupScreen:
        return MaterialPageRoute(builder: (_) =>
            BlocProvider(
              create: (context) => getIt<SignUpCubit>(),
              child: SignUpScreen(),
            ));
      default:
        return MaterialPageRoute(builder: (_) =>
            Scaffold(
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