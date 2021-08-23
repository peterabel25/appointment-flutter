import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  _incrementCounter(){
     setState(() {
          _counter++;          
          });
  
          
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.person),
        title: Text('auntie rafiki'),
        actions: [
          IconButton(
              onPressed: () {
                print('hello world');
              },
              icon: Icon(Icons.more_vert)),
          IconButton(
              onPressed: () {
                print('jeje');
              },
              icon: Icon(Icons.message))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('you have pressed this button these many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline3,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter
         
    ,
        child: Icon(Icons.add),
      ),
    );
  }
}
