import 'package:auntie_rafiki_appointments/components/round_button.dart';
import 'package:flutter/material.dart';

class BoomColorChanger extends StatefulWidget {
  BoomColorChanger({Key? key}) : super(key: key);

  @override
  _BoomColorChangerState createState() => _BoomColorChangerState();
}

class _BoomColorChangerState extends State<BoomColorChanger> {
  Color _backgroundColor = Colors.purpleAccent;
  List<Color> _colorList = [Colors.red, Colors.yellow, Colors.green , Colors.black];

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
                print('Auntie Rafiki');
              },
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
            ),
          ]),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "boom-magic color change!",
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
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: RoundButton(
                        onTap: () {
                          setState(() {
                            _backgroundColor = _colorList[index];
                          });
                        },
                        color: _colorList[index],
                      ),
                    );
                  }
                  )
                  ),
          Spacer(),
        ],
      ),
    );
  }
}
