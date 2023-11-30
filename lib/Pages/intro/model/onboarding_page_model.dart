

class OnboardingPageModel {
  final String imagePath;
  final String title;
  final String description;

  OnboardingPageModel({
    required this.imagePath,
    required this.title,
    required this.description,
  });

  static final List<OnboardingPageModel> _pages = [
    OnboardingPageModel(
      imagePath: 'assets/Onboarding/1.png',
      title: 'Page 1',
      description: 'This is the first page of the onboarding.',
    ),
    OnboardingPageModel(
      imagePath: 'assets/Onboarding/2.jpeg',
      title: 'Page 2',
      description: 'This is the second page of the onboarding.',
    ),
    /*OnboardingPageModel(
      imagePath: 'assets/Onboarding/help.jpeg',
      title: 'Page 3',
      description: 'This is the third page of the onboarding.',
    ),*/
  ];

  static List<OnboardingPageModel> get pages => _pages;
}
