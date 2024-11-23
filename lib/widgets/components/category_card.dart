import 'package:airbnb_app/models/api_responses/property_item.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryCardController extends GetxController {
  final imageController = PageController();
  var currentPage = 0;

  @override
  void dispose() {
    imageController.dispose();
    super.dispose();
  }
}

class CategoryCard extends StatelessWidget {
  final PropertyItems category;
  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder<CategoryCardController>(
        init: CategoryCardController(),
        global: false,
        builder: (controller) => GestureDetector(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          clipBehavior: Clip.antiAlias,
                          width: size.width,
                          height: size.width - 32.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: PageView(
                            allowImplicitScrolling: true,
                            controller: controller.imageController,
                            onPageChanged: (value) {
                              controller.currentPage = value;
                              controller.update();
                            },
                            children: category.images.map((imageUrl) {
                              return Image.network(
                                  'https://backend.airbnb.appstick.com.bd/assets/$imageUrl',
                                  fit: BoxFit.cover);
                            }).toList(),
                          ),
                        ),
                        // Positioned(
                        //   bottom: 8.0,
                        //   left: 0.0,
                        //   right: 0.0,
                        //   child: DotsIndicator(
                        //     dotsCount: category.images.length,
                        //     position: controller.currentPage,
                        //     onTap: (index) {
                        //       controller.imageController.animateToPage(
                        //         index,
                        //         duration: const Duration(milliseconds: 300),
                        //         curve: Curves.easeIn,
                        //       );
                        //     },
                        //     decorator: DotsDecorator(
                        //       color: Colors.grey.withOpacity(0.5),
                        //       activeColor: Colors.white.withOpacity(0.9),
                        //       size: const Size.square(8.0),
                        //       activeSize: const Size(8.0, 8.0),
                        //       activeShape: RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.circular(12.0),
                        //       ),
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            category.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          /* const SizedBox(height: 0.0),
                          Text(
                              '${category.location.country}, ${category.location.city}',
                              style: TextStyle(
                                  color: Colors.grey[500],
                                  fontWeight: FontWeight.w500)), */
                          const SizedBox(height: 4.0),
                          Text(
                            category.location.name,
                            style: TextStyle(
                                color: Colors.grey[500],
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 4.0),
                          Row(
                            children: [
                              Text(
                                '\$${category.price.toInt().toString()}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                              const Text(' night')
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }
}
