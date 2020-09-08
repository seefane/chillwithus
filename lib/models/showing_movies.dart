import 'movie.dart';

class Showing {
  String date;
  String time;
  String imgUrl;
  String name;
  String category;
  String ageRestriction;

  Showing(
      {this.date,
      this.time,
      this.imgUrl,
      this.name,
      this.category,
      this.ageRestriction});
}

List<Showing> showing_movies = [
  Showing(
      date: '03 Sep 2020',
      time: '90min',
      imgUrl: 'images/peg.jpeg',
      name: 'Penguins',
      category: 'Animation',
      ageRestriction: 'PG'),
  Showing(
      date: '03 Sep 2020',
      time: '90min',
      imgUrl: 'images/pe.jpg',
      name: 'Penguins',
      category: 'Animation',
      ageRestriction: 'PG'),
  Showing(
      date: '03 Sep 2020',
      time: '90min',
      imgUrl: 'images/cars.jpg',
      name: 'Penguins',
      category: 'Animation',
      ageRestriction: 'PG'),
  Showing(
      date: '03 Sep 2020',
      time: '90min',
      imgUrl: 'images/frie.jpeg',
      name: 'Penguins',
      category: 'Animation',
      ageRestriction: 'PG'),
  Showing(
      date: '03 Sep 2020',
      time: '90min',
      imgUrl: 'images/jumpo.jpeg',
      name: 'Penguins',
      category: 'Animation',
      ageRestriction: 'PG'),
  Showing(
      date: '03 Sep 2020',
      time: '90min',
      imgUrl: 'images/jumpo.jpeg',
      name: 'Penguins',
      category: 'Animation',
      ageRestriction: 'PG'),
];
