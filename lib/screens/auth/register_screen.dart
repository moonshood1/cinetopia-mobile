import 'package:cinetopia/common/colors.dart';
import 'package:cinetopia/screens/auth/widgets/auth_header_widget.dart';
import 'package:cinetopia/screens/auth/widgets/auth_custom_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen(
      {required this.goToLogin,
      required this.goToLoginChoice,
      required this.goToOtherMethods,
      super.key});

  final void Function() goToLogin, goToLoginChoice, goToOtherMethods;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    void moveTologinScreen() {
      widget.goToLogin();
    }

    // void moveToChoiceScreen() {
    //   widget.goToLoginChoice();
    // }

    void moveToOtherMethods() {
      widget.goToOtherMethods();
    }

    MaterialColor materialColor = createMaterialColor(greenbg);

    return SafeArea(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 30,
              horizontal: MediaQuery.of(context).size.width / 15,
            ),
            child: const AuthHeaderWidget(
              text:
                  "Bienvenue dans CINETOPIA , Créez un compte pour poursuivre",
            ),
          ),
          Expanded(
            child: Theme(
              data: ThemeData(
                textTheme: GoogleFonts.montserratTextTheme(),
                primarySwatch: materialColor,
              ),
              child: Stepper(
                currentStep: index,
                type: StepperType.vertical,
                controlsBuilder:
                    (BuildContext context, ControlsDetails details) => Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: index == 0 ? details.onStepContinue : () {},
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.black,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          index == 0 ? "Étape suivante" : "S'inscrire",
                          style: const TextStyle(letterSpacing: 1),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: index > 0
                          ? TextButton.icon(
                              icon: const Icon(
                                Icons.arrow_upward,
                                color: Colors.black,
                              ),
                              label: const Text(
                                "Retour",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              onPressed: details.onStepCancel,
                            )
                          : null,
                    )
                  ],
                ),
                onStepContinue: () {
                  if (index <= 0) {
                    setState(() {
                      index += 1;
                    });
                  }
                },
                onStepCancel: () {
                  if (index > 0) {
                    setState(() {
                      index -= 1;
                    });
                  }
                },
                onStepTapped: (int index) {
                  setState(() {
                    index = index;
                  });
                },
                steps: <Step>[
                  Step(
                    isActive: index == 0,
                    // state: index >= 0 ? StepState.complete : StepState.disabled,
                    title: const Text('Identité'),
                    content: Container(
                      alignment: Alignment.center,
                      child: Column(
                        children: const <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          CustomInputWidget(
                            textLabel: "Votre nom complet",
                            isPassword: false,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomInputWidget(
                            textLabel: "Votre adresse email",
                            isPassword: false,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Step(
                    isActive: index == 1,
                    // state: index >= 1 ? StepState.complete : StepState.disabled,
                    title: const Text('Sécurité'),
                    content: Container(
                      alignment: Alignment.center,
                      child: Column(
                        children: const <Widget>[
                          CustomInputWidget(
                            textLabel: "Votre mot de passe",
                            isPassword: true,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomInputWidget(
                            textLabel: "Confirmez votre mot de passe",
                            isPassword: true,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: TextButton(
              onPressed: moveToOtherMethods,
              child: Text(
                "Autres méthodes d'inscription",
                style: TextStyle(color: greenbg),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Vous avez déjà de compte ? ",
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              TextButton(
                onPressed: moveTologinScreen,
                child: Text(
                  "Connexion",
                  style: TextStyle(color: greenbg),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
