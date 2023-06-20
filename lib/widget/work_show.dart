import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:work/modle/data_from_net.dart';
import 'dart:core';

import 'package:work/widget/card_work.dart';

class WorkShow extends StatefulWidget {
  @override
  State<WorkShow> createState() => WorkShowState();
}

class WorkShowState extends State<WorkShow> {

  @override
  void initState() {
    upload();
    print(AllWork);
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder <List<works>>(
        future: getdata(),
        builder: (context, snapShout) {
          if (snapShout.hasData) {
            return Container(
              height: 600,
              child: SafeArea(
                child: ListView.builder(
                    itemCount: snapShout.data!.length,
                    itemBuilder: (context, index) {
                      return CardWork(
                        titleWork: snapShout.data![index].title,
                        SubTitle: snapShout.data![index].subtitle,
                        doneWork: snapShout.data![index].done,
                      );
                    }),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
