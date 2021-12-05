import 'package:flutter/material.dart';

class newPost extends StatefulWidget {
  const newPost({ Key? key }) : super(key: key);

  @override
  _newPostState createState() => _newPostState();
}

class _newPostState extends State<newPost> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('New Post'),
    );
  }
}