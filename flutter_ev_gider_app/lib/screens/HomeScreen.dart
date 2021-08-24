import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ev_gider_app/CustomWidgets/NawigationDrawerWidget.dart';
import 'package:flutter_ev_gider_app/CustomWidgets/customAppBar.dart';
import 'package:flutter_ev_gider_app/CustomWidgets/customHomeCard.dart';
import 'package:flutter_ev_gider_app/CustomWidgets/customPieChart.dart';
import 'package:flutter_ev_gider_app/constants/const.dart';
import 'package:flutter_ev_gider_app/screens/expensesScreen.dart';
import 'package:flutter_svg/flutter_svg.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldkey,
      backgroundColor: CHomeBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(),
            CustomPieChart(size: size),
            CustomHomeCard(
              size: size,
              image: "assets/images/alisverisAraba.svg",
              name: "İhtiyaçlarım",
              press: () {},
            ),
            CustomHomeCard(
              size: size,
              image: "assets/images/cards.svg",
              name: "Harcamalar",
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ExpensesPage()));
              },
            ),
          ],
        ),
      ),
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15, top: 5),
            child: SvgPicture.asset(
              "assets/images/boss.svg",
              width: 35,
            ),
          ),
        ],
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.menu_open),
          onPressed: () {
            scaffoldkey.currentState!.openDrawer();
          },
        ),
        elevation: 0,
        backgroundColor: CAppBar,
      ),
    );
  }

  Future<void> cikisYap() async {
    await _auth.signOut().then((value) {
      Navigator.pop(context);
    });
  }
}
