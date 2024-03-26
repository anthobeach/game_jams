import 'package:GameJams/view/explorePage.dart';
import 'package:GameJams/view/eventsPage.dart';
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
    JamPage(),
    ExplorePage(),
    LoginPage(),
    EventPage()
  ];
  @override
  //Construction de la page principale
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      //On affiche au milieu la page à afficher
      body: pages.elementAt(index),
      //et en bas la barre de navigation
      bottomNavigationBar: NavBarLayout(context),
    ));
  }

  //Affichage de la barre du bas de l'application
  Widget NavBarLayout(BuildContext context) {
    //Récupération de la taille de la fenêtre
    //La portion de l'écran occupée par la barre
    double wWidh = MediaQuery.of(context).size.width;
    double wHeight = MediaQuery.of(context).size.height;
    double BarPortion = 0.08;
    return Container(
        padding: EdgeInsets.symmetric(horizontal: wWidh * 0.05),
        height: wHeight * BarPortion,
        color: const Color.fromRGBO(142, 164, 204, 0.25),
        child: Row(
          //on ajoute un écart entre les icones
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //On affiche les icones
          //Appuyer sur une icone chance la page
          children: [
            pageSwitcher(wWidh,wHeight,0, 'Home Page', 'assets/images/gamejam.png'),
            pageSwitcher(wWidh,wHeight,1, 'File Explorer', 'assets/images/folder.png'),
            pageSwitcher(wWidh,wHeight,2, 'Login page', 'assets/images/login.png'),
            pageSwitcher(wWidh,wHeight,3, 'Events', 'assets/images/events.png')
          ],
        ));
  }
}
