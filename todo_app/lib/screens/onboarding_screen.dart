import 'package:flutter/material.dart';
import 'package:todo_app/screens/login_screen.dart';
import 'package:todo_app/util/button_widget.dart';

import 'package:todo_app/util/empty_space_widget.dart';

import '../util/cutomised_rich_text.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const EmptySpace(150),
          const OnboardingPageImage(),
          const EmptySpace(80),
          const CustomisedRichText(
            firstColor: Colors.black,
            secondColor: Color(0xFF4551D6),
            firstText: 'We \nwelcome you to ',
            secondText: 'tasky!',
            fontHeight: 35,
          ),
          const EmptySpace(15),
          const Text(
            style: TextStyle(fontSize: 17),
            'Manage all your products and tasks in \none place',
            textAlign: TextAlign.center,
          ),
          const EmptySpace(50),
          ButtonWidget(
            buttonText: 'Begin',
            action: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ));
            },
          ),
          const EmptySpace(20),
          const CustomisedRichText(
            firstColor: Color(0xFF9B9B9B),
            secondColor: Color(0xFF141319),
            firstText: 'You already have an account?',
            secondText: 'Log in',
            fontHeight: 17,
          ),
        ],
      ),
    );
  }
}

class OnboardingPageImage extends StatelessWidget {
  const OnboardingPageImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: 200,
      child: Image.asset(
        'assets/images/onboard.png',
        fit: BoxFit.fill,
      ),
    );
  }
}
