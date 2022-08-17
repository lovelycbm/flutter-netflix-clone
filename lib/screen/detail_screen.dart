import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/model_movie.dart';

class DetailScreen extends StatefulWidget {
  final Movie movie;

  const DetailScreen({Key? key, required this.movie}) : super(key: key);
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool favorite = false;

  @override
  void initState() {
    super.initState();
    favorite = widget.movie.favorite;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: ListView(children: <Widget>[
      Stack(children: <Widget>[
        Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/${widget.movie.poster}'),
                  fit: BoxFit.cover)),
          child: ClipRect(
              child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                alignment: Alignment.center,
                color: Colors.black.withOpacity(0.1),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.fromLTRB(0, 45, 0, 10),
                      child: Image.asset(
                        'images/${widget.movie.poster}',
                        height: 300,
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: const Text(
                          '99% 일치 2019 15+ 시즌 1개',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        )),
                    Container(
                        padding: const EdgeInsets.all(7),
                        child: Text(widget.movie.title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16))),
                    Container(
                        padding: const EdgeInsets.all(3),
                        child: TextButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.red)),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                              ),
                              Padding(
                                padding: EdgeInsets.all(3),
                              ),
                              Text('재생', style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        )),
                    Container(
                        padding: const EdgeInsets.all(5),
                        child: Text(widget.movie.toString(),
                            style: const TextStyle(
                                color: Colors.white60, fontSize: 13))),
                    Container(
                        padding: const EdgeInsets.all(5),
                        alignment: Alignment.centerLeft,
                        child: const Text('출현: 현빈, 손예진, 서지혜\n제작자: 이정효, 박지은',
                            style: TextStyle(
                                color: Colors.white60, fontSize: 12))),
                  ],
                )),
          )),
        ),
        Positioned(
            child: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        )),
      ]),
      Container(
          color: Colors.black26,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: InkWell(
                      onTap: () {
                        setState(() {
                          favorite = !favorite;
                        });
                      },
                      child: Column(
                        children: [
                          favorite
                              ? const Icon(
                                  Icons.check,
                                )
                              : const Icon(
                                  Icons.add,
                                ),
                          const Padding(padding: EdgeInsets.all(5)),
                          const Text('내가 찜한 콘텐츠',
                              style: TextStyle(
                                  fontSize: 11, color: Colors.white60)),
                        ],
                      ))),
              Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: const [
                          Icon(
                            Icons.thumb_up,
                          ),
                          Padding(padding: EdgeInsets.all(5)),
                          Text('평가',
                              style: TextStyle(
                                  fontSize: 11, color: Colors.white60)),
                        ],
                      ))),
              Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: const [
                          Icon(
                            Icons.send,
                          ),
                          Padding(padding: EdgeInsets.all(5)),
                          Text('공유',
                              style: TextStyle(
                                  fontSize: 11, color: Colors.white60)),
                        ],
                      )))
            ],
          )),
      makeMenuButton()
    ])));
  }
}

Widget makeMenuButton() {
  return Container();
}
