import 'package:avatar_glow/avatar_glow.dart';
import 'package:bringo_restaurants/widget/profile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = 'ProfileScreen';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with TickerProviderStateMixin {
  AnimationController animationController;
  Animation degOneTranslationAnimation,
      degTwoTranslationAnimation,
      degThreeTranslationAnimation;
  Animation rotationAnimation;

  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    degOneTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.2), weight: 75.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.2, end: 1.0), weight: 25.0),
    ]).animate(animationController);
    degTwoTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.4), weight: 55.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.4, end: 1.0), weight: 45.0),
    ]).animate(animationController);
    degThreeTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.75), weight: 35.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.75, end: 1.0), weight: 65.0),
    ]).animate(animationController);
    rotationAnimation = Tween<double>(begin: 180.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut));
    super.initState();
    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if (animationController.isCompleted) {
          animationController.reverse();
        }
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: <Widget>[
              ClipPath(
                child: Container(color: Colors.red),
                clipper: getClipper(),
              ),
              Positioned(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, left: 10),
                  child: Row(
                    children: <Widget>[
                      FloatingActionButton(
                          heroTag: "btn1",
                          mini: true,
                          backgroundColor: Colors.white.withOpacity(0.9),
                          onPressed: () => Navigator.of(context).pop(),
                          child: Icon(Icons.arrow_back, color: Colors.red)),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Profile',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            letterSpacing: 1.5),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                  width: MediaQuery.of(context).size.width,
                  top: MediaQuery.of(context).size.height / 9,
                  child: Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          AvatarGlow(
                            glowColor: Colors.red,
                            endRadius: 100.0,
                            duration: Duration(milliseconds: 2000),
                            repeat: true,
                            showTwoGlows: true,
                            repeatPauseDuration: Duration(milliseconds: 100),
                            child: Material(
                              elevation: 8.0,
                              shape: CircleBorder(),
                              child: CircleAvatar(
                                backgroundColor: Colors.grey[100],
                                backgroundImage: NetworkImage(
                                  'https://pixel.nymag.com/imgs/daily/vulture/2017/06/14/14-tom-cruise.w700.h700.jpg',
                                ),
                                radius: 60,
                              ),
                            ),
                          ),
                          Positioned(
                              right: 25,
                              bottom: 30,
                              child: FloatingActionButton(
                                heroTag: "btn2",
                                backgroundColor: Colors.red,
                                child: Icon(Icons.camera_alt),
                                elevation: 3,
                                onPressed: () {},
                              ))
                        ],
                      ),
                      Text(
                        'Muhammad Muddasir Ali',
                        style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Raleway'),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        'muddasirali99@gmail.com',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17.0,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'RobotoCondensed'),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ProfileCardWidget(
                          icon: Icons.account_circle,
                          title: 'Muhammad Muddasir Ali',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ProfileCardWidget(
                          icon: Icons.mail,
                          title: 'muddasirali99@gmail.com',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ProfileCardWidget(
                          icon: Icons.phone,
                          title: '+92 3150121252',
                        ),
                      ),
                    ],
                  )),
              Positioned(
                  right: 20,
                  bottom: 20,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: <Widget>[
                      Transform.translate(
                        offset: Offset.fromDirection(getRadiansFromDegree(270),
                            degOneTranslationAnimation.value * 100),
                        child: Transform(
                          transform: Matrix4.rotationZ(
                              getRadiansFromDegree(rotationAnimation.value))
                            ..scale(degOneTranslationAnimation.value),
                          alignment: Alignment.center,
                          child: CircularButton(
                            color: Colors.red,
                            width: 50,
                            height: 50,
                            icon: Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                            ),
                            onClick: () {
                              print('First Button');
                            },
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset.fromDirection(getRadiansFromDegree(225),
                            degTwoTranslationAnimation.value * 100),
                        child: Transform(
                          transform: Matrix4.rotationZ(
                              getRadiansFromDegree(rotationAnimation.value))
                            ..scale(degTwoTranslationAnimation.value),
                          alignment: Alignment.center,
                          child: CircularButton(
                            color: Colors.red,
                            width: 50,
                            height: 50,
                            icon: Icon(
                              Icons.account_circle,
                              color: Colors.white,
                            ),
                            onClick: () {
                              print('Second button');
                            },
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset.fromDirection(getRadiansFromDegree(180),
                            degThreeTranslationAnimation.value * 100),
                        child: Transform(
                          transform: Matrix4.rotationZ(
                              getRadiansFromDegree(rotationAnimation.value))
                            ..scale(degThreeTranslationAnimation.value),
                          alignment: Alignment.center,
                          child: CircularButton(
                            color: Colors.red,
                            width: 50,
                            height: 50,
                            icon: Icon(
                              Icons.phone,
                              color: Colors.white,
                            ),
                            onClick: () {
                              print('Third Button');
                            },
                          ),
                        ),
                      ),
                      CircularButton(
                        color: Colors.green,
                        width: 60,
                        height: 60,
                        icon: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                        onClick: () {
                          if (animationController.isCompleted) {
                            animationController.reverse();
                          } else {
                            animationController.forward();
                          }
                        },
                      )
                    ],
                  ))
            ],
          )),
    );
  }
}

class CircularButton extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Icon icon;
  final Function onClick;

  CircularButton(
      {this.color, this.width, this.height, this.icon, this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: IconButton(icon: icon, enableFeedback: true, onPressed: onClick),
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(1, size.height / 2.3);
    path.lineTo(size.width + 50, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
