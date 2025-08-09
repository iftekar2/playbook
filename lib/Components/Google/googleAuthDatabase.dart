import 'package:cloud_firestore/cloud_firestore.dart';

class Googleauthdatabase {
  Future addUser(String userId, Map<String, dynamic> userInfoMap) async {
    return FirebaseFirestore.instance
        .collection("User")
        .doc(userId)
        .set(userInfoMap);
  }
}
