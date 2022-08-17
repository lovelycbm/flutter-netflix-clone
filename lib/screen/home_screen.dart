import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/Carousel_slider.dart';
import 'package:flutter_application_1/widget/box_slider.dart';
import 'package:flutter_application_1/widget/circle_slider.dart';

import '../model/model_movie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Movie> movies = [
    Movie.fromMap({
      'title': '사랑의 불시착',
      'keyword': ' 사랑/로맨스/판티지',
      'poster': 'test_movie_1.png',
      'favorite': false,
    }),
    Movie.fromMap({
      'title': '사랑의 불시착',
      'keyword': ' 사랑/로맨스/판티지',
      'poster': 'test_movie_1.png',
      'favorite': false,
    }),
    Movie.fromMap({
      'title': '사랑의 불시착',
      'keyword': ' 사랑/로맨스/판티지',
      'poster': 'test_movie_1.png',
      'favorite': false,
    }),
    Movie.fromMap({
      'title': '사랑의 불시착',
      'keyword': ' 사랑/로맨스/판티지',
      'poster': 'test_movie_1.png',
      'favorite': false,
    })
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      Stack(
        children: <Widget>[CarouselImage(movies: movies), const TopBar()],
      ),
      CircleSlider(movies: movies),
      BoxSlider(movies: movies)
    ]);
  }
}

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(20, 7, 20, 7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Image.asset('images/bbongflix_logo.png',
                fit: BoxFit.contain, height: 25),
            Container(
                padding: const EdgeInsets.only(right: 1),
                child: const Text('TV 프로그램', style: TextStyle(fontSize: 14))),
            Container(
                padding: const EdgeInsets.only(right: 1),
                child: const Text('영화', style: TextStyle(fontSize: 14))),
            Container(
                padding: const EdgeInsets.only(right: 1),
                child: const Text('내가 찜한 컨텐츠', style: TextStyle(fontSize: 14))),
          ],
        ));
  }
}
