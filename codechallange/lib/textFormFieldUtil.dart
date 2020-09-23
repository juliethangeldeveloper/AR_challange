import 'package:flutter/material.dart';

class TextFieldUtil extends StatefulWidget {
  final TextEditingController textEditingController;
  final String text;
  final Function submitedField;
  final bool hideText;
  final Function nodeFocus;
  final FocusNode focus;

  TextFieldUtil(this.textEditingController, this.text,
      {this.submitedField, this.focus, this.hideText, this.nodeFocus});

  @override
  _TextFieldUtilState createState() => _TextFieldUtilState();
}

class _TextFieldUtilState extends State<TextFieldUtil> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(22, 8, 22, 8),
      child: TextFormField(
        onFieldSubmitted: widget.submitedField,
        focusNode: widget.focus,
        obscureText: widget.hideText ?? false,
        onEditingComplete: widget.nodeFocus,
        controller: widget.textEditingController,
        decoration: InputDecoration(
          labelText: widget.text,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
