import 'package:flutter/material.dart';

class Googlbutton extends StatelessWidget {
  const Googlbutton({
    super.key,
    required this.onPressed,
    this.text = "Google",
    this.imagePath = 'lib/Images/google-logo.png',
    this.backgroundColor = Colors.black,
    this.textColor = Colors.white,
  });

  final VoidCallback onPressed;
  final String text;
  final String imagePath;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 300,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ElevatedButton(
        onPressed: onPressed, // Use the provided onPressed callback
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          elevation: 0,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              imagePath, // Use the provided image path
              height: 40,
              width: 40,
            ),
            const SizedBox(width: 10),
            Text(
              text, // Use the provided text
              style: TextStyle(color: textColor, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
