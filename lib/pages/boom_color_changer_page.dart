import 'package:auntie_rafiki_appointments/components/round_button.dart';
import 'package:flutter/material.dart';

class BoomColorChangerPage extends StatefulWidget {
  const BoomColorChangerPage({Key? key}) : super(key: key);

  @override
  _BoomColorChangerPageState createState() => _BoomColorChangerPageState();
}

class _BoomColorChangerPageState extends State<BoomColorChangerPage> {
  Color _backgroundColor = Colors.purple;
  List<Color> _colorList = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.pink,
    Colors.grey
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: _backgroundColor,
          leading: Icon(
            Icons.color_lens,
            size: 60,
            color: Colors.white,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  print('hello world');
                },
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.white,
                )),
          ]),
      body: Column(
        children: [
          Text(
            'Boom -magic color change!',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          Spacer(),
          Container(
              height: 100,
              child: ListView.builder(
                  itemCount: _colorList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal:10 ),
                      child: RoundButton(
                        onTap: () {
                          setState(() {
                            _backgroundColor = _colorList[index];
                          });
                        },
                        color: _colorList[index],
                      ),
                    );
                  })),
          Spacer(),
        ],
      ),
    );
  }
}
