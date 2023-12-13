import 'package:cinetopia/common/colors.dart';
import 'package:cinetopia/screens/home/home_screen.dart';
import 'package:cinetopia/widgets/home_app_bar.dart';
import 'package:cinetopia/widgets/home_navigation_bar.dart';
import 'package:cinetopia/screens/movies/movie_root_screen.dart';
import 'package:cinetopia/screens/profile/profile_root_screen.dart';
import 'package:cinetopia/screens/tvshows/tv_show_root_screen.dart';
import 'package:cinetopia/screens/quizz/quizz_root_screen.dart';
import 'package:flutter/material.dart';

class HomeRootScreen extends StatefulWidget {
  const HomeRootScreen({super.key});

  @override
  State<HomeRootScreen> createState() => _HomeRootScreenState();
}

class _HomeRootScreenState extends State<HomeRootScreen> {
  var activeScreen = 0;
  var screenTitle = "A La une ";
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      activeScreen = index;
    });
  }

  void goToMovieScreen() {
    setState(() {
      activeScreen = 1;
      screenTitle = "Films";
      _selectedIndex = 1;
    });
  }

  void goToTvScreen() {
    setState(() {
      activeScreen = 2;
      screenTitle = "Séries";
      _selectedIndex = 2;
    });
  }

  void goToQuizzScreen() {
    setState(() {
      activeScreen = 3;
      screenTitle = "Quizz";
      _selectedIndex = 3;
    });
  }

  void goToAccountScreen() {
    setState(() {
      activeScreen = 4;
      screenTitle = "Compte";
      _selectedIndex = 41;
    });
  }

  void goToHomeScreen() {
    setState(() {
      activeScreen = 0;
      screenTitle = "A La une ";
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget;
    String screenTitle;
    Color headerColor = headerbg;
    bool withFilter = false;
    // bool isExpand = activeScreen == 0 ? true : false;

    switch (activeScreen) {
      case 1:
        screenWidget = const MovieRootScreen();
        screenTitle = "Films";
        headerColor = moviebg;
        withFilter = true;
        break;
      case 2:
        screenWidget = const TvRootScreen();
        screenTitle = "Séries";
        headerColor = tvbg;
        withFilter = true;
        break;
      case 3:
        screenWidget = const QuizzRootScreen();
        screenTitle = "Quizz";
        headerColor = quizzbg;
        withFilter = true;
        break;
      case 4:
        screenWidget = const ProfileRootScreen();
        screenTitle = "Compte";
        break;
      default:
        screenWidget = HomeScreen(
          goToMovies: goToMovieScreen,
          goToTvs: goToTvScreen,
          goToQuizz: goToQuizzScreen,
        );
        screenTitle = "A La une ";
    }

    return Scaffold(
      appBar: HomeAppBar(
        title: screenTitle,
        backFunction: () {},
        basicColor: headerColor,
        isExpandable: false,
        hasFilter: withFilter,
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: screenWidget,
      ),
      bottomNavigationBar: HomeBottomBar(
        currentIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
