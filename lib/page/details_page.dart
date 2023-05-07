import 'package:authentication/page/wishlist_page.dart';
import 'package:flutter/material.dart';
import '/core/color.dart';
import 'dart:io';
import '/data/declare.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'wishlist_page.dart';
import 'cartadd.dart';

class DetailsPage extends StatelessWidget {
  final Projects prj;

  const DetailsPage({Key? key, required this.prj}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: height / 2,
                  decoration: BoxDecoration(
                    color: lightGreen,
                    boxShadow: [
                      BoxShadow(
                        color: green.withOpacity(0.2),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ],
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(60),
                      bottomRight: Radius.circular(60),
                    ),
                    image: DecorationImage(
                      image: AssetImage(prj.imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: prj.name,
                                  style: TextStyle(
                                    color: black.withOpacity(0.8),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      RichText(
                        text: TextSpan(
                          text: prj.description,
                          style: TextStyle(
                            color: black.withOpacity(0.5),
                            fontSize: 15.0,
                            height: 1.4,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Container(
                        child: Text(
                          'Download able',
                          style: TextStyle(
                            color: black.withOpacity(0.9),
                            fontSize: 18.0,
                            height: 1.4,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 12,
                    ),
                    Container(
                        child: IconButton(
                            icon: const Icon(Icons.favorite),
                            color: Colors.red,
                            iconSize: 27,
                            onPressed: () {
                              wishlist.add(fav_item(
                                  prj.imagePath, prj.name, prj.price.toInt()));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text('Added to wishlist'),
                                duration: Duration(seconds: 2),
                              ));
                            })),
                    Container(
                      child: IconButton(
                          onPressed: () {
                            cartitemlist.add(CartItem(
                                prj.imagePath, prj.name, prj.price.toInt()));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Added to cart'),
                              duration: Duration(seconds: 2),
                            ));
                          },
                          icon: Icon(Icons.add_alert)),
                    ),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () async {},
                  icon: const Icon(Icons.arrow_back),
                ),
                Image.asset('assets/icons/cart.png',
                    color: black, height: 40.0),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 50.0, vertical: 15.0),
                decoration: BoxDecoration(
                  color: green,
                  boxShadow: [
                    BoxShadow(
                      color: green.withOpacity(0.3),
                      blurRadius: 15,
                      offset: const Offset(0, -5),
                    ),
                  ],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(60),
                  ),
                ),
                child: Text(
                  'Price \$${prj.price.toStringAsFixed(0)}',
                  style: TextStyle(
                    color: white.withOpacity(0.9),
                    fontSize: 18.0,
                    height: 1.4,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  getApplicationDocumentsDirectory() {}
}
