import 'package:flutter/material.dart';

class SportsOptions extends StatefulWidget {
  final Function(String)? onSportSelected;

  const SportsOptions({super.key, this.onSportSelected});

  @override
  State<SportsOptions> createState() => _SportsOptionsState();
}

class _SportsOptionsState extends State<SportsOptions> {
  int _selectedIndex = 0;

  void _navigateToSportPage(String sport) {
    // Use the callback to navigate within the main navigation system
    widget.onSportSelected?.call(sport);
  }

  // Sports Logo List - Updated to match the image
  List<Map<String, dynamic>> sportsLogos = [
    {"name": "All", "isLocal": false},
    {
      "name": "NFL",
      "logo":
          "https://upload.wikimedia.org/wikipedia/en/thumb/a/a2/National_Football_League_logo.svg/873px-National_Football_League_logo.svg.png",
      "isLocal": false,
    },
    {
      "name": "NBA",
      "logo":
          "https://upload.wikimedia.org/wikipedia/en/thumb/0/03/National_Basketball_Association_logo.svg/210px-National_Basketball_Association_logo.svg.png",
      "isLocal": false,
    },
    {
      "name": "NHL",
      "logo":
          "https://upload.wikimedia.org/wikipedia/en/thumb/3/3a/05_NHL_Shield.svg/380px-05_NHL_Shield.svg.png",
      "isLocal": false,
    },
    {
      "name": "MLB",
      "logo":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a6/Major_League_Baseball_logo.svg/500px-Major_League_Baseball_logo.svg.png",
      "isLocal": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: sportsLogos.length,
                itemBuilder: (context, index) {
                  final sport = sportsLogos[index];
                  final isSelected = _selectedIndex == index;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                      widget.onSportSelected?.call(sport['name']);
                    },
                    child: Container(
                      width: 90,
                      child: Column(
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromRGBO(48, 40, 40, 1),
                              border: Border.all(
                                color: isSelected
                                    ? Colors.white
                                    : const Color.fromARGB(0, 215, 5, 5),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: sport['logo'] != null
                                  ? Image.network(
                                      sport['logo'],
                                      fit: BoxFit.contain,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                            return Icon(
                                              Icons.apps,
                                              color: Colors.white,
                                              size: 24,
                                            );
                                          },
                                    )
                                  : Icon(
                                      Icons.apps,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            sport['name'],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
