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
              //return Text("${snapshots.data!.docs[index]['title']}");
              return Card(
                color: Color(0xffFFF0EC),
                elevation: 3,
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      padding: EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 20,
                      ),
                      child: Text(
                        "${snapshots.data!.docs[index]['title']}",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.edit,
                        color: Color(0xff4F295D),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.delete,
                        color: Color(0xffFF8573),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
