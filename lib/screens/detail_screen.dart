import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_clone_coding/models/model_movie.dart';

class DetailScreen extends StatefulWidget {
  final Movie movie;

  const DetailScreen({Key key, this.movie}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool like = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: ListView(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/${widget.movie.poster}',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.black.withOpacity(0.1),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 10.0),
                                child: Image.asset(
                                  'assets/images/${widget.movie.poster}',
                                  height: 250,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(7.0),
                                child: Text(
                                  '99% 일치 2019 15+ 시즌 1개',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 13),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(7.0),
                                child: Text(
                                  widget.movie.title,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(3.0),
                                child: FlatButton(
                                  onPressed: () {},
                                  color: Colors.red,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.play_arrow),
                                      Text('재생'),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Text(
                                  widget.movie.toString(),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(5.0),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '출연: 현빈, 손예진, 서지혜\n제작자: 이정호, 박지은',
                                  style: TextStyle(
                                    color: Colors.white60,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      child: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                  ))
                ],
              ),
              Container(
                color: Colors.black26,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      child: InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            like ? Icon(Icons.check) : Icon(Icons.add),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              '내가 찜한 콘텐츠',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.white60,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      child: Container(
                        child: Column(
                          children: [
                            Icon(Icons.thumb_up),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              '평가',
                              style: TextStyle(
                                  fontSize: 11, color: Colors.white60),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      child: Container(
                        child: Column(
                          children: [
                            Icon(Icons.send),
                            Padding(padding: EdgeInsets.all(5.0)),
                            Text(
                              '꽁유',
                              style: TextStyle(
                                fontSize: 11.0,
                                color: Colors.white60,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    this.like = widget.movie.like;
    print(widget.movie.poster);
  }
}
