import 'package:flutter/material.dart';

class AdminScrenn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Container(
          color: Colors.green,
          child: Center(
            child: Text("Admin Screen"),
          ),
        ),
      ),
    );
  }
}
