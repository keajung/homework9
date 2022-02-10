import 'dart:math';
import 'test_page.dart';
import 'package:flutter/material.dart';

import 'game.dart';

void main() {
  const app = MyApp();
  runApp(app);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // callback method
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {

  HomePage({Key? key}) : super(key: key) {
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var  _num = 0;
  var _null = 6;

  var _textPin = '';

  void _showOkDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  bool checkPin(var pin){
    if(pin=='123456'){
      return true;
    }else{
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
        child: Container(

          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Icon(
                  Icons.lock,
                  size: 70.0,
                  color: Colors.amber,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 70.0),
                child: Column(
                  children: [
                    Text('LOGIN' ,
                        style: TextStyle(
                            fontSize: 30.0, color: Colors.amber)),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: Text('Enter PIN to login' ,
                          style: TextStyle(
                              fontSize: 15.0, color: Colors.amber)),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        // Collection for
                        for (var i = 0; i < _num; i++)
                          Container(
                            width: 20.0,
                            height: 20.0,
                            margin: EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              color: Colors.amber.shade500,
                              shape: BoxShape.circle,
                            ),
                          ),
                        for (var i = 0; i < _null ; i++)
                          Container(
                            width: 20.0,
                            height: 20.0,
                            margin: EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              color: Colors.amber.shade100,
                              shape: BoxShape.circle,
                            ),
                          ),

                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (var i = 1; i <= 3; i++) buildButton(num: i),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (var i = 4; i <= 6; i++) buildButton(num: i),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (var i = 7; i <=9 ; i++) buildButton(num: i),
                  ],
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 30,),
                      child: Container(
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25,),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              child: buildButton(num: 0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Icon(
                          Icons.backspace,
                          size: 30.0,
                          color: Colors.amber
                      ),
                    ),
                  ]
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton({int? num}) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: OutlinedButton(
          onPressed: () {
           setState(() {
             if(_num<=5) {
               _null--;
               _num++;
               _textPin+='$num';
               print('You pressed $num');
             }
             if(_num==6) {
               if(checkPin(_textPin)==true) {
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => TestPage()),
                 );
               }else{
                 setState(() {
                   _null = 6;
                   _textPin = '';
                   _num = 0;
                 });
                 showDialog(
                   context: context,
                   barrierDismissible: false,
                   builder: (BuildContext context) {
                     return AlertDialog(
                       title: Text("Invalid Pin"),
                       content: Text("Please try again"),
                       actions: [
                         TextButton(
                           onPressed: () {
                             Navigator.of(context).pop();
                           },
                           child: Text('OK'),
                         ),
                       ],
                     );
                   },
                 );
               }
             }
           });

          },
          child: Text('$num')) ,
    );
  }
}