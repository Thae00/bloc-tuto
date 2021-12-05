import 'package:bloctuto/posts/post_list.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
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
              onTap: () {},
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
              onTap: () {},
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
      body: postList(),
    );
  }
}
