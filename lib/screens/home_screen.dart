import 'package:flutter/material.dart';
import 'package:netflix_clone_coding/models/model_movie.dart';
import 'package:netflix_clone_coding/widgets/box_slider.dart';
import 'package:netflix_clone_coding/widgets/carousel_image.dart';
import 'package:netflix_clone_coding/widgets/circle_slider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Movie> movies = [
    Movie.fromMap({
      'title': '사랑의 불시착',
      'keyword': '사랑/로맨스/판타지',
      'poster': 'movie_01.jpg',
      'like': false
    }),
    Movie.fromMap({
      'title': '사랑의 불시착',
      'keyword': '사랑/로맨스/판타지',
      'poster': 'movie_01.jpg',
      'like': false
    }),
    Movie.fromMap({
      'title': '사랑의 불시착',
      'keyword': '사랑/로맨스/판타지',
      'poster': 'movie_01.jpg',
      'like': false
    }),
    Movie.fromMap({
      'title': '사랑의 불시착',
      'keyword': '사랑/로맨스/판타지',
      'poster': 'movie_01.jpg',
      'like': false
    }),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(
          children: [
            CarouselImage(
              movies: movies,
            ),
            TopBar(),
          ],
        ),
        CircleSlider(
          movies: movies,
        ),
        BoxSlider(
          movies: movies,
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
  }
}

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.0, 7.0, 20.0, 7.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/images/netflix.png',
            fit: BoxFit.contain,
            height: 20.0,
          ),
          Container(
            padding: EdgeInsets.only(right: 1),
            child: Text(
              'TV 프로그램',
              style: TextStyle(fontSize: 14.0),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 1),
            child: Text(
              '영화',
              style: TextStyle(fontSize: 14.0),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 1),
            child: Text(
              '내가 찜한 콘텐츠',
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
