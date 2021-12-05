import 'package:bloctuto/bloc_page/bloc_event.dart';
import 'package:bloctuto/bloc_page/bloc_page.dart';
import 'package:bloctuto/bloc_page/bloc_state.dart';
import 'package:bloctuto/screens/home.dart';
import 'package:bloctuto/screens/login_screen.dart';
import 'package:bloctuto/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<blocPage>(create: (BuildContext context) => blocPage())
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<blocPage>(context).add(loginEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: loginScreen(),
      body: BlocBuilder<blocPage, BlocState>(
        builder: (BuildContext context, state) {
          if (state is loginState) {
            return loginScreen();
          } else if (state is registerState) {
            return registerScreen();
          } else {
            return home();
          }
        },
      ),
    );
  }
}
