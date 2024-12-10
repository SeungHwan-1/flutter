import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Container(
              height: 150,
              margin: EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset("assets/6.png",width: 150,),
                  Container(
                    margin: EdgeInsets.all(20),
                    child : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "뭐지;",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        Text("비숑"),
                        Text("서울시 구로구"),
                        Row(children: [
                          Text("비숑"),
                          Icon(Icons.heart_broken_outlined),
                          Text("4"),
                        ],)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  }
}
