import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.all(8.0),
          child: Image.asset("assets/logo.jpg"),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("What's Happening", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text("See all", style: TextStyle(color: Colors.blue)),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                eventCard(context, "assets/GF.jpg", "Green Fiesta 2025", "Green Fiesta 2025 lit up NSBM Grounds with an unforgettable evening filled with music, joy, and unlimited entertainment. See more"),
                eventCard(context, "assets/SP.jpg", "Siyapathiyu Udanaya 2025", "As the spirit of 2025 keeps on painting a promising horizon, NSBM has set the stage early for one of its most anticipated annual events—Siyapathiyu Udanaya 2025. See more"),
                eventCard(context, "assets/HM.jpg", "SPRITOUS'25", "The NSBM Volunteer Club Installation Ceremony for the board 24/25 was held on the 4th of March to officially badge the new board members into their respective positions, marking the beginning of their journey within the NSBM Volunteer community.. see more"),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Image.asset("assets/events_icon.png", height: 24), label: "Events"),
          BottomNavigationBarItem(icon: Image.asset("assets/clubs_icon.png", height: 24), label: "Clubs"),
          BottomNavigationBarItem(icon: Image.asset("assets/home_icon.png", height: 24), label: "Home"),
          BottomNavigationBarItem(icon: Image.asset("assets/faculties_icon.png", height: 24), label: "Faculties"),
          BottomNavigationBarItem(icon: Image.asset("assets/profile_icon.png", height: 24), label: "Profile"),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget eventCard(BuildContext context, String imagePath, String title, String description) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EventDetailPage(
              imagePath: imagePath,
              title: title,
              description: description,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(imagePath, fit: BoxFit.cover, height: 200, width: double.infinity),
              ),
              Container(
                height: 200,
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.7),
                      Colors.black.withOpacity(0.3),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 16,
                right: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    SizedBox(height: 5),
                    Text(
                      description,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EventDetailPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  EventDetailPage({required this.imagePath, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(imagePath, fit: BoxFit.cover, width: double.infinity, height: 250),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text(description, style: TextStyle(fontSize: 16, color: Colors.grey[700])),
              ],
            ),
          ),
        ],
      ),
    );
  }
}