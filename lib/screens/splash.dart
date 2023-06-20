import 'package:flutter/material.dart';
import 'package:work/screens/homework.dart';
class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
    String? name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin: EdgeInsets.only(top: 50 , bottom:MediaQuery.of(context).size.height/6 ),
                child: Text(
                  'HomeWork',
                  style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold, color: Colors.blueGrey[700]),
                )),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                textAlign: TextAlign.center,
                onChanged: (value) {
                  name = value;
                },
                decoration: InputDecoration(
                  hintText: 'Enter name',
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
            ),
            Padding(
              padding: EdgeInsets.only(top: 40),
              child: Material(
                color: Colors.blueGrey,
                elevation: 5,
                borderRadius: BorderRadius.circular(20),
                child: MaterialButton(
                  onPressed: (){
                    if(name!.isEmpty){
                    }
                    else{
                      Navigator.of(context).pushReplacementNamed(HomeWork.routeName, arguments: name);
                    }
                  },
                  minWidth: 200,
                  height: 42,
                  child: Icon(Icons.arrow_forward, color: Colors.white,),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
