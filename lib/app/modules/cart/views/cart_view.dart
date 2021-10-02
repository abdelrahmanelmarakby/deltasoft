import 'package:cart_stepper/cart_stepper.dart';
import 'package:deltasoft/app/data/product_model.dart';
import 'package:deltasoft/core/consts.dart';
import 'package:deltasoft/core/widgets/Text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: Get.height * .8,
              child: SingleChildScrollView(
                child: Column(children: [
                  ...List.generate(
                    controller.cartBox.length,
                    (index) {
                      final ProductModel product =
                          controller.cartBox.get(index) as ProductModel;

                      controller.totalPrice.value =
                          controller.cartBox.length * 140;
                      print(controller.totalPrice);

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(KRaduis + KRaduis),
                              color: Colors.grey.shade100),
                          height: Get.height * .2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                ClipRRect(
                                  child: Image.network(product.imageUrl),
                                  borderRadius:
                                      BorderRadius.circular(KRaduis + KRaduis),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Txt(product.name.toString()),
                                      Txt(
                                        "size :" + product.size.toString(),
                                        color: Colors.black54,
                                        size: 12,
                                      ),
                                      Container(
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Txt(
                                                r"$" + product.price.toString(),
                                                weight: FontWeight.bold,
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              GetBuilder<CartController>(
                                                builder: (CartController
                                                        controller) =>
                                                    CartStepper(
                                                        activeBackgroundColor:
                                                            Colors.white,
                                                        elevation: 0,
                                                        count: controller
                                                            .cartCounter,
                                                        size: 30,
                                                        radius: Radius
                                                            .circular(KRaduis),
                                                        activeForegroundColor:
                                                            Colors.black,
                                                        didChangeCount:
                                                            (int counter) {
                                                          controller
                                                                  .cartCounter =
                                                              counter;
                                                          controller.update();
                                                        }),
                                              )
                                            ]),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ]),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Txt("TOTAL"),
                        Txt(
                          r"$" + controller.totalPrice.value.toString(),
                          color: Colors.orange,
                          weight: FontWeight.bold,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    TextButton(
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(KRaduis + 8)),
                            backgroundColor: Colors.orange,
                            minimumSize: Size(Get.width, 36)),
                        onPressed: () {},
                        child: Txt(
                          "BUY NOW",
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
    ));
  }
}
