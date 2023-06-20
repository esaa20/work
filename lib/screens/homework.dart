import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:work/modle/data_from_net.dart';
import 'package:work/screens/new.dart';
import 'package:work/widget/new_work.dart';
import 'package:work/widget/work_show.dart';
class HomeWork extends StatefulWidget {
  static const routeName = 'homework';
  @override
  _HomeWorkState createState() => _HomeWorkState();
}

class _HomeWorkState extends State<HomeWork> {
  void StartAddNew (BuildContext ctx){
    showModalBottomSheet(context: ctx, builder: (_){
      return GestureDetector(
          onTap: (){},
          behavior: HitTestBehavior.opaque,
          child: NewWork(),
      );
    },);
  }

  @override
  Widget build(BuildContext context) {
    final NameUser = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(NameUser),
      ),
      body: WorkShow(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> New() )),
        child: Icon(Icons.add),
      ),
    );
  }
}
