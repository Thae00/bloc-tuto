import 'package:flutter/material.dart';

class registerScreen extends StatefulWidget {
  const registerScreen({Key? key}) : super(key: key);

  @override
  _registerScreenState createState() => _registerScreenState();
}

class _registerScreenState extends State<registerScreen> {
  final key = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xff4F295D),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Center(
                    child: Text(
                      'Register Account',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'To all special discounts and more\n become a member!',
                    style: TextStyle(
                      color: Color(0xffABA0A8),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
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
                        Container(
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
                                        controller: nameController,
                                        validator: (val) {
                                          if (val == null || val.isEmpty) {
                                            return 'Name Must not Empty';
                                          }
                                        },
                                        decoration: InputDecoration(
                                          hintText: "Enter Your Name",
                                          border: InputBorder.none,
                                        ),
                                      ),
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
                                        controller: emailController,
                                        validator: (val) {
                                          if (val == null || val.isEmpty) {
                                            return 'Email Must not Empty';
                                          }
                                        },
                                        decoration: InputDecoration(
                                          hintText: "Enter Your Email",
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
                                        controller: passwordController,
                                        validator: (val) {
                                          if (val == null || val.isEmpty) {
                                            return 'Password must Not Empty';
                                          }
                                        },
                                        decoration: InputDecoration(
                                          hintText: "Enter Your Password",
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text('Create New Account'),
                              ),
                              Container(
                                color: Color(0xff4F295D),
                                height: 50,
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: OutlinedButton(
                                  onPressed: () {
                                    if (key.currentState!.validate()) {}
                                  },
                                  child: Text(
                                    'Register',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
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
