import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'package:shayariapp/shayri.dart';
import 'package:shayariapp/thrdpage.dart';

class secondpage extends StatefulWidget {
  int index;
  List<String> name;

  secondpage(this.index, this.name);

  @override
  State<secondpage> createState() => _secondpageState();
}

class _secondpageState extends State<secondpage> {
  @override
  void initState() {
    super.initState();

    switch (widget.index) {
      case 0:
        shayri.temp = shayri.friendship;
        break;
      case 1:
        shayri.temp = shayri.funny;
        break;
      case 2:
        shayri.temp = shayri.hurt;
        break;
      case 3:
        shayri.temp = shayri.india;
        break;
      case 4:
        shayri.temp = shayri.love;
        break;
      case 5:
        shayri.temp = shayri.morning;
        break;
      case 6:
        shayri.temp = shayri.night;
        break;
      case 7:
        shayri.temp = shayri.single;
        break;
      case 8:
        shayri.temp = shayri.sorry;
        break;
      case 9:
        shayri.temp = shayri.think;
        break;
      case 10:
        shayri.temp = shayri.Evening;
        break;
      case 11:
        shayri.temp = shayri.Afternoon;
        break;
      case 12:
        shayri.temp = shayri.Ideas;
        break;
      case 13:
        shayri.temp = shayri.Birthday;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffCAE2DE),
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text(
            "${widget.name[widget.index]}",
            style: const TextStyle(fontSize: 25, color: Colors.white),
          )),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            elevation: 10,
            color: Color(0xffD9AFD9),
            margin: const EdgeInsets.all(5),
            child: ListTile(
              title: Text(
                shayri.temp[index],
                style: const TextStyle(fontSize: 20, color: Colors.black87),
                maxLines: 1,
              ),
              leading: Image.asset(
                "photo/${shayri.photo[widget.index]}",
              ),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return thrdpage(

                        index, widget.name[widget.index], shayri.temp);
                  },
                ));
              },
            ),
          );
        },
        itemCount: shayri.temp.length,
      ),
    );
  }
}
