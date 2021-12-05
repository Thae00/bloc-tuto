import 'package:bloctuto/bloc_page/bloc_event.dart';
import 'package:bloctuto/bloc_page/bloc_page.dart';
import 'package:bloctuto/bloc_page/bloc_state.dart';
import 'package:bloctuto/posts/new_post.dart';
import 'package:bloctuto/posts/post_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<blocPage>(context).add(newPostEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Color(0xff4F295D),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Color(0xff4F295D)),
              accountName: Text('Thae'),
              accountEmail: Text('thae@gmail.com'),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text(
                "New Post",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                BlocProvider.of<blocPage>(context).add(newPostEvent());
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text(
                "Post Lists",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                BlocProvider.of<blocPage>(context).add(postListEvent());
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text(
                "Logout",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: BlocBuilder<blocPage, BlocState>(
          builder: (BuildContext context, state) {
        if (state is newPostState) {
          return newPost();
        } else if (state is postListState) {
          return postList();
        } else {
          return postList();
        }
      }),
    );
  }
}
