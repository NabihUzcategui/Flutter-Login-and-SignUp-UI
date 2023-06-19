import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_singup_page/config/palette.dart';

class LoginSingupScreen extends StatefulWidget {
  const LoginSingupScreen({super.key});

  @override
  State<LoginSingupScreen> createState() => _LoginSingupScreenState();
}

class _LoginSingupScreenState extends State<LoginSingupScreen> {
  bool isMale = true;
  bool isSingupScreen = true;
  bool isRememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: Stack(
        children: [
          Positioned(
              top: 0.0,
              right: 0.0,
              left: 0.0,
              child: Container(
                height: 300.0,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/trecking.jpeg'),
                      fit: BoxFit.fill),
                ),
                child: Container(
                  padding: const EdgeInsets.only(top: 90, left: 20),
                  color: const Color(0xff3B5999).withOpacity(.85),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                            text: 'Welcome To',
                            style: TextStyle(
                                letterSpacing: 2,
                                fontSize: 25.0,
                                color: Colors.yellow[700]),
                            children: [
                              TextSpan(
                                text: isSingupScreen ? ' Rizona' : ' Back',
                                style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.yellow[700]),
                              )
                            ]),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        isSingupScreen
                            ? 'Signup to Continue'
                            : 'Singin to Continue',
                        style: const TextStyle(
                            letterSpacing: 1, color: Colors.white),
                      )
                    ],
                  ),
                ),
              )),

          //Trick to add the shadow for the ksubmit button
          builtBottomHalfContainer(true),

          //Main container for login and signup
          AnimatedPositioned(
              top: isSingupScreen ? 200.0 : 230.0,
              duration: const Duration(milliseconds: 700),
              curve: Curves.bounceInOut,
              child: AnimatedContainer(
                padding: const EdgeInsets.all(20.0),
                height: isSingupScreen ? 380.0 : 250.0,
                width: MediaQuery.of(context).size.width - 40,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 15.0,
                        spreadRadius: 5.0,
                      ),
                    ]),
                duration: const Duration(milliseconds: 700),
                curve: Curves.bounceInOut,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isSingupScreen = false;
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  'LOGIN',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: !isSingupScreen
                                        ? Palette.activeColor
                                        : Palette.textColor1,
                                  ),
                                ),
                                if (!isSingupScreen)
                                  Container(
                                    margin: const EdgeInsets.only(top: 3.0),
                                    height: 2.0,
                                    width: 55.0,
                                    color: Colors.orange,
                                  ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isSingupScreen = true;
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  'SINGUP',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: isSingupScreen
                                        ? Palette.activeColor
                                        : Palette.textColor1,
                                  ),
                                ),
                                if (isSingupScreen)
                                  Container(
                                    margin: const EdgeInsets.only(top: 3.0),
                                    height: 2.0,
                                    width: 55.0,
                                    color: Colors.orange,
                                  ),
                              ],
                            ),
                          )
                        ],
                      ),
                      if (isSingupScreen) buildSignupSection(),
                      if (!isSingupScreen) buildSigninSection()
                    ],
                  ),
                ),
              )),

          //Trick to add the submit buttom
          builtBottomHalfContainer(false),

          //Bottom buttons
          Positioned(
            top: MediaQuery.of(context).size.height - 140,
            left: 0.0,
            right: 0.0,
            child: Column(
              children: [
                Text(isSingupScreen ? 'or Signup with' : 'Or Signin with'),
                Container(
                  margin:
                      const EdgeInsets.only(left: 20.0, right: 20.0, top: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildTextButtom(
                          EvaIcons.facebook, 'Facebook', Palette.facebookColor),
                      buildTextButtom(
                          EvaIcons.google, 'Google', Palette.googleColor),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Container buildSigninSection() {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          buildTextField(
            EvaIcons.emailOutline,
            'info@nabihu.com',
            false,
            true,
          ),
          buildTextField(
            EvaIcons.lockOutline,
            '*************',
            true,
            false,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: isRememberMe,
                    activeColor: Palette.textColor2,
                    onChanged: (value) {
                      setState(() {
                        isRememberMe = !isRememberMe;
                      });
                    },
                  ),
                  const Text(
                    'Remember me',
                    style: TextStyle(fontSize: 11, color: Palette.textColor1),
                  ),
                ],
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Palette.textColor1,
                    ),
                  )),
            ],
          )
        ],
      ),
    );
  }

  Container buildSignupSection() {
    return Container(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          buildTextField(EvaIcons.person, 'User Name', false, false),
          buildTextField(EvaIcons.emailOutline, 'Email', false, true),
          buildTextField(EvaIcons.lockOutline, 'Password', true, false),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 10.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isMale = true;
                    });
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 30.0,
                        height: 30.0,
                        margin: const EdgeInsets.only(right: 8.0),
                        decoration: BoxDecoration(
                          color:
                              isMale ? Palette.textColor2 : Colors.transparent,
                          border: Border.all(
                            width: 1,
                            color: isMale
                                ? Colors.transparent
                                : Palette.textColor1,
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Icon(
                          EvaIcons.person,
                          color: isMale ? Colors.white : Palette.iconColor,
                        ),
                      ),
                      const Text(
                        'Male',
                        style: TextStyle(color: Palette.textColor1),
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 30.0),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isMale = false;
                    });
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 30.0,
                        height: 30.0,
                        margin: const EdgeInsets.only(right: 8.0),
                        decoration: BoxDecoration(
                          color:
                              isMale ? Colors.transparent : Palette.textColor2,
                          border: Border.all(
                            width: 1,
                            color: isMale
                                ? Palette.textColor1
                                : Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Icon(
                          EvaIcons.person,
                          color: isMale ? Palette.iconColor : Colors.white,
                        ),
                      ),
                      const Text(
                        'Female',
                        style: TextStyle(color: Palette.textColor1),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 200.0,
            margin: const EdgeInsets.only(top: 20.0),
            child: RichText(
                text: const TextSpan(
                    text: "By pressing 'Submit' you agree to our ",
                    style: TextStyle(color: Palette.textColor2),
                    children: [
                  TextSpan(
                    text: 'term & conditions',
                    style: TextStyle(color: Colors.orange),
                  )
                ])),
          ),
        ],
      ),
    );
  }

  TextButton buildTextButtom(
      IconData icon, String title, Color backgroundColor) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: Colors.white,
          minimumSize: const Size(155, 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: const BorderSide(width: 1, color: Colors.grey),
          )),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(
            width: 5,
          ),
          Text(title),
        ],
      ),
    );
  }

  Widget builtBottomHalfContainer(bool showShadow) {
    return AnimatedPositioned(
      top: isSingupScreen ? 535.0 : 435.0,
      right: 0.0,
      left: 0.0,
      duration: const Duration(milliseconds: 700),
      curve: Curves.bounceInOut,
      child: Center(
        child: Container(
          width: 90.0,
          height: 90.0,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                if (showShadow)
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 10,
                    spreadRadius: 1.5,
                    offset: const Offset(0, 1),
                  )
              ]),
          child: !showShadow
              ? Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Colors.orange.shade400,
                        Colors.red.shade400,
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 2,
                          spreadRadius: 1,
                          offset: const Offset(0, 1),
                        )
                      ]),
                  child: const Icon(
                    EvaIcons.arrowForward,
                    color: Colors.white,
                  ),
                )
              : Center(),
        ),
      ),
    );
  }

  Widget buildTextField(
      IconData icon, String hintText, bool isPassword, bool isEmail) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextField(
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: Palette.iconColor,
            ),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Palette.textColor1,
                ),
                borderRadius: BorderRadius.all(Radius.circular(35.0))),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Palette.textColor1,
                ),
                borderRadius: BorderRadius.all(Radius.circular(35.0))),
            contentPadding: const EdgeInsets.all(10.0),
            hintText: hintText,
            hintStyle:
                const TextStyle(fontSize: 14.0, color: Palette.textColor1)),
      ),
    );
  }
}
