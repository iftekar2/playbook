import 'package:flutter/material.dart';
import 'dart:async';

// Carousel Items that will be displayed in the welcome page
class CarouselItem {
  final String imagePath;
  final String title;
  final String description;

  CarouselItem({
    required this.imagePath,
    required this.title,
    required this.description,
  });
}

// List of Carousel Items
final List<CarouselItem> carouselData = [
  CarouselItem(
    imagePath: 'lib/Images/NFL.jpg',
    title: "The NFL, Unfiltered",
    description:
        "Track every touchdown, every tackle, and every twist of the NFL season.",
  ),
  CarouselItem(
    imagePath: 'lib/Images/NBA.jpg', // Use different image paths
    title: "From Tip-Off to Buzzer",
    description:
        "Follow your favorite teams from the opening tip-off to the final buzzer.",
  ),
  CarouselItem(
    imagePath: 'lib/Images/Soccer.jpg',
    title: "The World's Game",
    description:
        "Catch all the action, from the Champions League to the World Cup, and never miss a goal.",
  ),
];

class Welcomepage extends StatefulWidget {
  const Welcomepage({super.key});

  @override
  State<Welcomepage> createState() => _WelcomepageState();
}

class _WelcomepageState extends State<Welcomepage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPage < carouselData.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildCarouselItems(CarouselItem carouselItem) {
    return Column(
      children: [
        Container(
          width: 600,
          height: 500,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), // Adjust the radius
            image: DecorationImage(
              image: AssetImage(carouselItem.imagePath),
              fit: BoxFit.cover, // Ensures the image fills the container
            ),
          ),
        ),

        SizedBox(height: 20),
        Text(
          carouselItem.title,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
        ),

        SizedBox(height: 10),
        Text(
          carouselItem.description,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
        child: Column(
          children: [
            Image.asset('lib/Images/Logo3.png', width: 200, height: 100),

            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: carouselData.length,
                itemBuilder: (context, index) {
                  return _buildCarouselItems(carouselData[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
