import 'package:codechallange/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProfileWidget extends StatefulWidget {
  @override
  _UserProfileWidgetState createState() => _UserProfileWidgetState();
}

class _UserProfileWidgetState extends State<UserProfileWidget> {
  User users;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      users = Provider.of<User>(context, listen: false);
      setState(() {
        
      });
   
    });
    super.initState();
  }

  Container textField(String item, String value) {
    return Container(width:MediaQuery.of(context).size.width -20 ,
      padding: EdgeInsets.all(10),
      child: Text(item + ": " + value,),
    );
  }

  Widget usersInfo() {
    if (users != null) {
      return Column(
        children: <Widget>[
          textField("First name", users.firstName),
          textField("Last name", users.lastName),
          textField("Date of Birth", users.dob),
          textField("Email", users.email),
          textField("Username", users.userName),
          textField("password", users.password),
        ],
      );
    } else {
      return Container(
        child: Text("No Users"),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Coding Challenge"),
        ),
        body: usersInfo());
  }
}
