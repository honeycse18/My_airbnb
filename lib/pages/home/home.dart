import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/models/fakeModel/fake_data.dart';
import 'package:airbnb_app/models/fakeModel/home_content_model.dart';
import 'package:airbnb_app/models/api_responses/property_filters_response.dart';
import 'package:airbnb_app/models/api_responses/property_item.dart';
import 'package:airbnb_app/utils/api_request.dart';
import 'package:airbnb_app/utils/utils.dart';
import 'package:airbnb_app/widgets/common/alert.dart';
import 'package:airbnb_app/widgets/components/category_card.dart';
import 'package:airbnb_app/widgets/search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  bool loading = true;

  TabController? tabController;
  ScrollController scrollController = ScrollController();
  List<double> offsets = [];
  bool isScrolling = false;
  TextEditingController searchTextEditingController = TextEditingController();

  HomeContent homeContent = FakeData.homeContents.first;
  HomeContent bestCities = FakeData.bestCity.first;
  List<PropertyItems> propertyItems = [];
  final PageController pageController = PageController(keepPage: false);
  List<CategoryFilterTabItems> categoryTab = [];

  @override
  void onInit() {
    super.onInit();
    getCategoryFilterTabItems();
    getPropertyItems();
  }

  @override
  void onReady() {
    loading = false;
    super.onReady();
  }

  @override
  void onClose() {
    tabController?.dispose();
    scrollController.dispose();
    searchTextEditingController.dispose();
    super.onClose();
  }

  Future<void> getCategoryFilterTabItems() async {
    var response = await ApiRequest.get('/v1/property/filters', null);
    if (response.error == false) {
      categoryTab = AppUtils.getSafeList(response.data)
          .map((e) => CategoryFilterTabItems.getAPIResponseObjectSafeValue(e))
          .toList();

      tabController = TabController(length: categoryTab.length, vsync: this);
      offsets = List.generate(categoryTab.length, (index) => getOffset(index));
      tabController?.addListener(handleTabSelection);
      scrollController.addListener(handleScroll);

      update();
    } else {
      Alert.error('', response.msg.tr);
    }
  }

  void handleScroll() {
    if (isScrolling) return;
    int newIndex = indexByOffset;
    if (tabController?.index != newIndex) {
      tabController?.animateTo(newIndex);
    }
  }

  void handleTabSelection() {
    if (isScrolling) return;
    isScrolling = true;
    scrollController
        .animateTo(
      offsets[tabController?.index ?? 0] - 20,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    )
        .then((_) {
      isScrolling = false;
    });
    loadEvents();
  }

  Future<void> getPropertyItems() async {
    var response = await ApiRequest.get('/v1/property/find', null);
    if (response.error == false) {
      propertyItems = AppUtils.getSafeList(response.data)
          .map((e) => PropertyItems.getAPIResponseObjectSafeValue(e))
          .toList();

      update();
    } else {
      Alert.error('', response.msg.tr);
    }
  }

  double getOffset(int index) =>
      (index * 24) +
      (index) * (MediaQuery.of(Get.context!).size.width) / categoryTab.length;

  int get indexByOffset {
    double offset = scrollController.offset + 50;
    int index = 0;
    for (int i = 0; i < offsets.length; i++) {
      if (offsets[i] <= offset) {
        index = i;
      }
    }
    return index;
  }

  void loadEvents() {
    loading = true;
    update();
    Future.delayed(const Duration(milliseconds: 2000), () {
      loading = false;
      update();
    });
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      global: false,
      builder: (controller) {
        // Check if tabController is initialized
        if (controller.tabController == null) {
          return const Center(child: CircularProgressIndicator());
        }

        return Scaffold(
          appBar: AppBar(
            leading: AppGaps.emptyGap,
            scrolledUnderElevation: 0,
            toolbarHeight: 160,
            flexibleSpace: Container(
              decoration:
                  const BoxDecoration(color: Colors.white, boxShadow: []),
              child: Stack(
                children: [
                  MySearchBar(onTap: () {
                    // context.pushNamed('bookingDetails');
                    // Navigator.push(context, MaterialPageRoute(builder: (context) {
                    //   return BookingDetailsPage();
                    // }));
                  }),
                  Positioned(
                    bottom: 5.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey.shade300,
                            width: 1,
                          ),
                        ),
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        controller: controller.scrollController,
                        physics: const ClampingScrollPhysics(),
                        child: controller.tabController == null
                            ? SizedBox()
                            : TabBar(
                                controller: controller.tabController,
                                isScrollable: true,
                                indicatorPadding: EdgeInsets.zero,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                tabAlignment: TabAlignment.start,
                                labelPadding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                overlayColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                tabs: [
                                  ...controller.categoryTab.map((category) {
                                    return GestureDetector(
                                      onTap: () {
                                        controller.tabController?.animateTo(
                                          controller.categoryTab
                                              .indexOf(category),
                                          duration:
                                              const Duration(milliseconds: 300),
                                        );
                                        controller.handleTabSelection();
                                        controller.update();
                                      },
                                      behavior: HitTestBehavior.translucent,
                                      child: CustomTab(
                                        icon: category.icon,
                                        active:
                                            controller.tabController?.index ==
                                                controller.categoryTab
                                                    .indexOf(category),
                                        text: category.name,
                                      ),
                                    );
                                  }),
                                ],
                                indicator: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.black,
                                      width: 2.5,
                                    ),
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
            ),
            child: ListView.builder(
                cacheExtent: 500,
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                itemCount: controller.propertyItems.length,
                itemBuilder: (context, index) {
                  return CategoryCard(
                    category: controller.propertyItems[index],
                  );
                }),
          ),
        );
      },
    );
  }
}

class CustomTab extends StatelessWidget {
  final String text;
  final String icon;
  final bool active;

  const CustomTab({
    super.key,
    required this.text,
    required this.icon,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: [
          SvgPicture.network(
            'https://backend.airbnb.appstick.com.bd/assets/$icon',
            height: 24,
            width: 24,
            colorFilter: active
                ? ColorFilter.mode(Colors.black, BlendMode.srcIn)
                : ColorFilter.mode(Colors.grey, BlendMode.srcIn),
          ),
          const SizedBox(height: 4),
          Text(
            text,
            style: TextStyle(
              color: active ? Colors.black : Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              letterSpacing: -0.28,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
