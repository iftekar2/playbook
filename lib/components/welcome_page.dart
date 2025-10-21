import 'dart:async';
import 'package:flutter/material.dart';
import 'package:playbook/components/login/email_login/pages/login_page.dart';
import 'package:playbook/components/login/google_signin/google_button.dart';
import 'package:playbook/components/login/google_signin/google_auth.dart';
import 'package:playbook/components/login/email_login/pages/signup_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with TickerProviderStateMixin {
  final List<String> images = [
    "https://i.pinimg.com/736x/13/ad/96/13ad96659cef69a4dfc527f6bfdc3166.jpg",
    "https://i.pinimg.com/736x/ec/04/6a/ec046a7b96e9fd597a28f356072c340f.jpg",
    "https://i.pinimg.com/736x/94/3a/76/943a767f9d5cb5fbba86be929086d594.jpg",
  ];

  int currentImageIndex = 0;
  late Timer _timer;
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;
  bool _isLoading = false;
  final GoogleAuth _googleAuth = GoogleAuth();

  @override
  void initState() {
    super.initState();

    // Initialize fade animation controller
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );

    // Start the fade animation for the first image
    _fadeController.forward();

    // Start the timer to rotate images
    _startImageRotation();
  }

  void _startImageRotation() {
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (mounted) {
        setState(() {
          currentImageIndex = (currentImageIndex + 1) % images.length;
        });

        // Restart fade animation for the new image
        _fadeController.reset();
        _fadeController.forward();
      }
    });
  }

  Future<void> _handleGoogleSignIn() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await _googleAuth.signInWithGoogle(context);
    } catch (e) {
      // Show error message to user
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Sign in failed: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Animated background image
          AnimatedBuilder(
            animation: _fadeAnimation,
            builder: (context, child) {
              return Opacity(
                opacity: _fadeAnimation.value,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(images[currentImageIndex]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),

          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.3),
                  Colors.black.withOpacity(0.2),
                ],
              ),
            ),
          ),

          Column(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment(0, -0.6),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'All Sports',
                        style: TextStyle(
                          fontSize: 68,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          height: 1.1,
                        ),
                      ),

                      const SizedBox(height: 10),
                      const Text(
                        'In One Place',
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          height: 1.1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(bottom: 35),
                child: SizedBox(
                  height: 270,
                  width: 400,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),

                    child: Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(350, 60),
                              backgroundColor: Color.fromRGBO(48, 40, 40, 1),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignupPage(),
                                ),
                              );
                            },
                            child: Text(
                              "Create new account",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),

                          SizedBox(height: 20),

                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                              );
                            },

                            child: Text(
                              "I already have an account",
                              style: TextStyle(
                                color: Color.fromRGBO(48, 40, 40, 1),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),

                          SizedBox(height: 10),

                          Divider(color: Color.fromRGBO(223, 223, 223, 1)),

                          SizedBox(height: 10),

                          Text(
                            "Sign up with",
                            style: TextStyle(
                              color: Color.fromRGBO(147, 147, 147, 1),
                              fontSize: 16,
                            ),
                          ),

                          SizedBox(height: 15),

                          _isLoading
                              ? Container(
                                  height: 55,
                                  width: 55,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                      color: Color.fromARGB(255, 215, 214, 214),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Center(
                                    child: SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                              Colors.grey[600]!,
                                            ),
                                      ),
                                    ),
                                  ),
                                )
                              : GoogleButton(
                                  onPressed: _handleGoogleSignIn,
                                  text: "Google",
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
