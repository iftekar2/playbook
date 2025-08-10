import 'package:flutter/material.dart';

class Selectsportfromdropdown extends StatefulWidget {
  const Selectsportfromdropdown({super.key});

  @override
  State<Selectsportfromdropdown> createState() =>
      _SelectsportfromdropdownState();
}

class _SelectsportfromdropdownState extends State<Selectsportfromdropdown> {
  final differentSports = [
    "All",
    "Football",
    "Basketball",
    "Soccer",
    "Baseball",
  ];

  // To store whichever sport the user selects
  String? selectedSport;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 75),
      child: Column(
        children: [
          SizedBox(
            height: 50,
            width: 140,
            child: DropdownButtonFormField<String>(
              borderRadius: BorderRadius.circular(10),
              dropdownColor: Colors.white,
              hint: const Text("Select"),
              value: selectedSport,
              onChanged: (String? newValue) {
                setState(() {
                  selectedSport = newValue;
                });
              },
              items: differentSports.map<DropdownMenuItem<String>>((
                String value,
              ) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Center(child: Text(value)),
                );
              }).toList(),
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(240, 240, 240, 240),
                contentPadding: const EdgeInsets.only(
                  top: 20.0,
                  left: 15,
                  right: 15,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
