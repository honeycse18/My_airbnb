import 'package:airbnb_app/constants/constant.dart';
import 'package:airbnb_app/constants/images.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/pages/home/home.dart';
import 'package:airbnb_app/pages/home/more.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeNavigatorController extends GetxController {
  int myIndex = 0;

  final List<Widget> bottomBarPages = [
    const HomeView(),
    const HomeView(),
    const HomeView(),
    const MoreView(),
    const MoreView(),
  ];
}

class HomeNavigatorView extends StatelessWidget {
  const HomeNavigatorView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeNavigatorController>(
      init: HomeNavigatorController(),
      builder: (controller) {
        return Scaffold(
          body: IndexedStack(
            index: controller.myIndex,
            children: controller.bottomBarPages,
          ),
          bottomNavigationBar: BottomNavigationBar(
            type:
                BottomNavigationBarType.fixed, // Ensure labels are always shown
            currentIndex: controller.myIndex,
            onTap: (index) {
              controller.myIndex = index;
              controller.update();
            },
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.search_sharp),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border),
                label: 'Wishlist',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.trip_origin),
                label: 'Trips',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.message),
                label: 'Message',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }
}
