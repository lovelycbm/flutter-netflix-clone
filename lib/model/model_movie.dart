class Movie {
  final String title;
  final String keyword;
  final String poster;
  final bool favorite;

  Movie.fromMap(Map<String, dynamic> map)
      : title = map['title'],
        keyword = map['keyword'],
        poster = map['poster'],
        favorite = map['favorite'];

  @override
  String toString() => 'Moive<$title:$keyword>';
}
