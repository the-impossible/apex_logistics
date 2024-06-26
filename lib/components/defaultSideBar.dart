import 'package:apex_logistics/components/defaultButton.dart';
import 'package:apex_logistics/components/defaultDrawerItems.dart';
import 'package:apex_logistics/components/defaultText.dart';
import 'package:apex_logistics/routes/routes.dart';
import 'package:apex_logistics/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DefaultSideBar extends StatelessWidget {
  const DefaultSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Drawer(
      backgroundColor: Constants.whiteNormal,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // SIDEBAR: Top-Section
          Container(
            width: size.width,
            height: size.height * 0.2,
            padding: const EdgeInsets.only(
              top: 100,
              left: 20,
              bottom: 50,
            ),
            decoration: const BoxDecoration(
              color: Constants.whiteLight,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  child: ClipOval(
                    child: Image.asset(
                      "assets/images/rider.jpg",
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 30),
                const DefaultText(
                  text: "Profile",
                  size: 18,
                  weight: FontWeight.bold,
                ),
              ],
            ),
          ),

          // SIDEBAR: Middle Section
          Container(
            width: size.width,
            height: size.height * 0.3,
            decoration: const BoxDecoration(
              color: Constants.whiteLight,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Wrap(
              children: [
                DefaultDrawerItems(
                  icon: Icons.account_balance_wallet,
                  text: "Payment",
                  onTap: () {},
                ),
                DefaultDrawerItems(
                  icon: Icons.delivery_dining_rounded,
                  text: "My ride",
                  onTap: () => {
                    Navigator.pop(context),
                    Get.toNamed(Routes.myRide),
                  },
                ),
                DefaultDrawerItems(
                  icon: Icons.badge,
                  text: "About Us",
                  onTap: () {},
                ),
              ],
            ),
          ),

          // SIDEBAR: Bottom Section
          Container(
            width: size.width,
            height: size.height * 0.48,
            padding: const EdgeInsets.only(
              top: 100,
              left: 20,
              bottom: 50,
            ),
            decoration: const BoxDecoration(
              color: Constants.whiteLight,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  DefaultButton(
                    onPressed: () {},
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DefaultText(
                          text: "Become a Rider",
                          fontColor: Constants.whiteNormal,
                          size: 18,
                        ),
                        SizedBox(width: 20),
                        Icon(Icons.delivery_dining_outlined),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
