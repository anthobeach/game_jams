import 'package:GameJams/view/explorePage.dart';
import 'package:GameJams/view/otherPage.dart';
import 'package:GameJams/view/jamPage.dart';
import 'package:GameJams/view/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:GameJams/view/Page.dart';

class MainInterface extends page {
  const MainInterface({super.key});

  @override
  _MainInterfaceState createState() => _MainInterfaceState();
}

class _MainInterfaceState extends pageState<MainInterface> {
  //Liste des différentes pages possibles
  static List<Widget> pages = [
    ExplorePage(),
    JamPage(),
    LoginPage(),
    OtherPage()
  ];
  @override
  //Construction de la page principale
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      //On affiche au milieu la page à afficher
      body: pages.elementAt(index),
      //et en bas la barre de navigation
      bottomNavigationBar: NavBarLayout(),
    ));
  }

  //Affichage de la barre du bas de l'application
  Widget NavBarLayout() {
    //Récupération de la taille de la fenêtre
    //La portion de l'écran occupée par la barre
    double BarPortion = 0.08;
    return Container(
        padding: EdgeInsets.symmetric(horizontal: wWidh * 0.05),
        height: wHeight * BarPortion,
        color: Colors.white,
        child: Row(
          //on ajoute un écart entre les icones
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //On affiche les icones
          //Appuyer sur une icone chance la page
          children: [
            PageSwitcher(1, 'Home Page', './assets/images/gamejam.png'),
            PageSwitcher(0, 'File Explorer', './assets/images/folder.png'),
            SizedBox(
              width: wWidh * 0.05,
            ),
            PageSwitcher(2, 'Login page', './assets/images/login.png'),
            PageSwitcher(3, 'Settings', './assets/images/3dots.png')
          ],
        ));
  }
}
