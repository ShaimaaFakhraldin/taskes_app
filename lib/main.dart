import 'package:flutter/material.dart';
import 'package:taskes_app/onboarding_screen.dart';
// layout
// container  - Scaffold
void main() {
  runApp(RootApp());

}
class RootApp  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Task app",
      home: Scaffold(
        body:

      OnboardingScreen()),

    );
  }
}


