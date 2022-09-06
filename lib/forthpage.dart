import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shayariapp/shayri.dart';

class forthpage extends StatefulWidget {
  int index;

  List<String> temp;

  forthpage(
    this.index,
    this.temp,
  );

  @override
  State<forthpage> createState() => _forthpageState();
}

class _forthpageState extends State<forthpage> {
  Color bgcolor = Color(0xffEACFEA);
  Color Textcolor = Colors.pink;
  String myemoji = " 😇🤞🙏🙏🤞😇";
  TextAlign t = TextAlign.center;

  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);
  double textsize = 20;

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffCAE2DE),
        appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.white),
            shadowColor: Colors.pink,
            elevation: 10,
            title: Text(
              "${widget.index + 1} / ${widget.temp.length}",
              style: TextStyle(fontSize: 25, color: Colors.white),
            )),
        body: Column(
          children: [
            Expanded(
              // flex: 5,
              child: Container(
                alignment: Alignment.center,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: bgcolor,
                        // gradient: LinearGradient(
                        //   colors: [Color(0xffEACFEA), Color(0xffD9AFD9)],
                        // ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: const EdgeInsets.all(20),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      child: Text(
                        textAlign: t,
                        "${myemoji}\n${widget.temp[widget.index]}\n${myemoji}",
                        style: TextStyle(
                          fontSize: textsize,
                          color: Textcolor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 200,
              child: Expanded(
                  flex: 2,
                  child: Container(
                    height: double.infinity,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.pink,
                      gradient: LinearGradient(
                        colors: [Color(0xffEACFEA), Color(0xffD9AFD9)],
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              // color: Color(0xffCAE2DE),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            margin: const EdgeInsets.all(15),
                            height: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      t = TextAlign.center;
                                      setState(() {});
                                    },
                                    icon: const Icon(
                                      Icons.format_align_center_rounded,
                                      size: 30,
                                      color: Colors.black,
                                    )),
                                IconButton(
                                    onPressed: () {
                                      t = TextAlign.justify;
                                      setState(() {});
                                    },
                                    icon: const Icon(
                                      Icons.format_align_justify_rounded,
                                      size: 30,
                                      color: Colors.black,
                                    )),
                                IconButton(
                                    onPressed: () {
                                      int R =
                                          shayri.r.nextInt(shayri.colo.length);
                                      bgcolor = shayri.colo[R];

                                      setState(() {});
                                    },
                                    icon: const Icon(
                                      Icons.wifi_protected_setup_rounded,
                                      size: 30,
                                      color: Colors.black,
                                    )),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.zoom_out_map_sharp,
                                      size: 30,
                                      color: Colors.black,
                                    )),
                                IconButton(
                                    onPressed: () {
                                      t = TextAlign.left;
                                      setState(() {});
                                    },
                                    icon: const Icon(
                                      Icons.format_align_left_rounded,
                                      size: 30,
                                      color: Colors.black,
                                    )),
                                IconButton(
                                    onPressed: () {
                                      t = TextAlign.right;
                                      setState(() {});
                                    },
                                    icon: const Icon(
                                      Icons.format_align_right_rounded,
                                      size: 30,
                                      color: Colors.black,
                                    )),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xffCAE2DE),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0)),
                                  fixedSize: const Size(108.5, 35),
                                ),
                                onPressed: () {
                                  showModalBottomSheet(
                                      backgroundColor: Color(0xffEACFEA),
                                      isScrollControlled: true,
                                      isDismissible: false,
                                      barrierColor: Colors.transparent,
                                      builder: (context) {
                                        return Container(
                                          height: 600,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: AlertDialog(
                                                  title: const Text(
                                                      'Pick a color!'),
                                                  content:
                                                      SingleChildScrollView(
                                                    child: ColorPicker(
                                                      pickerColor: pickerColor,
                                                      onColorChanged:
                                                          changeColor,
                                                    ),
                                                  ),
                                                  actions: <Widget>[
                                                    ElevatedButton(
                                                      child:
                                                          const Text('Got it'),
                                                      onPressed: () {
                                                        bgcolor = pickerColor;
                                                        setState(() =>
                                                            currentColor =
                                                                pickerColor);
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      context: context);
                                },
                                child: const Text(
                                  "Backgound",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xffCAE2DE),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0)),
                                  fixedSize: const Size(108.5, 35),
                                ),
                                onPressed: () {
                                  showModalBottomSheet(
                                      backgroundColor: Color(0xffEACFEA),
                                      isScrollControlled: true,
                                      isDismissible: false,
                                      barrierColor: Colors.transparent,
                                      builder: (context) {
                                        return Container(
                                          height: 600,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: AlertDialog(
                                                  title: const Text(
                                                      'Pick a color!'),
                                                  content:
                                                      SingleChildScrollView(
                                                    child: ColorPicker(
                                                      pickerColor: pickerColor,
                                                      onColorChanged:
                                                          changeColor,
                                                    ),
                                                  ),
                                                  actions: <Widget>[
                                                    ElevatedButton(
                                                      child:
                                                          const Text('Got it'),
                                                      onPressed: () {
                                                        Textcolor = pickerColor;
                                                        setState(() =>
                                                            currentColor =
                                                                pickerColor);
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      context: context);
                                },
                                child: const Text(
                                  "Text Color",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xffCAE2DE),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0)),
                                  fixedSize: const Size(108.5, 35),
                                ),
                                onPressed: () {
                                  Share.share(
                                      "${myemoji}\n${widget.temp[widget.index]}\n${myemoji}");
                                },
                                child: const Text(
                                  "Share",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xffCAE2DE),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0)),
                                  fixedSize: const Size(108.5, 35),
                                ),
                                onPressed: () {},
                                child: const Text(
                                  "Font",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shadowColor: Color(0xffCAE2DE),
                                  primary: Color(0xffCAE2DE),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0)),
                                  fixedSize: const Size(108.5, 35),
                                ),
                                onPressed: () {
                                  showModalBottomSheet(
                                      backgroundColor: Color(0xffEACFEA),
                                      isDismissible: false,
                                      barrierColor: Colors.transparent,
                                      builder: (context) {
                                        return Container(
                                          height: 130,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: GridView.builder(
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        shayri.myemoji.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return GridTile(
                                                          child: InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            myemoji = shayri
                                                                .myemoji[index];
                                                          });
                                                        },
                                                        child: Container(
                                                          height: 20,
                                                          margin:
                                                              const EdgeInsets
                                                                  .all(10),
                                                          color:
                                                              Color(0xffCAE2DE),
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              "${shayri.myemoji[index]}"),
                                                        ),
                                                      ));
                                                    },
                                                    gridDelegate:
                                                        SliverGridDelegateWithFixedCrossAxisCount(
                                                            crossAxisCount: 5)),
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    height: 50,
                                                    width: 50,
                                                    child: IconButton(
                                                        onPressed: () {
                                                          return Navigator.pop(
                                                              context);
                                                        },
                                                        icon: const Icon(Icons
                                                            .close_rounded)),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                      context: context);
                                },
                                child: const Text(
                                  "Emoji",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xffCAE2DE),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  fixedSize: const Size(108.5, 35),
                                ),
                                onPressed: () {
                                  showModalBottomSheet(
                                      elevation: 10,
                                      backgroundColor: Color(0xffCAE2DE),
                                      builder: (context) {
                                        return Container(
                                            height: 100,
                                            child: StatefulBuilder(
                                              builder: (context, setState1) {
                                                return Slider(
                                                  inactiveColor:
                                                      Color(0xff791b74),
                                                  activeColor:
                                                      Color(0xffb973b9),
                                                  thumbColor: Color(0xffb973b9),
                                                  min: 20,
                                                  max: 70,
                                                  onChanged: (value) {
                                                    print(value);
                                                    setState1(() {});

                                                    setState(() {
                                                      textsize = value;
                                                    });
                                                  },
                                                  value: textsize,
                                                );
                                              },
                                            ));
                                      },
                                      context: context);
                                },
                                child: const Text(
                                  "Text Size",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold, // light
                                  ),
                                )),
                          ],
                        )
                      ],
                    ),
                  )),
            ),
          ],
        ));
  }
}
