import 'package:flutter/material.dart';
import 'package:playbook/Components/NBA.dart';
import 'package:playbook/Components/NFLData/NFLTeamRepository.dart';
import 'package:playbook/Components/NFLData/NFLTeamCategoryCard.dart';
import 'package:playbook/Components/NFLData/NFLMainPage.dart';

class Categorycard extends StatefulWidget {
  const Categorycard({super.key});

  @override
  State<Categorycard> createState() => _CategorycardState();
}

class _CategorycardState extends State<Categorycard> {
  final List<Map<String, String>> allSports = [
    {
      "name": "Football",
      "image": "lib/Images/National_Football_League_logo.svg.webp",
      "height": "60",
      "width": "60",
    },
    {
      "name": "Basketball",
      "image": "lib/Images/nba-logo-transparent.png",
      "height": "80",
      "width": "80",
    },
    {
      "name": "Soccer",
      "image":
          "lib/Images/fifa-official-logo-symbol-design-abstract-illustration-free-vector.jpg",
      "height": "60",
      "width": "60",
    },
    {
      "name": "Baseball",
      "image": "lib/Images/Major_League_Baseball_logo.svg.webp",
      "height": "80",
      "width": "80",
    },
  ];

  // Map sport name to corresponding page widget
  final Map<String, Widget> sportPages = {
    // "Football": Nfl(),
    "Football": Nflmainpage(),
    "Basketball": Nba(),
    // "Soccer": FIFA(),
    // "Baseball": MLB(),
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        height: 190,
        width: 500,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20, left: 20),
              child: const Text(
                "All Sports",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 5),
              child: SizedBox(
                height: 100,
                child: ListView.builder(
                  itemCount: allSports.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final sportName = allSports[index]["name"]!;
                    return Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: GestureDetector(
                        onTap: () {
                          final page = sportPages[sportName];
                          if (page != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => page),
                            );
                          }
                        },
                        child: Container(
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Image.asset(
                              allSports[index]["image"]!,
                              height: double.parse(allSports[index]["height"]!),
                              width: double.parse(allSports[index]["width"]!),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
