import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shayariapp/forthpage.dart';

class thrdpage extends StatefulWidget {
  int index;
  String name;
  List<String> temp;

  thrdpage(this.index, this.name, this.temp);

  @override
  State<thrdpage> createState() => _thrdpageState();
}

class _thrdpageState extends State<thrdpage> {
  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: widget.index);
  }

  String myemoji = " 😇🤞🙏🙏🤞😇";
  TextAlign t = TextAlign.center;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffCAE2DE),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            "${widget.name}",
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
        ),
        body: Column(children: [
          Expanded(
              flex: 5,
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (value) {
                  setState(() {
                    widget.index = value;
                  });
                },
                itemCount: widget.temp.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      gradient: const LinearGradient(
                        colors: [Color(0xffEACFEA), Color(0xffD9AFD9)],
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(21),
                    alignment: Alignment.center,
                    child: Text(
                      textAlign: t,
                      "${myemoji}\n${widget.temp[widget.index]}\n${myemoji}",
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.pink,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              )),
          const Spacer(
            flex: 1,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Color(0xffD9AFD9),
                borderRadius: BorderRadius.circular(15),
              ),
              height: double.infinity,
              margin: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {
                        Clipboard.setData(ClipboardData(
                            text: "${widget.temp[widget.index]}"));
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Copy Text..."),
                        ));
                      },
                      icon: const Icon(
                        Icons.copy,
                        size: 30,
                      )),
                  IconButton(
                      onPressed: () {
                        if (widget.index > 0) {
                          widget.index--;
                        }
                        setState(() {});
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 30,
                      )),
                  IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return forthpage(widget.index, widget.temp);
                          },
                        ));
                      },
                      icon: const Icon(
                        Icons.edit,
                        size: 30,
                      )),
                  IconButton(
                      onPressed: () {
                        if (widget.index < widget.temp.length - 1) {
                          widget.index++;
                        }
                        setState(() {});
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        size: 30,
                      )),
                  IconButton(
                      onPressed: () {
                        Share.share(
                          "${myemoji}\n${widget.temp[widget.index]}\n${myemoji}",
                        );
                      },
                      icon: const Icon(
                        Icons.share,
                        size: 30,
                      )),
                ],
              ),
            ),
          ),
        ]));
  }
}
