import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:playbook/Pages/welcomePage.dart';

class Settingpage extends StatefulWidget {
  const Settingpage({super.key});

  @override
  State<Settingpage> createState() => _SettingpageState();
}

class _SettingpageState extends State<Settingpage> {
  Future<Map<String, dynamic>?> getUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) return null;
    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('User')
        .doc(user.uid)
        .get();
    return doc.data() as Map<String, dynamic>?;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color(0xffffffff)),
      backgroundColor: const Color(0xffffffff),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  FutureBuilder<Map<String, dynamic>?>(
                    future: getUserData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      }
                      if (!snapshot.hasData || snapshot.data == null) {
                        return Text("No user data found");
                      }
                      final userData = snapshot.data!;
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userData['name'] ?? "User name",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            userData['email'] ?? "Email",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(bottom: 50),
              child: GestureDetector(
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Welcomepage(),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.logout, color: Colors.red, size: 30),

                    SizedBox(width: 15),
                    Text(
                      "Signout",
                      style: TextStyle(fontSize: 20, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
