import 'movie.dart';

class Recommended {
  String date;
  String time;
  String imgUrl;
  String name;
  String category;
  String ageRestriction;

  Recommended(
      {this.imgUrl,
      this.name,
      this.category,
      this.ageRestriction,
      this.date,
      this.time});
}

List<Recommended> recommendedMovies = [
  Recommended(
      date: '03 Sep 2020',
      time: '90min',
      imgUrl: 'images/jumpo.jpeg',
      name: 'Penguins',
      category: 'Animation',
      ageRestriction: 'PG'),
  Recommended(
      date: '03 Sep 2020',
      time: '90min',
      imgUrl: 'images/cars.jpg',
      name: 'Penguins',
      category: 'Animation',
      ageRestriction: 'PG'),
  Recommended(
      date: '03 Sep 2020',
      time: '90min',
      imgUrl: 'images/laugh.jpeg',
      name: 'Penguins',
      category: 'Animation',
      ageRestriction: 'PG'),
];
