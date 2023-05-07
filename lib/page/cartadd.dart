import 'package:flutter/material.dart';

import 'splash_page.dart';

class CartItem {
  String Image;
  String Name;
  int Price;

  CartItem(this.Image, this.Name, this.Price);
}

List<CartItem> cartitemlist = [];

class CartItemScreen extends StatefulWidget {
  CartItemScreen({Key? key}) : super(key: key);

  @override
  State<CartItemScreen> createState() => _CartItemScreenState();
}

int pay() {
  int k, t = 0;
  // for (int i = 0; i <= cartitemlist.length; i++) {
  //   k = cartitemlist[i].Price;
  //   t = t + k;
  // }
  return 234;
}

class _CartItemScreenState extends State<CartItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Cart Page",
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CartItemScreen()));
                  } else if (value == 2) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SplashPage()));
                  }
                }),
          ],
        ),
        bottomNavigationBar: InkWell(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Payment Successful'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            child: Row(children: <Widget>[
              Container(
                color: Color.fromARGB(255, 0, 255, 208),
                alignment: Alignment.center,
                height: 50.0,
                width: 188,
                child: Text(pay().toString() + '-Rs',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Container(
                color: Colors.yellow.shade600,
                alignment: Alignment.center,
                height: 50.0,
                width: 222,
                child: const Text(
                  'Proceed to Pay',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ])),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (cartitemlist.isEmpty)
                  const Center(
                      child: Text(
                    '\n\n Your Cart is Empty',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  ))
                else
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 8.0),
                      shrinkWrap: true,
                      itemCount: cartitemlist.length,
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
                                  image: AssetImage(cartitemlist[index].Image),
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
                                                      '${cartitemlist[index].Name}\n',
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
                                                      '${cartitemlist[index].Price}\n',
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
                                      cartitemlist.add(cartitemlist[index]);
                                      setState(() {});
                                    },
                                    icon: Icon(Icons.hdr_plus)),
                                IconButton(
                                    onPressed: () {
                                      cartitemlist.removeAt(index);
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
