import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Container(
            padding: const EdgeInsets.only(top: 50),
            child: const CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('images/bbongflix_logo.png'),
            )),
        Container(
            padding: const EdgeInsets.only(top: 20),
            child: const Text('lovelycbm',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white))),
        Container(
            margin: const EdgeInsets.only(top: 5),
            padding: const EdgeInsets.all(5),
            width: 140,
            height: 5,
            color: Colors.red),
        Container(
          padding: const EdgeInsets.all(10),
          child: Linkify(
            onOpen: (link) async {
              if (await canLaunch(link.url)) {
                await launch(link.url);
              }
            },
            text: 'https://github.com',
          ),
        )
      ],
    ));
  }
}
