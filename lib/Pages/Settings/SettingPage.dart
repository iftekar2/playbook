import 'package:flutter/material.dart';

class Settingpage extends StatelessWidget {
  const Settingpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color(0xffffffff)),
      backgroundColor: const Color(0xffffffff),

      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 30),
        child: Column(
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 228, 228, 228),
                  width: 2,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 207, 207, 207),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      child: Icon(Icons.person, size: 60),
                    ),
                  ),

                  SizedBox(width: 15),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "User name",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "therere123there@gmail.com",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
