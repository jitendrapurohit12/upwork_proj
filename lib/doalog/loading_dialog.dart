import 'package:flutter/material.dart';

class LoadingDialog extends StatefulWidget {
  final String content;

  const LoadingDialog({Key key, this.content}) : super(key: key);
  @override
  _LoadingDialogState createState() => _LoadingDialogState();
}

class _LoadingDialogState extends State<LoadingDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: Row(
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(width: 16),
            Expanded(
              child: Text(widget.content,
                  style: Theme.of(context).textTheme.bodyText2),
            )
          ],
        ),
      ),
    );
  }
}
