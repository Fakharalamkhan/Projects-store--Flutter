// ignore_for_file: unrelated_type_equality_checks, unnecessary_new, unused_import
// ignore: unnecessary_import
import 'dart:ui';
import 'package:authentication/page/cartadd.dart';
import 'package:authentication/page/wishlist_page.dart';
import 'package:flutter/material.dart';
import '../authentication.dart';
import '../data/targetpage.dart';
import '../login_view.dart';
import '/core/color.dart';
import '/categories/category_model.dart';
import '/data/proj_data.dart';
import '/data/declare.dart';
import '/page/details_page.dart';
import '/page/splash_page.dart';
// ignore: duplicate_import
import '/categories/category_model.dart';
import '/page/setting.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController controller = PageController();
  @override
  int a = 0;
  void initState() {
    controller = PageController(viewportFraction: 1, initialPage: 0);
    super.initState();
  }

  void set(int id) {
    if (id == 1) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MyStatefulWidget(
                    getitem: cpp_projects,
                  )));
    } else if (id == 2) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MyStatefulWidget(
                    getitem: flutter,
                  )));
    } else if (id == 3) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MyStatefulWidget(
                    getitem: csharpe_projects,
                  )));
    } else if (id == 4) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MyStatefulWidget(
                    getitem: Python,
                  )));
    }
  }

  late String s;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: const Text(
          "Project HUB",
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(22),
          ),
        ),
        titleSpacing: 00.0,
        centerTitle: true,
        elevation: 0,
        leadingWidth: 40,
        leading: TextButton(
          onPressed: () {},
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
                    value: 2,
                    child: Text("Logout"),
                  ),
                ];
              },
              onSelected: (value) {
                if (value == 2) {
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
              onPressed: () {},
              icon: const Icon(
                Icons.home_outlined,
                color: Colors.white,
                size: 35,
              ),
            ),
            IconButton(
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
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SplashPage()));
              },
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
              child: Row(
                children: [
                  Container(
                    height: 45.0,
                    width: 300.0,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      color: white,
                      border: Border.all(color: green),
                      boxShadow: [
                        BoxShadow(
                          color: green.withOpacity(0.15),
                          blurRadius: 10,
                          offset: const Offset(0, 0),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(
                          height: 45,
                          width: 250,
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search ',
                            ),
                          ),
                        ),
                        Image.asset(
                          'assets/icons/search.png',
                          height: 25,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 45.0,
                    width: 45.0,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      color: green,
                      boxShadow: [
                        BoxShadow(
                          color: green.withOpacity(0.5),
                          blurRadius: 10,
                          offset: const Offset(0, 0),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 35.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  for (int i = 0; i < categories.length; i++)
                    GestureDetector(
                      onTap: () => set(categories[i].id),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            categories[i].name,
                            style: TextStyle(
                              color: selectId == i
                                  ? green
                                  : black.withOpacity(0.7),
                              fontSize: 16.0,
                            ),
                          ),
                          if (selectId == i)
                            const CircleAvatar(
                              radius: 3,
                              backgroundColor: green,
                            )
                        ],
                      ),
                    )
                ],
              ),
            ),
            //Hero slider display code
            SizedBox(
              height: 320.0,
              child: PageView.builder(
                itemCount: cpp_projects.length,
                controller: controller,
                physics: const BouncingScrollPhysics(),
                padEnds: false,
                pageSnapping: true,
                onPageChanged: (value) => setState(() => activePage = value),
                itemBuilder: (itemBuilder, index) {
                  bool active = index == activePage;
                  return slider(active, index);
                },
              ),
            ),
            //custome slider display
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Latest Uploads',
                    style: TextStyle(
                      color: black.withOpacity(0.7),
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  Image.asset(
                    'assets/icons/more.png',
                    color: green,
                    height: 20,
                  ),
                ],
              ),
            ),
            //latest
            SizedBox(
              height: 130.0,
              child: ListView.builder(
                itemCount: flutter.length,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(left: 20.0),
                scrollDirection: Axis.horizontal,
                itemBuilder: (itemBuilder, index) {
                  return Container(
                    width: 200.0,
                    margin: const EdgeInsets.only(right: 20, bottom: 10),
                    decoration: BoxDecoration(
                      color: lightGreen,
                      boxShadow: [
                        BoxShadow(
                          color: green.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              flutter[index].imagePath,
                              width: 70,
                              height: 70,
                            ),
                            const SizedBox(width: 10.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  flutter[index].name,
                                  style: TextStyle(
                                    color: black.withOpacity(0.7),
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                Text(
                                  '\$${flutter[index].price.toStringAsFixed(0)}',
                                  style: TextStyle(
                                    color: black.withOpacity(0.4),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (builder) =>
                                    DetailsPage(prj: cpp_projects[index]),
                              ),
                            );
                          },
                        ),
                        Positioned(
                          right: 20,
                          bottom: 20,
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
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Projects',
                    style: TextStyle(
                      color: black.withOpacity(0.7),
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  Image.asset(
                    'assets/icons/more.png',
                    color: green,
                    height: 20,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 130.0,
              child: ListView.builder(
                itemCount: flutter.length,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(left: 20.0),
                scrollDirection: Axis.horizontal,
                itemBuilder: (itemBuilder, index) {
                  return Container(
                    width: 200.0,
                    margin: const EdgeInsets.only(right: 20, bottom: 10),
                    decoration: BoxDecoration(
                      color: lightGreen,
                      boxShadow: [
                        BoxShadow(
                          color: green.withOpacity(0.1),
                          blurRadius: 22,
                          offset: const Offset(0, 5),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              flutter[index].imagePath,
                              width: 70,
                              height: 70,
                            ),
                            const SizedBox(width: 10.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  flutter[index].name,
                                  style: TextStyle(
                                    color: black.withOpacity(0.7),
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                Text(
                                  '\$${flutter[index].price.toStringAsFixed(0)}',
                                  style: TextStyle(
                                    color: black.withOpacity(0.4),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (builder) =>
                                    DetailsPage(prj: cpp_projects[index]),
                              ),
                            );
                          },
                        ),
                        Positioned(
                          right: 20,
                          bottom: 20,
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
                      ],
                    ),
                  );
                },
              ),
            )
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
      child: maincards(index),
    );
  }

  AnimatedContainer newone(active, index) {
    double margin = active ? 20 : 30;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
      margin: EdgeInsets.all(margin),
    );
  }

  Widget maincards(index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (builder) => DetailsPage(prj: cpp_projects[index]),
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
                  image: AssetImage(cpp_projects[index].imagePath),
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
                  '${cpp_projects[index].name} - \$${cpp_projects[index].price.toStringAsFixed(0)}',
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
    if (true == cpp_projects[index].isFavorit) {
      return slider(active, index);
    }
    return newone(active, index);
  }

  Widget swipe(index) {
    int itemCount = cpp_projects.length;
    for (int i = 0; i == itemCount; i++) {
      if (categories[index] == cpp_projects[i].category) {
        slider(true, index);
      }
    }
    return newone(1, index);
  }

  int selectId = 0;
  int activePage = 0;
}
