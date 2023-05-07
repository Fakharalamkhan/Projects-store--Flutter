import 'package:authentication/page/home_page.dart';
import 'package:flutter/material.dart';

import 'cartadd.dart';
import 'splash_page.dart';

class fav_item {
  String Image;
  String Name;
  int Price;

  fav_item(this.Image, this.Name, this.Price);
}

List<fav_item> wishlist = [];

class favourite extends StatefulWidget {
  favourite({Key? key}) : super(key: key);

  @override
  State<favourite> createState() => fav_screen();
}

int pay() {
  int k, t = 0;
  // for (int i = 0; i <= cartitemlist.length; i++) {
  //   k = cartitemlist[i].Price;
  //   t = t + k;
  // }
  return 234;
}

class fav_screen extends State<favourite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Wishlist ",
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(22),
            ),
          ),
          titleSpacing: 00.0,
          centerTitle: true,
          elevation: 0,
          automaticallyImplyLeading: false,
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
                  color: Colors.white,
                ),
                itemBuilder: (context) {
                  return [
                    PopupMenuItem<int>(
                      value: 1,
                      child: Text(" Home"),
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
                        MaterialPageRoute(builder: (context) => HomePage()));
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CartItemScreen()));
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
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (wishlist.isEmpty)
                  const Center(
                      child: Text(
                    '\n\n Your wishlist is Empty',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  ))
                else
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 8.0),
                      shrinkWrap: true,
                      itemCount: wishlist.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.blueGrey.shade200,
                          elevation: 5.0,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Image(
                                  height: 80,
                                  width: 80,
                                  image: AssetImage(wishlist[index].Image),
                                ),
                                SizedBox(
                                  width: 130,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 5.0,
                                      ),
                                      RichText(
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        text: TextSpan(
                                            text: 'Name: ',
                                            style: TextStyle(
                                                color: Colors.blueGrey.shade800,
                                                fontSize: 16.0),
                                            children: [
                                              TextSpan(
                                                  text:
                                                      '${wishlist[index].Name}\n',
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ]),
                                      ),
                                      RichText(
                                        maxLines: 1,
                                        text: TextSpan(
                                            text: 'Unit: ',
                                            style: TextStyle(
                                                color: Colors.blueGrey.shade800,
                                                fontSize: 16.0),
                                            children: [
                                              TextSpan(
                                                  text: '1 \n',
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ]),
                                      ),
                                      RichText(
                                        maxLines: 1,
                                        text: TextSpan(
                                            text: 'Price: ' r"$",
                                            style: TextStyle(
                                                color: Colors.blueGrey.shade800,
                                                fontSize: 16.0),
                                            children: [
                                              TextSpan(
                                                  text:
                                                      '${wishlist[index].Price}\n',
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ]),
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      wishlist.removeAt(index);
                                      setState(() {});
                                    },
                                    icon: Icon(Icons.delete))
                              ],
                            ),
                          ),
                        );
                      })
              ],
            )));
  }
}
