import 'package:flutter/material.dart';

class GoogleButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final String imagePath;
  final Color textColor;

  const GoogleButton({
    super.key,
    required this.onPressed,
    this.text = "Google",
    this.imagePath = 'lib/components/login/google_signin/google-logo.png',
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 55,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shadowColor: Colors.transparent,
          padding: EdgeInsets.zero,

          backgroundColor: Colors.white,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
            side: const BorderSide(
              color: Color.fromARGB(255, 215, 214, 214),
              width: 1.0,
            ),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [Image.asset(imagePath, height: 20, width: 20)],
        ),
      ),
    );
  }
}
