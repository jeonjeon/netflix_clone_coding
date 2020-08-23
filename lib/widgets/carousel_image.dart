import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone_coding/models/model_movie.dart';
import 'package:netflix_clone_coding/screens/detail_screen.dart';

class CarouselImage extends StatefulWidget {
  final List<Movie> movies;

  const CarouselImage({Key key, this.movies}) : super(key: key);

  @override
  _CarouselImageState createState() => _CarouselImageState();
}

class _CarouselImageState extends State<CarouselImage> {
  List<Movie> movies;
  List<Widget> images;
  List<String> keywords;
  List<bool> likes;
  int _currentPage = 0;
  String _currentKeyword;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20.0),
          ),
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
            padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 3.0),
            child: Text(
              _currentKeyword,
              style: TextStyle(
                fontSize: 11.0,
              ),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Column(
                    children: [
                      likes[_currentPage]
                          ? IconButton(
                              icon: Icon(Icons.check),
                              onPressed: () {},
                            )
                          : IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {},
                            ),
                      Text(
                        '내가 찜한 콘텐츠',
                        style: TextStyle(
                          fontSize: 11.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 10.0),
                  child: FlatButton(
                    color: Colors.white,
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.play_arrow,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          '재생',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Column(
                    children: [
                      IconButton(
                        icon: Icon(Icons.info),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                movie: movies[_currentPage],
                              ),
                              fullscreenDialog: true,
                            ),
                          );
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: makeIndicator(likes, _currentPage),
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    movies = widget.movies;
    images =
        movies.map((x) => Image.asset('assets/images/${x.poster}')).toList();
    keywords = movies.map((e) => e.keyword).toList();
    likes = movies.map((e) => e.like).toList();
    _currentKeyword = keywords[0];
  }
}

List<Widget> makeIndicator(List list, int _currentPage) {
  List<Widget> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(
      Container(
        width: 8.0,
        height: 8.0,
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _currentPage == i
              ? Color.fromRGBO(255, 255, 255, 0.9)
              : Color.fromRGBO(255, 255, 255, 0.4),
        ),
      ),
    );
  }
  return result;
}
