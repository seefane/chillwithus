import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chillwithus/models/next_movies.dart';
import 'package:chillwithus/models/showing_movies.dart';
import 'package:chillwithus/widgets/myCard.dart';

class Movies extends StatefulWidget {
  @override
  _MoviesState createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Movies')),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Now Showing'),
              Tab(text: 'Next'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: GridView.builder(
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, crossAxisSpacing: 10),
                itemCount: showing_movies.length,
                itemBuilder: (BuildContext context, int index) {
                  Showing movie = showing_movies[index];
                  return MyCard(
                    movie: movie,
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: GridView.builder(
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, crossAxisSpacing: 10),
                itemCount: next_movies.length,
                itemBuilder: (BuildContext context, int index) {
                  Next movie = next_movies[index];
                  return MyCard(
                    movie: movie,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
