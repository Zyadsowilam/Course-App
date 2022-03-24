// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:text_divider/text_divider.dart';
import 'package:bottom_sheet/bottom_sheet.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _MyAppState();
}

class _MyAppState extends State<Login> {
  var emailctr = TextEditingController();
  var passctr = TextEditingController();
  var signemailctr = TextEditingController();
  var signpassctr = TextEditingController();
  var signpassctr2 = TextEditingController();
  var formkey = GlobalKey<FormState>();
  var formkey2 = GlobalKey<FormState>();
  var scaffoldkey = GlobalKey<ScaffoldState>();
  bool isscure = true;
  bool isscure2 = true;
  int mycolor = Colors.grey[200]!.value;
  String signupmsg = '';

  Widget signsheet(context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, bottom: 6, right: 10, top: 19),
      child: Form(
        key: formkey2,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Email address can not be empty';
                  }
                  return null;
                },
                controller: signemailctr,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  labelText: 'Email',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'password can not be empty';
                  }
                  return null;
                },
                controller: signpassctr,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  labelText: 'Password',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'password can not be empty';
                  }
                  if (signpassctr.text != signpassctr2.text) {
                    return 'You must write the same password twice';
                  }
                  if (signpassctr.text == signpassctr2.text) {
                    return null;
                  }
                },
                controller: signpassctr2,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  labelText: 'Confirm  Password',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8, right: 8, top: 8),
              child: ElevatedButton(
                onPressed: () {
                  if (formkey2.currentState!.validate()) {
                    print('Thanks');

                    Navigator.pop(context);
                  }
                },
                child: Text('sign up', style: TextStyle(fontSize: 17)),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    primary: Colors.teal[300],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          color: Colors.teal[800],
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  color: Colors.white),
              child: Padding(
                padding: EdgeInsets.all(21),
                child: Form(
                  key: formkey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 27,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 55,
                        ),
                        Text(
                          'Welcome to coursera',
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Email address can not be empty';
                            }
                            return null;
                          },
                          controller: emailctr,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            suffixIcon: Icon(Icons.person),
                          ),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'password address can not be empty';
                            }
                            return null;
                          },
                          controller: passctr,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: isscure,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isscure = !isscure;
                                  });
                                },
                                icon: isscure
                                    ? Icon(Icons.visibility_sharp)
                                    : Icon(Icons.visibility_off)),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              print('thanks');
                            }
                          },
                          child:
                              Text('sign in', style: TextStyle(fontSize: 17)),
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(horizontal: 40),
                              primary: Colors.teal[700],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50))),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextDivider.horizontal(
                            text: Text('or'),
                            color: Colors.black,
                            size: 50,
                            thickness: .7),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('New account ?',
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold)),
                            TextButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                      backgroundColor: Colors.grey[200],
                                      context: context,
                                      builder: signsheet,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(10))));
                                },
                                child: Text(
                                  'Sign up',
                                  style: TextStyle(
                                      color: Colors.black38,
                                      decoration: TextDecoration.underline),
                                ))
                          ],
                        )
                      ]),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
