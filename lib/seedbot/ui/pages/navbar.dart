import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:seedbot/utils/MyColor.dart';
import '../../../users/ui/pages/profil/ProfilPage.dart';

import 'Parametre/ParametrePage.dart';
import 'connexion/listAppareilConnect/ListAppareilConnectPage.dart';
import 'notification/NotificationPage.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    ListAppareilConnectPage(),
    NotificationPage(),
    ParametrePage(),


  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: _selectedIndex,
        height: 50,
        backgroundColor: MyColor.c4,
        color: MyColor.white,
        items: [
          ImageIcon(AssetImage('assets/images/bot.png'), size: 40, color: MyColor.c4),
          ImageIcon(AssetImage('assets/images/notification.png'), size: 30, color: MyColor.c4),
          Icon(Icons.settings, size: 30, color: MyColor.c4),

        ],
        onTap: _onItemTapped,
      ),
    );
  }
}