import 'package:flutter/material.dart';
import 'package:netflix_clone_coding/models/model_movie.dart';
import 'package:netflix_clone_coding/screens/detail_screen.dart';

class BoxSlider extends StatelessWidget {
  final List<Movie> movies;

  const BoxSlider({Key key, this.movies}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('지금 뜨는 콘텐츠'),
          Container(
            height: 120.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: makeBoxImages(movies, context),
            ),
          )
        ],
      ),
    );
  }
}

List<Widget> makeBoxImages(List<Movie> movies, BuildContext context) {
  List<Widget> result = [];
  for (var i = 0; i < movies.length; i++) {
    result.add(InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              movie: movies[i],
            ),
            fullscreenDialog: true,
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.only(right: 10.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Image.asset('assets/images/${movies[i].poster}'),
        ),
      ),
    ));
  }
  return result;
}
