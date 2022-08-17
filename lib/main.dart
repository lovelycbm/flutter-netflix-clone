import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/home_screen.dart';
import 'package:flutter_application_1/screen/more_screen.dart';
import 'package:flutter_application_1/widget/bottom_bar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late TabController controller;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'GenieDay',
        theme: ThemeData(
          primaryColor: Colors.black,
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
              .copyWith(secondary: Colors.white, brightness: Brightness.dark),
        ),
        home: const DefaultTabController(
          length: 4,
          child: Scaffold(
            body: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                HomeScreen(),
                Center(child: Text('search')),
                Center(child: Text('save')),
                MoreScreen(),
              ],
            ),
            bottomNavigationBar: Bottom(),
          ),
        ));
  }
}
