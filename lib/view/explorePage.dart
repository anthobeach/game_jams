import 'package:flutter/material.dart';
import 'package:GameJams/view/Page.dart';
import 'package:flutter/widgets.dart';
import 'explSpaceTemp.dart';

class ExplorePage extends page {
  const ExplorePage({super.key});

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

//Page principale de l'explorateur
class _ExplorePageState extends pageState<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    wHeight = MediaQuery.of(context).size.height;
    wWidh = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color(0xffF3F2F8),
        body: Container(
          height: wHeight,
          width: wWidh,
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: wWidh * 0.05, vertical: wHeight * 0.02),
                child: Column(
                  children: [
                    TopArea(),
                    ExplorerSpace(),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  //Gestion de la disposition de l'espace au-dessus de l'explorateur
  Widget TopArea() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Texte d'acceuil
            fText("User", wHeight * 0.05, FontWeight.bold, Colors.black),
            fText("Game Jam File explorer", wHeight * 0.025, FontWeight.bold,
                Colors.black),
            Container(
                color: Colors.white.withOpacity(0),
                width: wWidh * 0.05,
                height: wHeight * 0.05),
            const SizedBox(width: 10),
          ],
        ),
      ],
    );
  }

  Widget ExplorerSpace() {
    return Container(
      constraints:
          BoxConstraints(maxHeight: wHeight * 0.7, maxWidth: wWidh * 0.8),
      child: ExplSpace(),
    );
  }
}
