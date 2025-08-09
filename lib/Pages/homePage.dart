import 'package:flutter/material.dart';
import 'package:playbook/Components/selectSportFromDropdown.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Column(children: [Selectsportfromdropdown()]),
    );
  }
}
