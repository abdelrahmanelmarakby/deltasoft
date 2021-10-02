import 'package:deltasoft/app/data/cart_crud_ops.dart';
import 'package:deltasoft/app/data/product_model.dart';
import 'package:deltasoft/app/routes/app_pages.dart';
import 'package:deltasoft/core/consts.dart';
import 'package:deltasoft/core/widgets/Text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/product_details_controller.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
              child: Hero(
                tag: Get.arguments,
                child: Image.network(
                  Get.arguments,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.7,
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Txt(
                        "Apple watch series 6",
                        size: 18,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          ...List.generate(
                              5,
                              (index) => Icon(
                                    CupertinoIcons.star_fill,
                                    color: Colors.orange,
                                    size: 18,
                                  )),
                          SizedBox(
                            width: 16,
                          ),
                          Txt(
                            "(4500 reviews)",
                            color: Colors.grey,
                            size: 12,
                          )
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Txt(
                                r"$140",
                                weight: FontWeight.bold,
                              ),
                              const SizedBox(width: 8.0),
                              Txt(
                                r"($200)",
                                color: Colors.grey,
                                size: 12,
                                textDecoration: TextDecoration.lineThrough,
                              ),
                            ],
                          ),
                          Txt(
                            "Available in stock",
                            size: 12,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Txt(
                        'About',
                        size: 16,
                      ),
                      SizedBox(
                        height: 00,
                      ),
                      Txt(
                        r"""GPS model lets you take calls and reply to texts from your wrist Measure your blood oxygen with an all-new sensor and app Check your heart rate any time with the Heart Rate app Get notifications for high and low heart rate The Always-On Retina display is 2.5x brighter outdoors when your wrist is down S6 SiP is up to 20% faster than Series 55HGz Wi-Fi and U1 Ultra-Wideband chipTrack your daily activity on Apple Watch and see your trends in the Fitness app on iPhone
Measure workouts like running, walking, cycling, yoga, swimming, and dance
Swim proof design
Sync your favorite music and podcasts
Built-in compass and real-time elevation readings
Can detect if you’ve taken a hard fall, then automatically call emergency services for you
Emergency SOS lets you get help from your wrist
Watch OS 7 with sleep tracking and new customizable watch faces
Aluminum cases available in new finishes""",
                        size: 12,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...List.generate(
                            15,
                            (index) => index == 2
                                ? Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Container(
                                      child: Txt(
                                        (index + 35).toString(),
                                        color: Colors.brown,
                                      ),
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: Colors.orange.shade50,
                                          borderRadius:
                                              BorderRadius.circular(KRaduis)),
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Container(
                                      child: Txt(
                                        (index + 35).toString(),
                                      ),
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade100,
                                          borderRadius:
                                              BorderRadius.circular(KRaduis)),
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    TextButton(
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(KRaduis + 8)),
                            backgroundColor: Colors.orange,
                            minimumSize: Size(Get.width - 60, 36)),
                        onPressed: () {
                          final product = ProductModel(
                              name: "Apple watch",
                              price: r"140",
                              imageUrl: Get.arguments,
                              quantity: 1,
                              size: 37.toString());
                          CartOps.addProduct(product);
                          Get.offAndToNamed(Routes.CART);
                        },
                        child: Txt(
                          "Add to Cart",
                          color: Colors.white,
                          weight: FontWeight.bold,
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
