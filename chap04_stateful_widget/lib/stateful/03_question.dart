import 'package:flutter/material.dart';

class StatefulTest2 extends StatefulWidget {
  const StatefulTest2({super.key});

  @override
  State<StatefulTest2> createState() => _StatefulTest2State();
}

class _StatefulTest2State extends State<StatefulTest2> {


  List<String> titles = ['햄버거', '피자', '돈까스'];
  List<int> num = [0,0,0];




  @override
  Widget build(BuildContext context) {


        return ListView.builder(
        itemCount: 3,
        itemBuilder: (context, i){

          return ListTile(
            leading: Text(num[i].toString()),
            title: Text(titles[i]),
            trailing: ElevatedButton.icon(onPressed:(){
              setState(() {
              num[i]++;
              print(num[i]);
            });
              }, label: Text("좋아요")),
          );
      });

  }
}
