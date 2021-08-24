import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PT projects"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('University of Dar es salaam'),
          Image.asset("assets/images/udsm.jpg")
        ],
      ),
      drawer: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        color: Colors.lightBlue,
        child: ListView(
          children: [
           /* AppBar(
              title: Text('options'),
            ),*/
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(backgroundImage: AssetImage("assets/images/peter.jpg"),),
              accountName: Text('Peter Abel'), accountEmail: Text('peterabel2504@gmail.com')),
            ListTile(
              /*leading:
               CircleAvatar(
                backgroundColor: Colors.white,
              ),*/
              title: Text("BoomColorChanger"),
              leading: Icon(Icons.color_lens),
              onTap: () {
                Navigator.of(context).pushNamed("boom_color_changer");
              },
            )
          ],
        ),
      ),
    );
  }
}
