import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homePage(),
    );
  }
}

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int _selectedNavbar = 0;

  void _changeSelectedNavbar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: BodyContent(selectedNavbar: _selectedNavbar),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: ('Beranda'),
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: ('Book'),
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: ('Akun'),
          ),
        ],
        currentIndex: _selectedNavbar,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.blue[300],
        showUnselectedLabels: true,
        onTap: _changeSelectedNavbar,
        backgroundColor: Colors.black,
      ),
    );
  }

  AppBar _buildAppBar() {
    if (_selectedNavbar == 0) {
      return AppBar(
        backgroundColor: Colors.black,
        title: Text('Beranda'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
          ),
        ],
      );
    } else {
      return AppBar();
    }
  }
}

class BodyContent extends StatelessWidget {
  final int selectedNavbar;

  const BodyContent({required this.selectedNavbar});

  @override
  Widget build(BuildContext context) {
    switch (selectedNavbar) {
      case 0:
        return BerandaContent();
      case 1:
        return BookContent();
      case 2:
        return AkunContent();
      default:
        return Container();
    }
  }
}

class BerandaContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 16, top: 8),
            child: Text(
              "Koleksi baru :",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        SizedBox(
          height: 300,  
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,  
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/book${index + 1}.png',  
                      width: 150, 
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Judul Buku ${index + 1}',  
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
       Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 16, top: 0),
            child: Text(
              "Rekomendasi",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.left,
            ),
          ),
        ),
         SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 5,  
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/bawah/bawah${index + 1}.png', 
                      width: 300,
                      height: 235, 
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}





class BookContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Tab Book",
          style: TextStyle(fontSize: 20),
        ),
// widgeg lain
      ],
    );
  }
}

class AkunContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Tab Akun",
            style: TextStyle(fontSize: 20),
          ),
          // widget lain
        ],
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear), onPressed: () => query = "")];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text('Hasil Pencarian: $query'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text('Saran Pencarian: $query'),
    );
  }
}
