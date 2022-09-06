import 'dart:io';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shayariapp/secondpage.dart';
import 'package:shayariapp/shayri.dart';

class shayridemo extends StatefulWidget {
  const shayridemo({Key? key}) : super(key: key);

  @override
  State<shayridemo> createState() => _shayridemoState();
}

class _shayridemoState extends State<shayridemo> {
  String folderpath = "";

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    createfile();
  }

  createfile() async {
    String path = "storage/emulated/0/Download/Shayri";

    Directory directory = Directory(path);
    bool status = await directory.exists();
    if (status) {
      print("Alread Exists");
    } else {
      await directory.create();
      print("create");
    }
    folderpath = directory.path;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffCAE2DE),
      appBar: AppBar(
        title: TextLiquidFill(
          textAlign: TextAlign.center,
          waveDuration: Duration(seconds: 5),
          text: 'Shayri',
          waveColor: Colors.white,
          boxBackgroundColor: Colors.cyan,
          textStyle: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        // Text(
        //   "शायरी",
        //   style: TextStyle(fontSize: 40, color: Colors.white),
        // ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            elevation: 20,
            child: ListTile(
              leading: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage("photo/${shayri.photo[index]}"),
                        fit: BoxFit.fill)),
              ),
              tileColor: Theme.of(context).primaryColor,
              title: Text(
                shayri.name[index],
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              trailing: const Icon(
                Icons.arrow_forward,
                color: Colors.black87,
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return secondpage(index, shayri.name);
                  },
                ));
              },
            ),
          );
        },
        itemCount: shayri.name.length,
      ),
    );
  }
}
