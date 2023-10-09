

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
      imagePath: 'https://www.ecolemondiale.org/storage/uploads/Customer-service_1651743662.png',
      title: 'Page 1',
      description: 'This is the first page of the onboarding.',
    ),
    OnboardingPageModel(
      imagePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCyyKKpPJRu0FA9Nzqk37da6SG8i_khxLnAQ&usqp=CAU',
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
