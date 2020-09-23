import 'package:codechallange/database_helper.dart';
import 'package:codechallange/textFormFieldUtil.dart';
import 'package:codechallange/user.dart';
import 'package:codechallange/userProfileWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegistrationWidget extends StatefulWidget {
  @override
  _RegistrationWidgetState createState() => _RegistrationWidgetState();
}

class _RegistrationWidgetState extends State<RegistrationWidget> {
  User users;

  final TextEditingController _textEditingUsernameController =
      TextEditingController();
  final TextEditingController _textEditingPasswordController =
      TextEditingController();
  final TextEditingController _textEditingFirstNameontroller =
      TextEditingController();
  final TextEditingController _textEditingLastNameController =
      TextEditingController();
  final TextEditingController _textEditingDOBController =
      TextEditingController();
  final TextEditingController _textEditingEmailController =
      TextEditingController();
  var dbHelper;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      users = Provider.of<User>(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
          TextFieldUtil(_textEditingFirstNameontroller, "First Name"),
          TextFieldUtil(_textEditingLastNameController, "Last Name"),
          TextFieldUtil(_textEditingDOBController, "Date of Birth"),
          TextFieldUtil(_textEditingEmailController, "Email Adress"),
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
                    if (users != null) {
                      users.userName = _textEditingUsernameController.text;
                      users.firstName = _textEditingFirstNameontroller.text;
                      users.lastName = _textEditingLastNameController.text;
                      users.email = _textEditingEmailController.text;
                      users.password = _textEditingPasswordController.text;
                      users.dob = _textEditingDOBController.text;
                       Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => UserProfileWidget()));
                    }
                  }
                },
              )),
          Container(
            width: MediaQuery.of(context).size.width - 40,
            child: FlatButton(
              child: Text("Log in",
                  style: TextStyle(
                    fontFamily: "Lato-Regular",
                    color: Colors.blue,
                  )),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
