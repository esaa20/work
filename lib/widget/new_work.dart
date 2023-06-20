import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:work/modle/data_from_net.dart';
import 'package:work/widget/work_show.dart';

class NewWork extends StatefulWidget {
  @override
  State<NewWork> createState() => _NewWorkState();
}

class _NewWorkState extends State<NewWork> {
  String? titleOfwork ;
  String? Subtitle ;
  bool stateWork = false;

  Future<Postworks> postData(String title , String subTitle )async{
    var url = 'https://works-82591-default-rtdb.firebaseio.com/.json';
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>
      {

        "done" : false ,
        "sub"  : Subtitle,
        'title': title,
      }),
    );
    print(jsonDecode(response.body));
    if (response.statusCode == 201) {

      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return Postworks.fromjson(jsonDecode(response.body));

    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album.');
    }

  }
  Future update() async{
    await getdata();
    AllWork = getdata();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 500,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30,),
              TextField(
                textAlign: TextAlign.center,
                onChanged: (title){
                  titleOfwork=title;
                },
                decoration: InputDecoration(
                  hintText: 'Enter Titel ',
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40))),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide( width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(10))),

                ),
              ),
              SizedBox(height: 30,),
              TextField(
                textAlign: TextAlign.center,
                onChanged: (sub){
                  Subtitle = sub;
                },
                decoration: InputDecoration(
                  hintText: 'Enter SubTitel ',
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40))),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide( width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(10))),

                ),
              ),
              SizedBox(height: 30,),
              ElevatedButton(
                  onPressed:(){
                     setState(() {
                       postData(titleOfwork!,Subtitle!);
                       getdata();
                     });


                  },
                  child: Text("Enter")
              ),
            ],
          ),
        ),
      ),
    );
  }
}
