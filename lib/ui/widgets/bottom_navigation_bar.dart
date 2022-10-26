import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EBottomNavigationBar extends StatefulWidget {
  const EBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<EBottomNavigationBar> createState() => _EBottomNavigationBarState();
}

class _EBottomNavigationBarState extends State<EBottomNavigationBar> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black26,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      items: const [
        BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.house), label: ''),
        BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.cartArrowDown), label: ''),
        BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.heart), label: ''),
        BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.user), label: ''),
      ],
    );
  }
}

class SecondaryBottomNavigationBar extends StatefulWidget {
  const SecondaryBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<SecondaryBottomNavigationBar> createState() =>
      _SecondaryBottomNavigationBarState();
}

class _SecondaryBottomNavigationBarState
    extends State<SecondaryBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabBar(
      items: const [
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.house),
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.cartArrowDown),
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.heart),
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.user),
        ),
      ],
    );
  }
}
