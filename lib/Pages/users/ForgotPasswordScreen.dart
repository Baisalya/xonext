import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class ForotPasswordScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.network(
            'https://www.imageshine.in/uploads/gallery/Road-with-Sky-wallpaper-for-editing.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: Colors.white.withOpacity(0.2),
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          Center(
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 80.0),
              child: Card(
                color: Colors.white.withOpacity(0.5),
                elevation: 5,
                margin: EdgeInsets.all(0),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Reset Your Password",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 36.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Please enter your email address to reset your password.",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 18.0,
                        ),
                      ),
                      SizedBox(height: 10),
                      _buildEmailField(emailController),
                      SizedBox(height: 10),
                      _buildResetButton(context),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          // Handle sign up
                          Get.offNamed('/login');
                        },
                        child: RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: "Want to proceed with your old password? ",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 16.0,
                                ),
                              ),
                              TextSpan(
                                text: "Log In",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmailField(TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Email",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 2),
                blurRadius: 4.0,
              ),
            ],
          ),
          height: 60.0,
          child: TextField(
            controller: controller,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 16.0,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 15.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.black87,
              ),
              hintText: 'Enter your Email',
              hintStyle: TextStyle(
                color: Colors.black38,
                fontFamily: 'OpenSans',
                fontSize: 16.0,
              ),
            ),
          ),
        ),
        SizedBox(height: 30.0),
      ],
    );
  }

  Widget _buildResetButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Add your password reset logic here
          // You can use the email entered in 'emailController'
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          elevation: 5.0,
          padding: EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        child: Text(
          'Get Verification Code',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }
}



