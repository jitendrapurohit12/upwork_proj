import 'package:flutter/material.dart';
import 'package:upwork_proj/doalog/custom_alert_dialog.dart';
import 'package:upwork_proj/doalog/loading_dialog.dart';

void showCustomAlertDialog(BuildContext context, String content) {
  showDialog(
    context: context,
    builder: (context) => CustomAlertDialog(
      content: content,
    ),
  );
}

void showProgressDialog(BuildContext context, String content) {
  showDialog(
    context: context,
    builder: (context) => LoadingDialog(
      content: content,
    ),
  );
}
