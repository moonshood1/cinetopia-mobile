import 'package:cinetopia/common/colors.dart';
import 'package:flutter/material.dart';

class HomeBottomBar extends StatefulWidget {
  const HomeBottomBar(
      {required this.currentIndex, required this.onItemTapped, super.key});

  final int currentIndex;
  final Function(int) onItemTapped;

  @override
  State<HomeBottomBar> createState() => _HomeBottomBarState();
}

class _HomeBottomBarState extends State<HomeBottomBar> {
  Color _selectedBg = greenbg;

  @override
  Widget build(BuildContext context) {
    switch (widget.currentIndex) {
      case 1:
        _selectedBg = moviebg;
        break;
      case 2:
        _selectedBg = tvbg;
        break;
      case 3:
        _selectedBg = quizzbg;
        break;
      default:
        _selectedBg = greenbg;
    }

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      unselectedFontSize: 10,
      selectedFontSize: 10,
      selectedItemColor: Colors.black,
      selectedIconTheme: IconThemeData(color: _selectedBg),
      unselectedItemColor: const Color.fromARGB(170, 0, 0, 0),
      iconSize: 28,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Accueil",
          backgroundColor: Colors.white,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.movie),
          label: "Films",
          backgroundColor: Colors.white,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.tv),
          label: "Séries",
          backgroundColor: Colors.white,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.quiz),
          label: "Quizz",
          backgroundColor: Colors.white,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Compte",
          backgroundColor: Colors.white,
        )
      ],
      currentIndex: widget.currentIndex,
      onTap: widget.onItemTapped,
    );
  }
}
