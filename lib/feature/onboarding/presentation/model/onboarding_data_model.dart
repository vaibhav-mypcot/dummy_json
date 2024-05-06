class OnBoardingDataModel {
  final String assets;
  final String title1;
  final String title2;
  final String subtitle;

  OnBoardingDataModel(
      {required this.assets,
      required this.title1,
      required this.title2,
      required this.subtitle});
}

List<OnBoardingDataModel> onboardingList = [
  OnBoardingDataModel(
      assets: "assets/images/onboarding/onboarding_image_1.svg",
      title1: "Step into\nSomething",
      title2: "Extraordinary",
      subtitle:
          "Explore contests, play quizzes, and\nhave a blast with exiting rewards!"),
  OnBoardingDataModel(
      assets: "assets/images/onboarding/onboarding_image_2.svg",
      title1: "Join \nUpcoming",
      title2: "Contests",
      subtitle:
          "Participate in upcoming quizzes for\na chance to win awesome rewards"),
  OnBoardingDataModel(
      assets: "assets/images/onboarding/onboarding_image_3.svg",
      title1: "Enjoy\nInteractive",
      title2: "Quizzes",
      subtitle: "Answer entertaining questions,\nchallenge yourself!"),
  OnBoardingDataModel(
      assets: "assets/images/onboarding/onboarding_image_4.svg",
      title1: "Earn\nExciting",
      title2: "Rewards!",
      subtitle: "Win quizzes to grab fantastic rewards.\nLet’s Roll!"),
];
