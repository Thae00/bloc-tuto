import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  Future<Map<String, dynamic>> register(
      String userEmail, String userPassword) async {
    Map<String, dynamic> res = {"status": false};
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: userEmail, password: userPassword);
      res['status'] = true;
    } catch (e) {
      print(e);
    }
    return res;
  }

  createPost(String title, String des) {
    FirebaseFirestore.instance.collection("posts").add({
      "title": title,
      "description": des,
    });
  }

  //take post list from firestore in collection("posts")
  Stream<QuerySnapshot> getPosts() async* {
    Stream<QuerySnapshot> posts =
        FirebaseFirestore.instance.collection("posts").snapshots();
    yield* posts;
  }

  Future<DocumentSnapshot> getPostId(String id) async {
    DocumentSnapshot postId =
        await FirebaseFirestore.instance.collection("posts").doc(id).get();
    return postId;
  }

  updatePost(String title, String description, String id) {
    FirebaseFirestore.instance.collection("posts").doc(id).update({
      "title": title,
      "description": description,
    });
  }

  deletePost(String id) {
    FirebaseFirestore.instance.collection("posts").doc(id).delete();
  }
}
