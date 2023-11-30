import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);

    _animationController.forward();

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Navigate to the next screen or perform any necessary actions
        Get.offNamed('/onBoarding');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: _buildBackgroundGradient(),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 6,
              child: Center(
                child: ScaleTransition(
                  scale: _animation,
                  child: Image.asset(
                    'assets/Applogo/applogo.png',
                    width: 150, // Adjust the size as needed
                    height: 150,
                  ),
                ),
              ),
            ),
            SizedBox(height: 1),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // "Powered by" text
                  const Text(
                    'Powered by',
                    style: TextStyle(
                      fontSize: 16,
                    fontWeight: FontWeight.bold,
                      color: Colors.black, // Change to your text color
                    ),
                  ),
                  SizedBox(width:5),
                  // Your Logo at the bottom
                  Image.asset(
                    'assets/ServiceLogo/xonext_dark_trans.png',
                    width: 50, // Adjust the size as needed
                    height: 50,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  LinearGradient _buildBackgroundGradient() {
    return LinearGradient(
      colors: [
        Colors.grey[300]!,
        Colors.grey[400]!, // Adjust the gradient colors as needed
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
  }
}
