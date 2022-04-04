import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BelajarAppBar(),
    );
  }
}

class BelajarAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
          length: 3,
          child: NestedScrollView(
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    expandedHeight: 200.0,
                    floating: false,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: Text("SliverAppBar",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          )),
                      background: Image(
                        image: AssetImage('assets/images/pc 1.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: _SliverAppBarDelegate(
                      TabBar(
                        labelColor: Colors.black87,
                        unselectedLabelColor: Colors.grey,
                        tabs: [
                          new Tab(icon: new Icon(Icons.audiotrack), text: "Songs"),
                          new Tab(icon: new Icon(Icons.album_outlined), text: "album"),
                          new Tab(icon: new Icon(Icons.favorite_border_outlined), text: "faforite"),
                        ],
                      ),
                    ),
                  ),
                ];
              },
              body: TabBarView(
                children: <Widget>[
                  Songs(),
                  album(),
                  favorite()
                ],
              ))),
    );
  }
}

class Songs extends StatelessWidget {
  final List song = [
    "American Idiot",
    "Boulevard of Broken Dreams",
    "Jesus of Suburbia",
    "21 Guns",
    "Basket Case",
    "Good Riddance (Time of Your Life)",
    "Wake Me Up When September Ends",
    "Walking Contradiction",
    "2000 Light Years Away",
    "Panic Song",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
              child: ListTile(
            title: Text(song[index], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            subtitle: Text('GREEN DAY ' + song[index]),
            leading: Icon(Icons.playlist_add_check),
          ));
        },
        itemCount: song.length,
      ),
    );
  }
}

class favorite extends StatelessWidget {
  final List faforit = [
    "Smells Like Teen Spirit",
    "lithium",
    "all apologies",
    "On a Plain",
    "Breed",
    " Something in the Way",
    "Stay Away",
    "You Know You’re Right"
        "Lake of Fire",
    "Dumb",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
              child: ListTile(
            title: Text(faforit[index], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            subtitle: Text('NIRVANA ' + faforit[index]),
            leading: Icon(Icons.favorite),
          ));
        },
        itemCount: faforit.length,
      ),
    );
  }
}

class album extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 1,
        children: <Widget>[
          Container(
            child: Card(
              elevation: 8,
              child: Column(
                children: <Widget>[
                  Image.asset(
                    "assets/images/nevermind.jpg",
                    height: 200,
                    width: 300,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Card(
              elevation: 8,
              child: Column(
                children: <Widget>[
                  Image.asset(
                    "assets/images/utero.jpg",
                    height: 200,
                    width: 300,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
