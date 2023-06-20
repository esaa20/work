import 'package:flutter/material.dart';
import 'package:work/widget/new_work.dart';

class New extends StatefulWidget {

  @override
  _NewState createState() => _NewState();
}

class _NewState extends State<New> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: NewWork(),
    );
  }
}
