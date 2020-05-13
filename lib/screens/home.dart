import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/destination_carousel.dart';
import '../widgets/hotel_carousel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedIndex = 0;
  List<IconData> _icons = [
    FontAwesomeIcons.plane, FontAwesomeIcons.bed,
    FontAwesomeIcons.walking, FontAwesomeIcons.biking,
  ];

  int _currentTab = 0;

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        print(_selectedIndex);
      },
      child: Container(
        width: 60.0,
        height: 60.0,
        decoration: BoxDecoration(
          color: index == _selectedIndex
            ? Theme.of(context).accentColor
            : Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(
          _icons[index], 
          size: 25.0,
          color: index == _selectedIndex
            ? Theme.of(context).primaryColor
            : Color(0xFFB4C1C4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          children: <Widget>[

            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 120.0),
              child: Text(
                'What would you like to find?',
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)
              ),
            ),

            SizedBox(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _icons.asMap().entries.map(
                (MapEntry map) => _buildIcon(map.key)
              ).toList(),
            ),

            SizedBox(height: 25.0,),
            DestinationCarousel(),
            
            SizedBox(height: 7.0,),
            HotelCarousel(),

          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        onTap: (int value) {
          setState(() {
            _currentTab = value;
          });
          print(_currentTab);
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search, 
              size: 30.0,
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.local_pizza,
              size: 30.0,
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 15.0,
              backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRh-F4qsMufhmSQhN1TlpquIkXDplGx_q7J8-PCEYCJ_HHznj8Y&usqp=CAU'),
            ),
            title: SizedBox.shrink(),
          ),
        ],
      ),
    
    );
  }
}
