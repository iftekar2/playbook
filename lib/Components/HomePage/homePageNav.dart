import 'package:flutter/material.dart';
import 'package:playbook/Pages/Settings/SettingPage.dart';

class Homepagenav extends StatelessWidget {
  const Homepagenav({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 40),
      child: Row(
        children: [
          Image.asset('lib/Images/Logo3.png', width: 200, height: 100),
          // lib/Images/Logo3.png
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const Settingpage()),
                  ),
                );
              },
              icon: Icon(Icons.settings, size: 35),
            ),
          ),
        ],
      ),
    );
  }
}
