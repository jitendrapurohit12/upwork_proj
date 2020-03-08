import 'package:flutter/material.dart';

class CustomAlertDialog extends StatefulWidget {
  final String content;

  const CustomAlertDialog({Key key, this.content}) : super(key: key);
  @override
  _CustomAlertDialogState createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('ERROR!'),
      content: Text(widget.content),
      actions: <Widget>[
        FlatButton(onPressed: () => Navigator.pop(context), child: Text('OKAY'))
      ],
    );
  }
}
