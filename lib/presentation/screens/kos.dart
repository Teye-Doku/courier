import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import './screens.dart';

class KosCourier extends StatefulWidget {
  @override
  _KosCourierState createState() => _KosCourierState();
}

class _KosCourierState extends State<KosCourier> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = [CourierHome(), Requests(), Payments()];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BubbleBottomBar(
        opacity: 0.2,
        backgroundColor: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.0),
        ),
        currentIndex: _selectedIndex,
        hasInk: true,
        inkColor: Colors.black12,
        hasNotch: true,
        onTap: _onItemTapped,
        items: [
          BubbleBottomBarItem(
            backgroundColor: Colors.blueGrey,
            icon: Icon(
              Icons.dashboard,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.dashboard,
              color: Colors.blueGrey,
            ),
            title: Text('Home'),
          ),
          BubbleBottomBarItem(
            backgroundColor: Colors.indigo,
            icon: Icon(
              Icons.folder_open,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.folder_open,
              color: Colors.indigo,
            ),
            title: Text('Requests'),
          ),
          BubbleBottomBarItem(
            backgroundColor: Colors.deepPurple,
            icon: Icon(
              Icons.payment,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.payment,
              color: Colors.deepPurple,
            ),
            title: Text('Payments'),
          ),
        ],
      ),
    );
  }
}
