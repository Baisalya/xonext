import 'dart:ui';

import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  bool _isPasswordVisible = false;
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
  // Method to build the name input field
  Widget _buildNameField(TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          "Name",
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
            controller: controller,

            style: TextStyle(
              color: Colors.black87,
              fontSize: 16.0,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 15.0),
              prefixIcon: Icon(
                Icons.person,
                color: Colors.black87,
              ),
              hintText: 'Enter your Name',

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
  // Method to build the phone number input field
  Widget _buildPhoneField(TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          "Phone Number",
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
            controller: controller,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 16.0,
            ),
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 15.0),
              prefixIcon: Icon(
                Icons.phone,
                color: Colors.black87,
              ),
              hintText: 'Enter your Phone Number',
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

  // Method to build the confirm password input field
  Widget _buildConfirmPasswordField(TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          "Confirm Password",
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
            controller: controller,
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
              hintText: 'Confirm your password',
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

  // Method to build the signup button
  Widget _buildSignupButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Implement your signup logic here
          // Example: authService.signup(nameController.text, emailController.text, phoneController.text, passwordController.text);
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
          'SIGN UP',
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
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Background image
          Image.network(
            'https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg', // Replace with your image URL
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          // Acrylic blur effect
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: Colors.white.withOpacity(0.2),
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(
              horizontal: 0.0,
              vertical: 80.0,
            ),
            child: Card(
              color: Colors.transparent,
              elevation: 5,
              margin: EdgeInsets.all(0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "Create an Account",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    _buildNameField(nameController),
                    _buildEmailField(emailController),
                    _buildPhoneField(phoneController),
                    const SizedBox(height: 1),
                    _buildPasswordField(passwordController),
                    _buildConfirmPasswordField(confirmPasswordController),
                    const SizedBox(height: 10),
                    _buildSignupButton(context),
                    const SizedBox(height: 40),
                    GestureDetector(
                      onTap: () {
                        // Navigate back to the login screen
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Already have an account? Sign in',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



