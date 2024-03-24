import 'package:flutter/material.dart';
import 'package:GameJams/view/explorePage.dart';
import 'package:GameJams/view/otherPage.dart';

class page extends StatefulWidget {
  const page({super.key});

  @override
  State<page> createState() => pageState();
}

class pageState<T extends page> extends State<page> {
  late double wHeight = 0;
  late double wWidh = 0;
  //Sélecteur de la page actuelle
  int index = 0;
  static List<Widget> pages = [
    ExplorePage(),
    OtherPage(),
    OtherPage(),
    OtherPage()
  ];
  @override
  Widget build(BuildContext context) {
    wHeight = MediaQuery.of(context).size.height;
    wWidh = MediaQuery.of(context).size.width;
    return const Placeholder();
  }

  // Fonction d'affichage personnalisé du texte
  Widget fText(String text, double size, FontWeight weight, Color color) {
    return Text(text,
        style: TextStyle(fontSize: size, fontWeight: weight, color: color));
  }

  //Création d'un bouton
  Widget configActionButton() {
    return Container(
      height: wHeight * 0.06,
      width: wWidh * 0.13,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xffBFE2FE), Color(0xff2C7DDD)]),
          borderRadius: BorderRadius.circular(15)),
      child: Center(
        //L'ic^one du bouton
        child: Image.asset(
          './assets/images/arrow.png',
          color: Colors.white,
          height: wHeight * 0.025,
        ),
      ),
    );
  }

  // L'affichage d'un icone cliquable
  Widget PageSwitcher(int MyIndex, String name, String image) {
    return InkWell(
      //Action lors d'un clic :
      onTap: () {
        setState(() {
          //On change l'index et donc la page au clic
          index = MyIndex;
        });
      },
      child: index == MyIndex
          ? Column(
              //On centre nos icones
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Texte descriptif
                fText(
                    name, wHeight * 0.018, FontWeight.bold, Color(0xff4888C5)),
                SizedBox(height: wHeight * 0.005),
                CircleAvatar(
                  radius: wHeight * 0.004,
                  backgroundColor: Color(0xff4888C5),
                )
              ],
            )
          :
          //Icone
          Image.asset(
              image,
              height: wHeight * 0.025,
              color: Color(0xff4888C5),
            ),
    );
  }
}
