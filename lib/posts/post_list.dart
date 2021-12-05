import 'package:flutter/material.dart';

class postList extends StatefulWidget {
  const postList({ Key? key }) : super(key: key);

  @override
  _postListState createState() => _postListState();
}

class _postListState extends State<postList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Post Lists'),
    );
  }
}