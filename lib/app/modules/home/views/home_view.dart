import 'package:carousel_slider/carousel_slider.dart';
import 'package:deltasoft/app/routes/app_pages.dart';
import 'package:deltasoft/core/consts.dart';
import 'package:deltasoft/core/services/theme.dart';
import 'package:deltasoft/core/widgets/Text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              appBar(),
              const SizedBox(height: 16.0),
              AdBanner(
                controller: controller,
              ),
              const SizedBox(height: 16.0),
              ProductsList(
                controller: controller,
              )
            ],
          ),
        ),
      )),
    );
  }
}

class ProductsList extends StatelessWidget {
  const ProductsList({
    required this.controller,
    Key? key,
  }) : super(key: key);
  final HomeController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Wrap(
      direction: Axis.horizontal,
      children: List.generate(
        6,
        (index) => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => Get.toNamed(Routes.PRODUCT_DETAILS,
                  arguments: controller.productImages[index]),
              child: Hero(
                transitionOnUserGestures: true,
                tag: controller.productImages[index],
                child: Container(
                  width: Get.width * .43,
                  height: Get.height * .42,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(KRaduis),
                      color: Colors.grey.shade100),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(KRaduis),
                                  color: Colors.white),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Txt(
                                  "30% OFF",
                                  size: 12,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.favorite,
                              color: Colors.grey.shade400,
                            )
                          ],
                        ),
                      ),
                      Image.network(
                        controller.productImages[index],
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: Get.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(KRaduis),
                              color: Colors.white),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Txt(
                                "  Apple Watch Series 6",
                                size: 12,
                                color: Colors.black54,
                              ),
                              Txt(
                                r"  $140",
                                size: 14,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ));
  }
}

class AdBanner extends StatelessWidget {
  const AdBanner({
    required this.controller,
    Key? key,
  }) : super(key: key);
  final HomeController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: Get.width,
          child: Txt(
            "Hello Rocky 🤗",
            textAlign: TextAlign.left,
            weight: FontWeight.bold,
          ),
        ),
        Container(
            width: Get.width,
            child: Txt(
              "lets gets somethings ?",
              size: 14,
              color: Colors.grey,
              textAlign: TextAlign.left,
            )),
        const SizedBox(
          height: 16,
        ),
        Container(
          height: Get.height * .25,
          child: CarouselSlider(
            items: List.generate(
                controller.bannerImages.length,
                (index) => ClipRRect(
                    borderRadius: BorderRadius.circular(KRaduis),
                    child: Image.network(
                      controller.bannerImages[index],
                      fit: BoxFit.cover,
                    ))),
            options: CarouselOptions(
                aspectRatio: 2 / 1,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                scrollPhysics: BouncingScrollPhysics(),
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 5),
                autoPlayAnimationDuration: Duration(seconds: 2)),
          ),
        )
      ],
    );
  }
}

class appBar extends StatelessWidget {
  const appBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: ThemeService().switchTheme,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(KRaduis)),
              child: Icon(
                CupertinoIcons.settings,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(KRaduis)),
            child: Icon(
              CupertinoIcons.search,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
