import 'package:apex_logistics/components/defaultButton.dart';
import 'package:apex_logistics/components/defaultText.dart';
import 'package:apex_logistics/controllers/onboard_controller.dart';
import 'package:apex_logistics/main.dart';
import 'package:apex_logistics/routes/routes.dart';
import 'package:apex_logistics/utils/constant.dart';
import 'package:apex_logistics/views/onboarding/onboardingItems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatelessWidget {
  Onboarding({super.key});

  final controller = OnboardingItems();
  final PageController pageController = PageController();

  final xController = Get.put(OnboardController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return PageView.builder(
      onPageChanged: (index) =>
          xController.isLastPage.value = controller.items.length - 1 == index,
      controller: pageController,
      itemCount: controller.items.length,
      itemBuilder: (context, index) {
        return Scaffold(
          backgroundColor: Constants.whiteLight,
          body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image
                // const Expanded(child: SizedBox()),
                Flexible(
                  flex: 10,
                  child: Lottie.asset(
                    controller.items[index].image,
                    width: 500,
                    height: 400,
                  ),
                ),
                // const SizedBox(height: 30.0),
                // Text
                DefaultText(
                  text: controller.items[index].title,
                  weight: FontWeight.bold,
                  size: 25.0,
                ),
                const SizedBox(height: 30.0),
                // Description
                DefaultText(
                  text: controller.items[index].desc,
                  align: TextAlign.center,
                  size: 16.0,
                ),
                const SizedBox(height: 50.0),
                // Indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: SmoothPageIndicator(
                          controller: pageController,
                          count: controller.items.length,
                          onDotClicked: (index) => pageController.animateToPage(
                              index,
                              duration: const Duration(milliseconds: 600),
                              curve: Curves.easeIn),
                          effect: const ExpandingDotsEffect(
                            dotHeight: 10,
                            dotWidth: 12,
                            activeDotColor: Constants.primaryNormal,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                const Expanded(
                  child: SizedBox(),
                ),
                Flexible(
                  flex: 2,
                  child: Container(
                    color: Constants.whiteLight,
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                      bottom: 20.0,
                    ),
                    width: size.width,
                    child: DefaultButton(
                      child: const DefaultText(
                        text: "Get Started",
                        size: 20.0,
                        fontColor: Constants.whiteLight,
                      ),
                      onPressed: () async {
                        sharedPreferences.setBool("onboard", true);
                        Get.offAndToNamed(Routes.signIn);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          // bottomSheet: Container(
          //   color: Constants.whiteLight,
          //   padding:
          //       const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 30.0),
          //   width: size.width,
          //   child: DefaultButton(
          //     child: const DefaultText(
          //       text: "Get Started",
          //       size: 18.0,
          //       fontColor: Constants.whiteLight,
          //     ),
          //     onPressed: () async {
          //       sharedPreferences.setBool("onboard", true);
          //       Get.offAndToNamed(Routes.signIn);
          //     },
          //   ),
          // ),
        );
      },
    );
  }
}
