// ignore_for_file: prefer_const_constructors

import 'package:authentication/page/home_page.dart';
import 'package:flutter/material.dart';
import '/core/color.dart';
import 'package:authentication/login_view.dart';
import 'package:authentication/singup.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 12,
              width: 17,
            ),
            Container(
              height: 40.0,
              width: 40.0,
              margin: const EdgeInsets.only(
                  right: 144, top: 80, left: 323, bottom: 25),
            ),
            const Text(
              'PROJECT HUB',
              style: TextStyle(
                  fontSize: 32.0,
                  letterSpacing: 1.8,
                  fontWeight: FontWeight.w900,
                  color: Color.fromARGB(255, 195, 177, 16)),
            ),
            const SizedBox(height: 5),
            const Text(
              '"We will help you in the hard time of your semester"',
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 9,
                fontStyle: FontStyle.normal,
                letterSpacing: 1.8,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 22,
              width: 12,
            ),
            SizedBox(
              height: 233,
              width: 238,
              child: Image.asset('assets/images/Asset1.png'),
            ),
            const SizedBox(height: 25),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (builder) => Login()));
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 80.0,
                  vertical: 12.0,
                ),
                decoration: BoxDecoration(
                  color: green,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                    color: white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (builder) => Signup()));
              },
              child: Text(
                'Create an account',
                style: TextStyle(
                  color: black.withOpacity(0.7),
                  fontSize: 16,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                  color: black.withOpacity(0.4),
                  letterSpacing: 1,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
