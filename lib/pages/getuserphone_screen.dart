import 'package:bringo_restaurants/widget/title.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserPhoneScreen extends StatefulWidget {
  static const routeName = 'UserPhoneScreen';

  @override
  _UserPhoneScreenState createState() => _UserPhoneScreenState();
}

class _UserPhoneScreenState extends State<UserPhoneScreen> {
  final _formKey = GlobalKey<FormState>();
  String phoneNumber = '03';

  submit() {


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Verify Phone Number'),
        centerTitle: true,
      ),
      body: WillPopScope(
        onWillPop: _onBackPressed,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  'Enter your phone number and we will send you a 6-digit code to verify your phone number.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Container(
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    onSaved: (val) {
                       phoneNumber = val;
                    },
                    maxLength: 11,
                    initialValue: '03',
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Phone Number",
                      labelStyle: TextStyle(fontSize: 15.0),
                      hintText: "Enter your phone number",
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){

                  _formKey.currentState.save();
                  Navigator.pop(context, phoneNumber);

              },
              child: Container(
                height: 50.0,
                width: 350.0,
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(7.0),
                ),
                child: Center(
                  child: Text(
                    "Verify",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() {
    return showDialog<bool>(
      context: context,
      builder: (c) => AlertDialog(
        title: Text('Are you sure?'),
        content: Text('Do you really want to exit'),
        actions: [
          FlatButton(
            child: Text('Yes'),
            onPressed: () => Navigator.pop(c, true),
          ),
          FlatButton(
            child: Text('No'),
            onPressed: () => Navigator.pop(c, false),
          ),
        ],
      ),
    );
  }
}

showMessage(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      textColor: Colors.white,
      backgroundColor: Colors.black);
}