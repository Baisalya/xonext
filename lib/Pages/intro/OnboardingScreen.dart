
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

import '../users/LoginScreen.dart';
import 'model/onboarding_page_model.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  bool _isLastPage = false;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page?.round() ?? 0;
        _isLastPage = _currentPage == OnboardingPageModel.pages.length - 1;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToNextPage() {
    if (_isLastPage) {
      // Perform any one-time setup here
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    } else {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     /* appBar: AppBar(
        title: Text('Onboarding'),
      ),*/
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: OnboardingPageModel.pages.length,
              itemBuilder: (context, index) {
                return OnboardingPage(
                  pageModel: OnboardingPageModel.pages[index],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  child: Text('Skip'),
                  onPressed: () {
                    // Handle skip button action here
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                ),
                DotsIndicator(
                  dotsCount: OnboardingPageModel.pages.length,
                  position: _currentPage.toDouble(),
                ),
                ElevatedButton(
                  child: Text(_isLastPage ? 'Get Started' : 'Next'),
                  onPressed: _goToNextPage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final OnboardingPageModel pageModel;

  const OnboardingPage({required this.pageModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          pageModel.imagePath,
          width: 200.0,
          height: 200.0,
        ),
        SizedBox(height: 20.0),
        Text(
          pageModel.title,
          style: TextStyle(fontSize: 24.0),
        ),
        SizedBox(height: 10.0),
        Text(
          pageModel.description,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16.0),
        ),
      ],
    );
  }
}

class DotsIndicator extends StatelessWidget {
  final int dotsCount;
  final double position;

  const DotsIndicator({
    required this.dotsCount,
    required this.position,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        dotsCount,
            (index) => _buildDot(index),
      ),
    );
  }

  Widget _buildDot(int index) {
    final double dotSize = 10.0;
    final double spacing = 5.0;

    bool isActive = index == position.round();

    return Container(
      width: dotSize,
      height: dotSize,
      margin: EdgeInsets.symmetric(horizontal: spacing),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? Colors.blue : Colors.grey,
      ),
    );
  }
}




// Implement the dots indicator widget here
// This is a custom widget to show the page indicator dots

