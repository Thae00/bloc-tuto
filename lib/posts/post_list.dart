import 'package:bloctuto/auth/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class postList extends StatefulWidget {
  const postList({Key? key}) : super(key: key);

  @override
  _postListState createState() => _postListState();
}

class _postListState extends State<postList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: StreamBuilder<QuerySnapshot>(
        stream: Auth().getPosts(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshots) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshots.data!.docs.length,
            itemBuilder: (context, index) {
              return Text("${snapshots.data!.docs[index]['title']}");
            },
          );
        },
      ),
    );
  }
}
