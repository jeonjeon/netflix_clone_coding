import 'package:flutter/material.dart';
import 'package:netflix_clone_coding/screens/home_screen.dart';
import 'package:netflix_clone_coding/widgets/main_bottom_appbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TabController controller;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clonetflix',
      theme: ThemeData.dark(),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              HomeScreen(),
              Container(
                child: Center(
                  child: Text('search'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('save'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('more'),
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomAppBar(
            child: MainBottomAppBar(),
          ),
        ),
      ),
    );
  }
}
