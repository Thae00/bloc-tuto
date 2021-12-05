import 'package:flutter/material.dart';

class newPost extends StatefulWidget {
  const newPost({Key? key}) : super(key: key);

  @override
  _newPostState createState() => _newPostState();
}

class _newPostState extends State<newPost> {
  final key = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController desController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Text(
                    'New Post',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff4F295D),
                    ),
                  ),
                ),
                Text(
                  'Create New Post here!',
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
                                  controller: titleController,
                                  validator: (val) {
                                    if (val == null || val.isEmpty) {
                                      return 'Post Title Much not Empty';
                                    }
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Enter new Post Title',
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
                                  controller: desController,
                                  validator: (val) {
                                    if (val == null || val.isEmpty) {
                                      return 'Description Much not Empty';
                                    }
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Enter Description',
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
                              if (key.currentState!.validate()) {}
                            },
                            child: Text(
                              'Upload Post',
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
      ),
    );
  }
}
