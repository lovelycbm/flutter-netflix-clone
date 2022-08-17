import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/model_movie.dart';
import 'package:flutter_application_1/screen/detail_screen.dart';

class CarouselImage extends StatefulWidget {
  final List<Movie> movies;

  const CarouselImage({Key? key, required this.movies}) : super(key: key);

  @override
  State<CarouselImage> createState() => _CarouselImageState();
}

class _CarouselImageState extends State<CarouselImage> {
  late List<Movie> movies;
  late List<Widget> images;
  late List<String> keywords;
  late List<bool> favorites;

  int _currentPage = 0;
  late String _currentKeyword;

  @override
  void initState() {
    super.initState();
    movies = widget.movies;
    images =
        movies.map((movie) => Image.asset('./images/${movie.poster}')).toList();
    keywords = movies.map((movie) => movie.keyword).toList();
    favorites = movies.map((movie) => movie.favorite).toList();
    _currentKeyword = keywords[0];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(padding: const EdgeInsets.all(20)),
        CarouselSlider(
          items: images,
          options: CarouselOptions(onPageChanged: (index, reason) {
            setState(() {
              _currentPage = index;
              _currentKeyword = keywords[_currentPage];
            });
          }),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 3),
          child: Text(_currentKeyword, style: const TextStyle(fontSize: 11)),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  favorites[_currentPage]
                      ? IconButton(
                          icon: const Icon(Icons.check),
                          onPressed: () {},
                        )
                      : IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {},
                        ),
                  const Text('내가 찜한 컨텐츠', style: TextStyle(fontSize: 11)),
                ],
              ),
              Container(
                  padding: const EdgeInsets.only(right: 10),
                  child: TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white)),
                    onPressed: () {},
                    child: Row(
                      children: const <Widget>[
                        Icon(
                          Icons.play_arrow,
                          color: Colors.black,
                        ),
                        Padding(
                          padding: EdgeInsets.all(3),
                        ),
                        Text('재생', style: TextStyle(color: Colors.black)),
                      ],
                    ),
                  )),
              Container(
                  padding: const EdgeInsets.only(right: 10),
                  child: Column(
                    children: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.info),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute<void>(
                              fullscreenDialog: true,
                              builder: (BuildContext context) {
                                return DetailScreen(
                                    movie: movies[_currentPage]);
                              }));
                        },
                      ),
                      const Text('정보', style: TextStyle(fontSize: 11)),
                    ],
                  ))
            ]),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: makeIndicator(favorites, _currentPage)),
      ],
    );
  }
}

List<Widget> makeIndicator(List list, int currentPage) {
  List<Widget> results = [];
  for (var i = 0; i < list.length; i++) {
    results.add(Container(
        width: 8,
        height: 8,
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: i == currentPage
                ? const Color.fromRGBO(255, 255, 255, 0.9)
                : const Color.fromRGBO(255, 255, 255, 0.4))));
  }

  return results;
}
