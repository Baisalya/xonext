import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  PageController _pageController = PageController();
  // Method to build the email input field
  Widget _buildEmailField(TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          "Email",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10.0),
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
            controller: emailController,
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
        const SizedBox(height: 30.0),
      ],
    );
  }

  // Method to build the password input field
  Widget _buildPasswordField(TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          "Password",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10.0),
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
            obscureText: !_isPasswordVisible,
            controller: passwordController,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 16.0,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 15.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.black87,
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
                child: Icon(
                  _isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: Colors.black87,
                ),
              ),
              hintText: 'Enter your password',
              hintStyle: TextStyle(
                color: Colors.black38,
                fontFamily: 'OpenSans',
                fontSize: 16.0,
              ),
            ),
          ),
        ),
        const SizedBox(height: 30.0),
      ],
    );
  }

  // Method to build the login button
  Widget _buildLoginButton(BuildContext context, ) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton(

        onPressed: () {
       /*   viewModel.login(
            emailController.text,
            passwordController.text,
          );*/
        },

        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          elevation: 5.0,
          padding: const EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        child: const Text(
          'SIGN IN',
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

  @override
  Widget build(BuildContext context) {
    //final viewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Background image
          Image.network(
            'https://www.imageshine.in/uploads/gallery/Road-with-Sky-wallpaper-for-editing.jpg', // Replace with your image URL
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),

          // Acrylic blur effect
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Adjust the blur values as needed
            child: Container(
              color: Colors.white.withOpacity(0.2), // Adjust the opacity as needed
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          /*Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF4E96E0),
                  Color(0xFF2976C6),
                  Color(0xFF15549A),
                  Color(0xFF0D3E6D),
                ],
                stops: [0.1, 0.4, 0.7, 0.9],
              ),
            ),
          ),*/
          SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(
              horizontal: 40.0,
              vertical: 120.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "Welcome Back",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                const Text(
                  "Sign in to continue",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 30),
                _buildEmailField(emailController),
                SizedBox(height: 20),
                _buildPasswordField(passwordController),
                Container(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Get.toNamed('/signup');
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                _buildLoginButton(context,),
                SizedBox(height: 30),
                const Text(
                  'Or Sign in with',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  /*  _buildSocialButton(
                      onTap: () {
                        // Handle Facebook sign in
                      },
                      imageAsset: 'assets/facebook.png',
                    ),
                    SizedBox(width: 40),*/
                    _buildSocialButton(
                      onTap: () {
                        // Handle Google sign in
                      },
                      imageAsset: 'assets/google.png',
                    ),
                  ],
                ),
                SizedBox(height: 40),
                GestureDetector(
                  onTap: () {
                    // Handle sign up
                    Get.offNamed('/home');
                  },
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16.0,
                          ),
                        ),
                        TextSpan(
                          text: "Sign up",
                          style: TextStyle(
                            color: Colors.white,
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
        ],
      ),
    );
  }

  Widget _buildSocialButton({VoidCallback? onTap, required String imageAsset}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: AssetImage(imageAsset),
          ),
        ),
      ),
    );
  }

}
