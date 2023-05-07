// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import '../page/cartadd.dart';
import '../page/wishlist_page.dart';
import '/core/color.dart';
import '/data/proj_data.dart';
import '/data/declare.dart';
import '/page/details_page.dart';
import '/page/home_page.dart';
import '/page/splash_page.dart';
import '/page/setting.dart';

class MyStatefulWidget extends StatefulWidget {
  final List<Projects> getitem;
  MyStatefulWidget({required this.getitem});

  @override
  // ignore: no_logic_in_create_state
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState(getitem);
}

PageController controller = PageController();
@override
void initState() {
  PageController controller =
      PageController(viewportFraction: 0.6, initialPage: 0);
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final List<Projects> newlis;

  _MyStatefulWidgetState(this.newlis);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: const Text(
          "Pro Helper",
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(17),
          ),
        ),
        titleSpacing: 00.0,
        centerTitle: true,
        elevation: 0,
        //backgroundColor: white,
        automaticallyImplyLeading: false,
        leadingWidth: 40,
        leading: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
          child: Image.asset(
            'assets/images/home.png',
          ),
        ),

        actions: [
          PopupMenuButton(
              icon: Icon(
                Icons.menu,
                color: white,
              ),
              itemBuilder: (context) {
                return [
                  PopupMenuItem<int>(
                    value: 1,
                    child: Text("Settings"),
                  ),
                  PopupMenuItem<int>(
                    value: 2,
                    child: Text("Logout"),
                  ),
                ];
              },
              onSelected: (value) {
                if (value == 1) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => settings()));
                } else if (value == 2) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SplashPage()));
                }
              }),
        ],
      ),
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              enableFeedback: false,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              icon: const Icon(
                Icons.home_outlined,
                color: Colors.white,
                size: 35,
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartItemScreen()));
              },
              icon: const Icon(
                Icons.work_outline_outlined,
                color: Colors.white,
                size: 35,
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => favourite()));
              },
              icon: const Icon(
                Icons.hearing_outlined,
                color: Colors.white,
                size: 35,
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {},
              icon: const Icon(
                Icons.person_outline,
                color: Colors.white,
                size: 35,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 5,
              width: 8,
            ),
            Text(
              '  ${newlis[1].category} Projects',
              style: TextStyle(
                color: Color.fromARGB(255, 57, 127, 212),
                fontWeight: FontWeight.w100,
                fontSize: 34.0,
              ),
            ),
            SizedBox(
              height: 320.0,
              child: PageView.builder(
                itemCount: newlis.length,
                // controller: controller,
                physics: const BouncingScrollPhysics(),
                pageSnapping: true,
                onPageChanged: (value) => setState(() => activePage = value),
                itemBuilder: (itemBuilder, index) {
                  bool active = index == activePage;
                  return slider(active, index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer slider(active, index) {
    double margin = active ? 20 : 30;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
      margin: EdgeInsets.all(margin),
      child: mainPlantsCard(index),
    );
  }

  AnimatedContainer newone(active, index) {
    double margin = active ? 20 : 30;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
      margin: EdgeInsets.all(margin),
      // child: mainPlantsCard(index),
    );
  }

  Widget mainPlantsCard(index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (builder) => DetailsPage(prj: newlis[index]),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: white,
          boxShadow: [
            BoxShadow(
              color: black.withOpacity(0.05),
              blurRadius: 5,
              offset: const Offset(5, 5),
            ),
          ],
          border: Border.all(color: green, width: 2),
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: lightGreen,
                boxShadow: [
                  BoxShadow(
                    color: black.withOpacity(0.05),
                    blurRadius: 15,
                    offset: const Offset(5, 5),
                  ),
                ],
                borderRadius: BorderRadius.circular(25.0),
                image: DecorationImage(
                  image: AssetImage(newlis[index].imagePath),
                ),
              ),
            ),
            Positioned(
              right: 8,
              top: 8,
              child: CircleAvatar(
                backgroundColor: green,
                radius: 15,
                child: Image.asset(
                  'assets/icons/add.png',
                  color: white,
                  height: 15,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  '${newlis[index].name} - \$${newlis[index].price.toStringAsFixed(0)}',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 57, 159, 172),
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget neddd(active, index) {
    return newone(active, index);
  }

  int selectId = 0;
  int activePage = 0;
}
