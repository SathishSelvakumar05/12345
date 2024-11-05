import 'package:flutter/material.dart';

class NetflixScreen extends StatelessWidget {
  const NetflixScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.deepOrange,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.blueGrey,
            leading: Icon(Icons.person),
            actions: [Icon(Icons.logout)],
            foregroundColor: Colors.white,
            floating: true,
            scrolledUnderElevation: 22,

            //title: Text('sasd'),
            expandedHeight: 350,
            pinned: true,
            elevation: 22,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'CUSTOM SCROLL VIEW',
                style: TextStyle(color: Colors.white),
              ),
              centerTitle: true,
              expandedTitleScale: 1.2,
              background: Image(
                image: AssetImage('assets/images/streetlight.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            childCount: 5,
            (context, index) {
              return Card(
                color: Colors.blueGrey,
                child: ListTile(
                  title: Text('SATHISH'),
                ),
              );
            },
          )),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 5,
              (context, index) {
                return Card(
                  color: Colors.brown,
                  child: ListTile(
                    title: Text('KUMAR'),
                  ),
                );
              },
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 5,
              (context, index) {
                return Card(
                  color: Colors.blueAccent,
                  child: ListTile(
                    title: Text('FLUTTER DEVELOPER'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
