import 'package:bloctuto/auth/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class editPost extends StatefulWidget {
  String id;
  editPost(this.id);

  @override
  _editPostState createState() => _editPostState();
}

class _editPostState extends State<editPost> {
  final key = GlobalKey<FormState>();
  late TextEditingController editTitleController;
  late TextEditingController editDesController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff4F295D),
        title: Text(
          'Edit Post',
        ),
      ),
      body: FutureBuilder(
        future: Auth().getPostId(widget.id),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshots) {
          Map<String, dynamic> post =
              snapshots.data!.data() as Map<String, dynamic>;
          editTitleController = TextEditingController(text: post['title']);
          editDesController = TextEditingController(text: post['description']);
          return Container(
            child: Column(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: Text(
                        'Edit Post',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff4F295D),
                        ),
                      ),
                    ),
                    Text(
                      'Create Edit Post here!',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xffFFF0EC),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Form(
                              key: key,
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          width: 1,
                                          color: Color(0xff4F295D),
                                        ),
                                      ),
                                    ),
                                    child: TextFormField(
                                      controller: editTitleController,
                                      validator: (val) {
                                        if (val == null || val.isEmpty) {
                                          return 'Post Title Much not Empty';
                                        }
                                      },
                                      decoration: InputDecoration(
                                        hintText: 'Enter Edit Title',
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          width: 1,
                                          color: Color(0xff4F295D),
                                        ),
                                      ),
                                    ),
                                    child: TextFormField(
                                      controller: editDesController,
                                      validator: (val) {
                                        if (val == null || val.isEmpty) {
                                          return 'Description Much not Empty';
                                        }
                                      },
                                      decoration: InputDecoration(
                                        hintText: 'Enter Edit Description',
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Container(
                              color: Color(0xff4F295D),
                              height: 50,
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: OutlinedButton(
                                onPressed: () {
                                  if (key.currentState!.validate()) {
                                    Auth().createPost(editTitleController.text,
                                        editDesController.text);
                                    editTitleController.text = "";
                                    editDesController.text = "";
                                  }
                                },
                                child: Text(
                                  'Save Post',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
