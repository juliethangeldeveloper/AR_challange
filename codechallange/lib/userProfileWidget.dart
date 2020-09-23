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
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}