import 'package:chillwithus/AuthServices.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chillwithus/models/recc_movies.dart';
import 'package:chillwithus/models/showing_movies.dart';
import 'package:chillwithus/models/next_movies.dart';
import 'package:chillwithus/widgets/myCard.dart';
import 'package:chillwithus/widgets/myCarousal.dart';
import "package:firebase_auth/firebase_auth.dart";

import 'Database.dart';

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     CollectionReference users =
//         FirebaseFirestore.instance.collection('UserProfiles');

//     return StreamBuilder<DocumentSnapshots>(
//       stream: users.snapshots(),
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (snapshot.hasError) {
//           return Scaffold(
//             body: Text('Something went wrong'),
//           );
//         }

//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Text("Loading");
//         }
//         var userDocument = snapshot.data;
//         return Text(userDocument['Last_Name']);

//       },
//     );
//   }
// }

final FirebaseAuth auth_services = FirebaseAuth.instance;

var user = Auth_Services().getUserCred();

Widget name = DbService().getFistandLastName(user.uid);

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = [
    Tab(
      text: 'Now Showing',
    ),
    Tab(
      text: 'Next',
    )
  ];
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: myTabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text('Movie Tickets'),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            )
          ],
        ),
        drawer: Drawer(
          elevation: 0,
          child: ListView(children: [
            UserAccountsDrawerHeader(
              accountEmail: Text(user.email),
              accountName: name,
              currentAccountPicture: GestureDetector(
                  child: CircleAvatar(child: Icon(Icons.person))),
            ),
            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/');
                },
                child:
                    ListTile(leading: Icon(Icons.home), title: Text('Home'))),
            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/movies');
                },
                child: ListTile(
                    leading: Icon(Icons.local_movies), title: Text('Movies'))),
            InkWell(
                onTap: () {},
                child: ListTile(
                    leading: Icon(Icons.done), title: Text('Bookings'))),
            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/');
                },
                child: ListTile(
                    leading: Icon(Icons.settings), title: Text('Settings'))),
            InkWell(
                onTap: () {},
                child:
                    ListTile(leading: Icon(Icons.help), title: Text('About'))),
          ]),
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blue, Colors.blue[100]])),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Recommended',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: Container(
                      height: 200,
                      width: 700,
                      child: ListView.builder(
                        itemCount: recommendedMovies.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          Recommended recommended = recommendedMovies[index];
                          return HorizontalCarousal(
                            movie: recommended,
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TabBar(
                    controller: _tabController,
                    tabs: myTabs,
                  ),
                  Container(
                    height: 200,
                    child: TabBarView(
                      children: [
                        GridView.builder(
                          physics: BouncingScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, crossAxisSpacing: 10),
                          itemCount: showing_movies.length,
                          itemBuilder: (BuildContext context, int index) {
                            Showing movie = showing_movies[index];
                            return MyCard(
                              movie: movie,
                            );
                          },
                        ),
                        GridView.builder(
                          physics: BouncingScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, crossAxisSpacing: 10),
                          itemCount: next_movies.length,
                          itemBuilder: (BuildContext context, int index) {
                            Next movie = next_movies[index];
                            return MyCard(
                              movie: movie,
                            );
                          },
                        )
                      ],
                      controller: _tabController,
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
