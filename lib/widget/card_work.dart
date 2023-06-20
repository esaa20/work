import 'package:flutter/material.dart';

class CardWork extends StatefulWidget {
  String titleWork;
  String SubTitle;
  bool doneWork;
  CardWork({
    required this.titleWork,
    required this.SubTitle,
    required this.doneWork
  });
  bool note = false;
  @override
  State<CardWork> createState() => _CardWorkState();
}

class _CardWorkState extends State<CardWork> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          if (widget.note == false) {
            widget.note = true;
          } else {
            widget.note = false;
          }
        });
      },
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blueGrey,
        ),
        height: widget.note ? 120 : 60,
        width: 300,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.titleWork,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: widget.doneWork? Colors.blue[900] :Colors.grey
                        ),
                        onPressed: () {},
                        child: Icon(Icons.done),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.delete_sharp,
                          color: Colors.red[900],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            widget.note
                ? Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Divider(
                          thickness: 3,
                        ),
                        Text(widget.SubTitle),
                      ],
                    ),
                )
                : Container(),
          ],
        ),
      ),
    );
  }
}
