import '../authentication.dart';
import '../login_view.dart';
import '/page/home_page.dart';
import '/page/wishlist_page.dart';
import 'package:flutter/material.dart';
import '/core/color.dart';

import '/page/splash_page.dart';

void main() => runApp(settings());

class settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              MaterialPageRoute(builder: (context) => favourite()),
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
                  onPressed:
                  () {
                    AuthenticationHelper()
                        .signOut()
                        .then((_) => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (contex) => Login()),
                            ));
                  };
                }
              }),
        ],
      ),
      body: Center(
        child: Text(
          'This is setting screen',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22, color: Colors.blueAccent),
        ),
      ),
    );
  }
}
