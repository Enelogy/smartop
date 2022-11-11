import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartop/views/widgets/vw_home.dart';
import 'package:smartop/views/widgets/vw_pencarian.dart';

class vmenuutama extends StatefulWidget {
  const vmenuutama({Key? key}) : super(key: key);

  @override
  State<vmenuutama> createState() => _vmenuutamaState();
}

class _vmenuutamaState extends State<vmenuutama> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const vwhome(),
  const vwpencarian(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
        child: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Beranda',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Pencarian',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket),
              label: 'Keranjang',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              backgroundColor: Colors.white),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
