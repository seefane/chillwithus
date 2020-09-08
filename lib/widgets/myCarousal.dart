import 'package:flutter/material.dart';
import 'package:chillwithus/pages/detail.dart';

class HorizontalCarousal extends StatelessWidget {
  final movie;

  HorizontalCarousal({this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image(
              image: AssetImage(movie.imgUrl),
              fit: BoxFit.cover,
              height: 300,
              width: 210,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Opacity(
              opacity: .65,
              child: Container(
                  height: 60,
                  width: 210,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(4),
                        bottomRight: Radius.circular(4)),
                    color: Colors.black,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(movie.name,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text(movie.category,
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Container(
                                    width: 1,
                                    height: 10,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Text(movie.time,
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Container(
                                    width: 1,
                                    height: 10,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Text(movie.ageRestriction,
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold))
                                ],
                              )
                            ]),
                        GestureDetector(
                            onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => DetailPage(movie: movie)),
                                ),
                            child: Container(
                                height: 20,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text('Book',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: Colors.white)),
                                )))
                      ],
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
