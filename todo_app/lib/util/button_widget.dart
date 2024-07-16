import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    this.action,
    required this.buttonText,
    super.key,
  });
  final String buttonText;
  final void Function()? action;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: const Color(0xFF4959F4),
          // fixedSize: Size(300, 20),
        ),
        onPressed: action,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Text(
            buttonText,
            style: const TextStyle(fontSize: 17),
          ),
        ),
      ),
    );
  }
}
