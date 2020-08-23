import 'package:flutter/material.dart';
import 'package:netflix_clone_coding/models/model_movie.dart';
import 'package:netflix_clone_coding/screens/detail_screen.dart';

class CircleSlider extends StatelessWidget {
  final List<Movie> movies;

  const CircleSlider({Key key, this.movies}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('미리보기'),
          Container(
            height: 120.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: makeCircleImages(movies, context),
            ),
          ),
        ],
      ),
    );
  }
}

List<Widget> makeCircleImages(List<Movie> movies, BuildContext context) {
  List<Widget> result = [];
  for (var i = 0; i < movies.length; i++) {
    result.add(
      InkWell(
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
            child: CircleAvatar(
              backgroundImage: AssetImage(
                'assets/images/${movies[i].poster}',
              ),
              radius: 48,
            ),
          ),
        ),
      ),
    );
  }
  return result;
}
