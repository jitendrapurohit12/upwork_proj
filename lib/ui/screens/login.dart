import 'dart:async';

import 'package:flutter/material.dart';
import 'package:upwork_proj/constant/constant.dart';
import 'package:upwork_proj/doalog/dialog_helper.dart';
import 'package:upwork_proj/helper/ui_helper.dart';
import 'package:upwork_proj/services/api_service.dart';
import 'package:upwork_proj/shared_pref/shared_prefs.dart';
import 'package:upwork_proj/styles/styles.dart';
import 'package:upwork_proj/ui/common/basic_scaffold.dart';
import 'package:upwork_proj/validator/validator.dart';

class ScreenLogin extends StatefulWidget {
  static const id = 'login';
  @override
  _ScreenLoginState createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _companyController = TextEditingController();
  TextEditingController _accessController = TextEditingController();
  StreamController<String> _successController = StreamController();

  String companyCode, accessCode;

  @override
  void dispose() {
    _companyController?.dispose();
    _accessController?.dispose();
    _successController?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BasicScaffold(
      successController: _successController,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.asset(
                  kImageLogo,
                  width: 150,
                  height: 150,
                ),
                SizedBox(height: 56),
                TextFormField(
                  controller: _companyController,
                  keyboardType: TextInputType.numberWithOptions(decimal: false),
                  decoration: InputDecoration(
                    labelText: kCompanyCode,
                    border: textFieldBorder,
                    counterText: '',
                    counterStyle: TextStyle(fontSize: 0),
                  ),
                  validator: (s) => checkValidation(
                      ValidationType.NON_EMPTY, s, kCompanyCode),
                  onSaved: (s) => companyCode = s,
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _accessController,
                  keyboardType: TextInputType.numberWithOptions(decimal: false),
                  decoration: InputDecoration(
                    labelText: kAccessCode,
                    border: textFieldBorder,
                    counterText: '',
                    counterStyle: TextStyle(fontSize: 0),
                  ),
                  validator: (s) => checkValidation(
                      ValidationType.NON_EMPTY, s, kCompanyCode),
                  onSaved: (s) => accessCode = s,
                ),
                SizedBox(height: 36),
                Container(
                  width: double.maxFinite,
                  child: getRoundedButton('Login', () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      showProgressDialog(
                          context, 'Processing authentication, please wait...');
                      ApiService().login(companyCode, accessCode).then((value) {
                        Navigator.pop(context);
                        SharedPrefs().saveToken(value.data);
                        _successController.add('Login Successfull');
                      }).catchError((e) {
                        Navigator.pop(context);
                        showCustomAlertDialog(context, (e as APIResponse).data);
                      });
                    }
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
