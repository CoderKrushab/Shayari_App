import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:shayariapp/home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: splashpage(),
    theme:
        ThemeData(primaryColor: Color(0xffD9AFD9), primarySwatch: Colors.cyan),
  ));
}

class splashpage extends StatefulWidget {
  const splashpage({Key? key}) : super(key: key);

  @override
  State<splashpage> createState() => _splashpageState();
}

class _splashpageState extends State<splashpage> {
  @override
  void initState() {
    super.initState();
    next();
  }

  next() async {
    var status = await Permission.storage.status;

    if (status.isDenied) {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.storage,
      ].request();
    }
    await Future.delayed(const Duration(seconds: 5));
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return shayridemo();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffCAE2DE),
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Center(
                child: Container(
                  child: Lottie.asset('splashphoto/123.json'),
                  decoration: BoxDecoration(
                    color: Color(0xffCAE2DE).withOpacity(1),
                  ),
                ),
              ),
            ),
            Expanded(
              child: TextLiquidFill(
                textAlign: TextAlign.center,
                text: 'Shayari App',
                waveColor: Colors.cyan,
                boxBackgroundColor: Color(0xffCAE2DE),
                textStyle: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
                boxHeight: 70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
