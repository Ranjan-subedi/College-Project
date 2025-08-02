import 'package:cloud_firestore/cloud_firestore.dart';

class ChatServices{

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Get stream of msg
  Stream<List<Map<String,dynamic>>> getUsersStream(){
    return firestore.collection("clients").snapshots().map((snapshot) {
      return snapshot.docs.map((docs){
        final user = docs.data();
        return user;
      }).toList();
    },);
  }

  // Send message

  // GEt message


}