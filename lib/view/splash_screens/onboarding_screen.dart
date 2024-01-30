import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_realm/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage = 0;
  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    checkOnboardingStatus();
  }

  Future<void> checkOnboardingStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool onboardingCompleted = prefs.getBool('onboardingCompleted') ?? false;
    if (onboardingCompleted) {
      // If onboarding is completed, navigate to HomeScreen directly
      Get.offAll(const HomeScreen());
    }
  }

  Future<void> completeOnboarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboardingCompleted', true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
            controller: pageController,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            children: [
          Container(
              width: Get.width,
              height: Get.height,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/images/onboarding_images/Ice Cream.jpg'),
                      fit: BoxFit.fitHeight)),
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: Get.height * .3),
                        Text('Summer Special',
                            style: GoogleFonts.calistoga(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: Get.height * .02),
                        Text(
                            'Lose yourself in the symphony of flavors that dance on your taste buds with every spoonful of ice cream',
                            style: GoogleFonts.calistoga(
                                fontSize: 21, color: Colors.white),
                            textAlign: TextAlign.center),
                        const Spacer(),
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      pageController.animateToPage(
                                          Get.to(const HomeScreen()) as int,
                                          duration:
                                              const Duration(milliseconds: 300),
                                          curve: Curves.ease);
                                    },
                                    child: Center(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                width: 1,
                                                color: Colors.yellow)),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                          child: Text('Skip',
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  animatedRow(),
                                  GestureDetector(
                                      onTap: () {
                                        pageController.animateToPage(1,
                                            duration: const Duration(
                                                milliseconds: 500),
                                            curve: Curves.ease);
                                      },
                                      child: Center(
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Colors.yellow)),
                                              child: Padding(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                          horizontal: 10,
                                                          vertical: 5),
                                                  child: Text('Next',
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Colors
                                                                  .white))))))
                                ]))
                      ]))),
          Container(
              width: Get.width,
              height: Get.height,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/images/onboarding_images/burgers.jpg'),
                      fit: BoxFit.fitHeight)),
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: Get.height * .3),
                        Text('Fast Foods',
                            style: GoogleFonts.calistoga(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: Get.height * .02),
                        Text(
                            'Unleash the power of spices and turn every meal into a celebration of taste with our recipes being your guide',
                            style: GoogleFonts.calistoga(
                                fontSize: 20, color: Colors.white),
                            textAlign: TextAlign.center),
                        const Spacer(),
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      pageController.animateToPage(0,
                                          duration:
                                              const Duration(milliseconds: 500),
                                          curve: Curves.ease);
                                    },
                                    child: Center(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                width: 1,
                                                color: Colors.yellow)),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                          child: Text('Back',
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  animatedRow(),
                                  GestureDetector(
                                      onTap: () {
                                        pageController.animateToPage(2,
                                            duration: const Duration(
                                                milliseconds: 500),
                                            curve: Curves.ease);
                                      },
                                      child: Center(
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Colors.yellow)),
                                              child: Padding(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                          horizontal: 10,
                                                          vertical: 5),
                                                  child: Text('Next',
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Colors
                                                                  .white))))))
                                ]))
                      ]))),
          Container(
              width: Get.width,
              height: Get.height,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/images/onboarding_images/Sushi.jpg'),
                      fit: BoxFit.fill)),
              child: Center(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 42),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Dear User',
                                style: GoogleFonts.calistoga(
                                    fontSize: 30, color: Colors.white)),
                            SizedBox(height: Get.height * .02),
                            Text(
                                'We Welcome you to Recipe Kingdom – where every recipe is a new adventure in flavor!',
                                style: GoogleFonts.calistoga(
                                    fontSize: 18, color: Colors.white),
                                textAlign: TextAlign.center),
                            SizedBox(height: Get.height * .15),
                            Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppConstant.appMainColor,
                                    border: Border.all(
                                        width: 2, color: Colors.yellow)),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            AppConstant.appMainColor),
                                    onPressed: () {
                                      completeOnboarding();
                                      Get.offAll(const HomeScreen());
                                    },
                                    child: Text('Get Started',
                                        style: GoogleFonts.calistoga(
                                            fontSize: 17,
                                            color: Colors.white))))
                          ]))))
        ]));
  }

  Widget animatedRow() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      AnimatedContainer(
          width: currentPage == 0 ? 35 : 10,
          height: 10,
          decoration: BoxDecoration(
              color: currentPage == 0 ? Colors.yellow : Colors.blue,
              borderRadius: BorderRadius.circular(currentPage == 0 ? 5 : 10)),
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut),
      const SizedBox(width: 5),
      AnimatedContainer(
        width: currentPage == 1 ? 35 : 10,
        height: 10,
        decoration: BoxDecoration(
          color: currentPage == 1 ? Colors.yellow : Colors.blue,
          borderRadius: BorderRadius.circular(currentPage == 1 ? 6 : 10),
        ),
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      )
    ]);
  }
}
