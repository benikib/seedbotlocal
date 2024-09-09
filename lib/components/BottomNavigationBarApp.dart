import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:seedbot/main.dart';
import 'package:seedbot/seedbot/ui/pages/Parametre/ParametrePage.dart';
import 'package:seedbot/utils/MyColor.dart';
import 'package:seedbot/utils/Route.dart';
import 'dart:developer';

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import '../seedbot/ui/pages/connexion/listAppareilConnect/ListAppareilConnectPage.dart';
import '../seedbot/ui/pages/home/HomePage.dart';
import '../seedbot/ui/pages/notification/NotificationPage.dart';
import '../users/ui/pages/profil/ProfilPage.dart';

/// Flutter code sample for [BottomNavigationBar].

class BottomNavigationBarApp extends StatefulWidget {
  const BottomNavigationBarApp({super.key});

  @override
  State<BottomNavigationBarApp> createState() =>
      _BottomNavigationBarAppState();
}

class _BottomNavigationBarAppState
    extends State<BottomNavigationBarApp> {
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  List nav = [
    ListAppareilConnectPage(),
    ProfilPage(),
    NotificationPage(),
    ParametrePage()
  ];

  void _onPageChanged(int index) =>
      _bottomNavigationKey.currentState?.setPage(_selectedIndex);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _onPageChanged(index);
  }

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      key: _bottomNavigationKey,
      index: _selectedIndex,
      height: 50,
      backgroundColor: MyColor.c4,
      color: MyColor.white,
      items: [
        ImageIcon(AssetImage('assets/images/bot.png'), size: 40, color: MyColor.c4),
        ImageIcon(AssetImage('assets/images/notification.png'), size: 30, color: MyColor.c4),
        Icon(Icons.person, size: 30, color: MyColor.c4),
      ],
      onTap: (index) => _onItemTapped(index),
    );
  }
}