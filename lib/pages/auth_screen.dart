import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bringo_restaurants/pages/drawer_screen.dart';
import 'package:bringo_restaurants/pages/getuserphone_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();
final usersRef = Firestore.instance.collection('users');
final DateTime timestamp = DateTime.now();

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  void sigInWithGoogle() {
    googleSignIn.signIn();
  }

  initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this, value: 0.3);
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.bounceInOut);
    _controller.forward();

    googleSignIn.onCurrentUserChanged.listen((account) {
      EasyLoading.show(status: 'Signing In...');
      handleSignIn(account);
    }).onError((error) {
      EasyLoading.dismiss();
      showMessage(error);
    });
  }

  handleSignIn(GoogleSignInAccount account) {
    if (account != null) {
      createUserInFireStore();
    } else {
      EasyLoading.dismiss();
      showMessage('Error');
    }
  }

  showMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        textColor: Colors.black,
        backgroundColor: Colors.white);
  }

  createUserInFireStore() async {
    final GoogleSignInAccount user = googleSignIn.currentUser;
    final DocumentSnapshot doc = await usersRef.document(user.id).get();
    if (!doc.exists) {
      EasyLoading.dismiss();
      await Navigator.pushNamed(context, UserPhoneScreen.routeName)
          .then((phoneNum) {
        if (phoneNum != null) {
          EasyLoading.show(status: 'Creating Account...');
          usersRef.document(user.id).setData({
            "id": user.id,
            "phone": phoneNum,
            "photoUrl": user.photoUrl,
            "email": user.email,
            "name": user.displayName,
            "timestamp": timestamp
          }).then((_) {
            EasyLoading.showSuccess('Successfully Created');
            Navigator.pushNamed(context, DrawerScreen.routeName);
            EasyLoading.dismiss();
          }).catchError((error) {
            EasyLoading.dismiss();
            showMessage(error);
          });
        } else {
          Navigator.of(context).pop();
        }
      });
    } else {
      EasyLoading.dismiss();
      Navigator.pushNamed(context, DrawerScreen.routeName);
    }
  }

  setUpAccount() async {}

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Image.asset(
            'images/background.jpeg',
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
          ),
          Container(
            color: Colors.black.withOpacity(0.4),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ScaleTransition(
                    scale: _animation,
                    alignment: Alignment.center,
                    child: Card(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      color: Colors.white54,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: ColorizeAnimatedTextKit(
                            text: [
                              "FOODIES WELCOME",
                              'BE REALLY A FOODY',
                              'BRINGING HEAT TO YOUR MEAT',
                              'LIVE. LAUGH. LINGUINE',
                              'EAT HEALTY, LIVE BETTER',
                              'GOOD FOOD FOR GOOD MOMENTS',
                            ],
                            textStyle: TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            colors: [
                              Colors.purple,
                              Colors.blue,
                              Colors.blueGrey.shade900,
                              Colors.teal,
                              Colors.yellow,
                              Colors.red,
                            ],
                            textAlign: TextAlign.center,
                            alignment: AlignmentDirectional
                                .topStart // or Alignment.topLeft
                            ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Bringo  Restaurants',
                    style: TextStyle(
                        fontFamily: 'Signatra',
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 40),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: sigInWithGoogle,
                    child: Card(
                      elevation: 3,
                      color: Color(0xff4285f4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'images/google_signin_button.png',
                          height: 50,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Divider(
                        color: Colors.white,
                        height: 1,
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: Card(
                      color: Color(0xff5372a9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'images/fb_login_button.png',
                          height: 50,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
