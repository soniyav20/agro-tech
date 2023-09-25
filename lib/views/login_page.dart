import 'package:agri/services/constants.dart';
import 'package:agri/services/service_imp.dart';
import 'package:agri/services/services.dart';
import 'package:agri/views/homepage.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool p = true;
  var openeye = Icons.remove_red_eye;
  var closeeye = Icons.visibility_off;
  var using = Icons.remove_red_eye;
  var enteredmail = '';
  var enteredpass = '';
  var newtext;
  var newpass;
  @override
  Widget build(BuildContext context) {
    Services obj = new ServiceImp();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Container(
          height: double.maxFinite,
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(30.0, 120.0, 30.0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    WidgetsBinding.instance.window.viewInsets.bottom > 0.0
                        ? SizedBox(
                            height: 0,
                          )
                        : SizedBox(
                            height: MediaQuery.of(context).size.height / 8,
                          ),

                    Center(
                      child: Text(
                        'Agro-Tech',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 40.0,
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 20),
                    TextFormField(
                      onChanged: (newtext) {
                        enteredmail = newtext.trim();
                      },
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          hintText: 'Enter your username',
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2, color: Colors.white), //<-- SEE HERE
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2, color: Colors.white54), //<-- SEE HERE
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 4, color: Colors.white54), //<-- SEE HERE
                          ),
                          prefixIcon: Icon(
                            Icons.drive_file_rename_outline_sharp,
                            color: Colors.white,
                          ),
                          hintStyle: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 40),
                    TextFormField(
                      onChanged: (newpass) {
                        enteredpass = newpass.trim();
                      },
                      style: TextStyle(color: Colors.white),
                      obscureText: p,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2, color: Colors.white), //<-- SEE HERE
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2, color: Colors.white54), //<-- SEE HERE
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 4, color: Colors.white54), //<-- SEE HERE
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.white),
                        ),
                        hintText: 'Enter your Password',
                        hintStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(
                          Icons.lock_outline_rounded,
                          color: Colors.white,
                        ),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                if (p == false) {
                                  p = true;
                                } else {
                                  p = false;
                                }
                                if (using == openeye) {
                                  using = closeeye;
                                } else {
                                  using = openeye;
                                }
                              });
                            },
                            icon: Icon(
                              using,
                              color: Colors.white,
                            )),
                      ),
                    ),
                    // TextButton(
                    //     onPressed: () {},
                    //     child: Text(
                    //       'Forgot Password?',
                    //       style: TextStyle(
                    //         decoration: TextDecoration.underline,
                    //         fontSize: 14.0,
                    //         fontWeight: FontWeight.w900,
                    //         color: Colors.white,
                    //       ),
                    //     )),
                    SizedBox(height: MediaQuery.of(context).size.height / 40),
                    Container(
                        width: double.infinity,
                        height: 54.0,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              shape:
                                  MaterialStateProperty.all(StadiumBorder())),
                          onPressed: () async {
                            // bool emailValid = RegExp(
                            //         r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            //     .hasMatch(enteredmail);

                            if (enteredmail == '' || enteredpass == '') {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(
                                  "Fill all the fields properly",
                                  style: TextStyle(color: Colors.black87),
                                ),
                                backgroundColor: Colors.white,
                              ));
                            } else {
                              if (enteredmail.length >= 3) {
                                try {
                                  print(enteredmail);
                                  print(enteredpass);
                                  if (enteredmail == "test" &&
                                      enteredpass == "PQZM@1234") {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePage()),
                                      (Route<dynamic> route) => false,
                                    );
                                    name = await getname();
                                    print(name);
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                        "Logged in Successfully",
                                        style: TextStyle(color: Colors.black87),
                                      ),
                                      backgroundColor: Colors.white,
                                    ));
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                        "Invalid Login",
                                        style: TextStyle(color: Colors.black87),
                                      ),
                                      backgroundColor: Colors.white,
                                    ));
                                  }
                                } on Exception catch (e) {
                                  print(e);

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                      e.toString(),
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                    backgroundColor: Colors.white,
                                  ));
                                }
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                    "Enter a valid mail",
                                    style: TextStyle(color: Colors.black87),
                                  ),
                                  backgroundColor: Colors.white,
                                ));
                              }
                            }
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.black87, fontSize: 25.0),
                          ),
                        )),
                    // SizedBox(
                    //   height: MediaQuery.of(context).size.height / 2,
                    // )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
