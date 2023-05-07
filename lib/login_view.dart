import 'package:flutter/material.dart';
import 'authentication.dart';
import 'page/home_page.dart';
import 'singup.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: <Widget>[
          SizedBox(height: 55),
          Column(
            children: [
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
                height: 322,
                width: 222,
                child: Image.asset('assets/images/Asset1.png'),
              ),
            ],
          ),
          SizedBox(
            height: 11,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: LoginForm(),
          ),
          SizedBox(height: 13),
          Row(
            children: <Widget>[
              SizedBox(width: 30),
              Text('            Want new account?',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Signup()));
                },
                child: Text('  :)',
                    style: TextStyle(fontSize: 20, color: Colors.blue)),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  LoginForm({Key? key}) : super(key: key);

  @override
  bool debugShowCheckedModeBanner = false;
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          // email
          TextFormField(
            // initialValue: 'Input text',
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.email_outlined),
              labelText: 'Email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  const Radius.circular(100.0),
                ),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            onSaved: (val) {
              email = val;
            },
          ),
          SizedBox(
            height: 20,
          ),
          // password
          TextFormField(
            // initialValue: 'Input text',
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(Icons.lock_outline),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  const Radius.circular(100.0),
                ),
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ),
            obscureText: _obscureText,
            onSaved: (val) {
              password = val;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          SizedBox(height: 30),
          SizedBox(
            height: 54,
            width: 184,
            child: ElevatedButton(
              onPressed: () {
                // Navigator.pushReplacement(context,
                //     MaterialPageRoute(builder: (context) => HomePage()));
                //Respond to button press
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  AuthenticationHelper()
                      .signIn(email: email!, password: password!)
                      .then((result) {
                    if (result == null) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          result,
                          style: TextStyle(fontSize: 16),
                        ),
                      ));
                    }
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24.0)))),
              child: Text(
                'Login',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
