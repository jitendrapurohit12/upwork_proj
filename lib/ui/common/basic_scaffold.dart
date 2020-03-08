import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class BasicScaffold extends StatefulWidget {
  final AppBar appBar;
  final Widget body;
  final FloatingActionButton floatingActionButton;
  final StreamController<String> errorController, successController;

  BasicScaffold(
      {Key key,
      this.appBar,
      this.body,
      this.errorController,
      this.floatingActionButton,
      this.successController})
      : super(key: key);

  @override
  _BasicScaffoldState createState() => _BasicScaffoldState();
}

class _BasicScaffoldState extends State<BasicScaffold> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  StreamController<ConnectivityResult> _connectionController =
      StreamController();

  @override
  void initState() {
    super.initState();

    Connectivity().onConnectivityChanged.listen((conn) {
      _connectionController.add(conn);
    });

    widget.errorController?.stream?.listen((s) => showSnack(s));
    widget.successController?.stream
        ?.listen((s) => showSnack(s, isError: false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: widget.appBar,
      body: Stack(
        children: <Widget>[
          widget.body,
          Positioned(
            bottom: 0,
            child: StreamBuilder<ConnectivityResult>(
              stream: _connectionController.stream,
              builder: (context, snapshot) {
                print('data: ${snapshot.data}');
                print(
                    'visible ${(snapshot.hasData && snapshot.data == ConnectivityResult.none)}');
                return Visibility(
                  visible: snapshot.hasData &&
                      snapshot.data == ConnectivityResult.none,
                  child: Container(
                    width: double.maxFinite,
                    color: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: Text(
                      'No internet connection!',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: widget.floatingActionButton,
    );
  }

  void showSnack(String message, {bool isError = true}) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      backgroundColor: isError ? Colors.red : Colors.green,
      behavior: SnackBarBehavior.floating,
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Text(message),
      ),
    ));
  }
}
