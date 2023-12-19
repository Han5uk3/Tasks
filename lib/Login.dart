import 'package:flutter/material.dart';
import 'package:your_login/homePage.dart';
import 'package:your_login/my_flutter_app_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  @override

  Future <void> pageselector() async{

    SharedPreferences pr =await SharedPreferences.getInstance();
    String? emstat = pr.getString("key1");
    String? pwdstat = pr.getString("key2");

    if(emstat != null && pwdstat != null){
      Navigator.push(context, MaterialPageRoute(builder: (context) => Myhome(),));
    }
  }
void initState() {
    // TODO: implement initState
    super.initState();
    pageselector();
  }

  final pwdFocus = FocusNode();
  final loginFocus = FocusNode();


  TextEditingController em = TextEditingController();
  TextEditingController pwd = TextEditingController();

  GlobalKey<FormState> fk = GlobalKey();
  bool pd = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: fk,
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(children: [
              Image(
                  width: 400,
                  height: 200,
                  image: AssetImage("assets/images/WDR.jpeg")),
              Expanded(
                  child: Container(
                width: MediaQuery.of(context).size.width - 40,
                margin: EdgeInsets.only(left: 40, right: 40),
                decoration: BoxDecoration(
                    color: Color(0x2B2F3EFF),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(300),
                    )),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, top: 30),
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              decorationColor: Colors.white,
                              decorationStyle: TextDecorationStyle.solid,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 105,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 10),
                      child: TextFormField(
                        controller: em,
                        validator: (ve) {
                          if (ve!.isEmpty) {
                            return "Field is empty!";
                          }
                          return null;
                        },
                        onEditingComplete: () => FocusScope.of(context).requestFocus(pwdFocus),
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            label: Text(
                              "Email Address",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            suffixIcon: Icon(
                              Icons.mail,
                              color: Colors.white,
                            ),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white,
                                    style: BorderStyle.solid))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        validator: (em) {
                          if (em!.isEmpty) {
                            return "Field is empty!";
                          }
                          return null;
                        },
                        onEditingComplete: () => FocusScope.of(context).requestFocus(loginFocus),
                        focusNode: pwdFocus,
                        controller: pwd,
                        style: TextStyle(color: Colors.white),
                        obscureText: pd,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                            label: Text(
                              "Password",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            suffixIcon: pd
                                ? IconButton(
                                    icon: Icon(Icons.visibility),
                                    onPressed: () {
                                      pd = !pd;
                                      setState(() {});
                                    },
                                    color: Colors.white,
                                  )
                                : IconButton(
                                    onPressed: () {
                                      pd = !pd;
                                      setState(() {});
                                    },
                                    icon: Icon(Icons.visibility_off),
                                    color: Colors.white,
                                  ),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white,
                                    style: BorderStyle.solid))),
                      ),
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 30, right: 20),
                          child: Text(
                            "Forgot Password",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Container(
                          height: 65,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.red.shade900),
                          child: ElevatedButton(focusNode: loginFocus,
                              style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Colors.transparent)),
                              onPressed: () async {
                                if (fk.currentState!.validate()) {
                                  if (fk.currentState!.validate()) {
                                    SharedPreferences.getInstance().then((SharedPreferences pref) {
                                      pref.setString("key1", em.text);
                                      pref.setString("key2", pwd.text);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Myhome(),
                                        ),
                                      );
                                    }).catchError((error) {
                                      print('Error saving to SharedPreferences: $error');
                                      // Handle the error as needed
                                    });
                                  }
                                }
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24),
                              ))),
                    )
                  ],
                ),
              )),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 20),
                child: Row(
                  children: [
                    Expanded(
                        child: Divider(
                            thickness: 0.5,
                            indent: 40,
                            endIndent: 10,
                            color: Colors.red.shade900)),
                    Text(
                      "OR",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                        child: Divider(
                            thickness: 0.5,
                            indent: 10,
                            endIndent: 40,
                            color: Colors.red.shade900)),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 32.5,
                    backgroundColor: Color(0x2B2F3EFF),
                    child: Icon(
                      MyFlutterApp.google,
                      color: Colors.red.shade900,
                    ),
                  ),
                  CircleAvatar(
                    radius: 32.5,
                    backgroundColor: Color(0x2B2F3EFF),
                    child: Icon(
                      MyFlutterApp.facebook,
                      color: Colors.red.shade900,
                    ),
                  ),
                  CircleAvatar(
                    radius: 32.5,
                    backgroundColor: Color(0x2B2F3EFF),
                    child: Icon(
                      MyFlutterApp.twitter,
                      color: Colors.red.shade900,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
