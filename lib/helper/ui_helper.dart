import 'package:flutter/material.dart';

Widget getRoundedButton(String label, VoidCallback callback) {
  return RaisedButton(
    padding: EdgeInsets.all(12),
    color: Colors.blue,
    onPressed: callback,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(
      label,
      style: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
