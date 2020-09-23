import 'package:codechallange/registrationPageWidget.dart';
import 'package:codechallange/textFormFieldUtil.dart';
import 'package:codechallange/user.dart';
import 'package:codechallange/userProfileWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInWidget extends StatefulWidget {
  @override
  _SignInWidgetState createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  User users;

  final TextEditingController _textEditingUsernameController =
      TextEditingController();
  final TextEditingController _textEditingPasswordController =
      TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      users = Provider.of<User>(context,listen: false);
      print(users == null);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Coding Challenge"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
          ),
          TextFieldUtil(_textEditingUsernameController, "Username"),
          TextFieldUtil(_textEditingPasswordController, "Password",
              hideText: true),
          Container(
              width: MediaQuery.of(context).size.width - 40,
              child: RaisedButton(
                color: Colors.blue,
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  if (_textEditingUsernameController.text.length > 1 &&
                      _textEditingPasswordController.text.length > 1) {
                    print(users == null);

                    if (users != null) {
                      users.userName = _textEditingUsernameController.text;
                      users.password = _textEditingPasswordController.text;
                      print("USerAddes");
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => UserProfileWidget()));
                    }
                  }
                },
              )),
          Container(
            width: MediaQuery.of(context).size.width - 20,
            child: FlatButton(
              child: Text("New User",
                  style: TextStyle(
                    fontFamily: "Lato-Regular",
                    color: Colors.blue,
                  )),
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => RegistrationWidget()));
              },
            ),
          )
        ],
      ),
    );
  }
}
