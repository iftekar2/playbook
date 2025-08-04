import 'package:flutter/material.dart';

class Googlbutton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final String imagePath;
  final Color textColor;

  const Googlbutton({
    super.key,
    required this.onPressed,
    this.text = "Google",
    this.imagePath = 'lib/Images/google-logo.png',
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 300,
      child: ElevatedButton(
        onPressed: onPressed, // Use the provided onPressed callback
        style: ElevatedButton.styleFrom(
          // Remove shadow and padding
          elevation: 0,
          shadowColor: Colors.transparent,
          padding: EdgeInsets.zero,

          // Set the button's background color
          backgroundColor: Colors.white,

          // This is the key change to make it less circular and add a border
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(
              color: Color.fromARGB(255, 215, 214, 214),
              width: 1.0, // The thickness of your border
            ),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              imagePath, // Use the provided image path
              height: 40,
              width: 40,
            ),
            const SizedBox(width: 15),
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
