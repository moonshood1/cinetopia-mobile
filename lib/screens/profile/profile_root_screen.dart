import 'package:cinetopia/common/colors.dart';
import 'package:cinetopia/data/articles_data.dart';
import 'package:cinetopia/widgets/cards.dart';
import 'package:cinetopia/widgets/home_custom_input.dart';
import 'package:cinetopia/widgets/home_header.dart';
import 'package:flutter/material.dart';

class ProfileRootScreen extends StatefulWidget {
  const ProfileRootScreen({super.key});

  @override
  State<ProfileRootScreen> createState() => _ProfileRootScreenState();
}

class _ProfileRootScreenState extends State<ProfileRootScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height / 20,
              horizontal: MediaQuery.of(context).size.width / 20,
            ),
            child: Column(
              children: <Widget>[
                HomeHeaderWidget(
                  text:
                      "' Le cinéma c’est un mélange parfait de vérité et de spectacle'",
                  mainColor: greenbg,
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: <Widget>[
                    ClipOval(
                      child: Image.asset(
                        'assets/images/profile_picture.jpg',
                        width: 100,
                        height: 100,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: <Widget>[
                        const Text(
                          "Louis Roger Guirika",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white,
                            side: const BorderSide(color: Colors.black),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text(
                            "Modifier le profil",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: const <Widget>[
                    Icon(Icons.person),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Informations personnelles")
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const HomeCustomInput(
                  textLabel: "Prénoms",
                  isPassword: false,
                  hasDefaultValue: true,
                  defaultValue: "Louis Roger",
                ),
                const SizedBox(
                  height: 20,
                ),
                const HomeCustomInput(
                  textLabel: "Nom",
                  isPassword: false,
                  hasDefaultValue: true,
                  defaultValue: "Guirika",
                ),
                const SizedBox(
                  height: 20,
                ),
                const HomeCustomInput(
                  textLabel: "Email",
                  isPassword: false,
                  hasDefaultValue: true,
                  defaultValue: "louisrogerguirika@gmail.com",
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: const <Widget>[
                    Icon(Icons.question_answer),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Historique de Quizz")
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Wrap(
                    direction: Axis.horizontal,
                    spacing: 20,
                    children: [
                      InlineCard(
                        article: quizz[0],
                        isQuizz: true,
                      ),
                      InlineCard(
                        article: quizz[2],
                        isQuizz: true,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: const <Widget>[
                    Icon(Icons.bookmark),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Articles sauvegardés")
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Wrap(
                    direction: Axis.horizontal,
                    spacing: 20,
                    children: [
                      InlineCard(
                        article: movies[3],
                        isQuizz: false,
                      ),
                      InlineCard(
                        article: tvShows[1],
                        isQuizz: false,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
