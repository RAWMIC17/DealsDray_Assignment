import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter/material.dart';

class CarouselLoading extends StatelessWidget {
  const CarouselLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                height: 180, // Adjust this height as needed
                child: PageView.builder(
                  itemCount: 3, // Total number of images in the carousel
                  controller: PageController(viewportFraction: 0.8, initialPage: 1),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'lib/assets/img/banner.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                height: 150,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Vx.indigo400, Vx.indigo700]),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 8),
                    "KYC Pending".text.color(Vx.white).xl3.bold.make(),
                    SizedBox(height: 6),
                    "You need to provide the required".text.lg.color(Vx.white).make(),
                    "documents for your account activation".text.lg.color(Vx.white).make(),
                    SizedBox(height: 4),
                    TextButton(
                      onPressed: () {},
                      child: "Click Here".text.color(Vx.white).xl2.underline.bold.make(),
                      style: ButtonStyle(textStyle: WidgetStatePropertyAll(TextStyle(decorationColor: Vx.white))),
                    )
                  ],
                ),
              ),
              SizedBox(height: 17),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset('lib/assets/img/cat_mobile.png', scale: 0.75),
                      ),
                      "Mobile".text.lg.make(),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset('lib/assets/img/cat_lap.png', scale: 0.75),
                      ),
                      "Laptop".text.lg.make(),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset('lib/assets/img/cat_camera.png', scale: 0.75),
                      ),
                      "Camera".text.lg.make(),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset('lib/assets/img/cat_led.png', scale: 0.75),
                      ),
                      "LED".text.lg.make(),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Vx.blue400, Vx.teal500]),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          "EXCLUSIVE FOR YOU".text.color(Vx.white).xl2.bold.make(),
                          IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.arrow_right, color: Vx.white, size: 28)),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(7, 10, 7, 0),
                      height: 300, // Adjust this height as needed
                      child: PageView.builder(padEnds: false,
                        itemCount: 4, // Total number of images in the carousel
                        controller: PageController(viewportFraction: 0.6, initialPage: 0),
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Stack(
  children: [
    Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // Empty container for spacing
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            'lib/assets/img/71ENtrOR8NL._SL1500_.jpg',
            scale: 0.4,
          ),
        ),
        Container(
          child: "Redmi 13C 5G(black,128gb)".text.lg.make(),
        ),
      ],
    ),
    Positioned(
      top: 18, // Adjust this value to position the label vertically
      right: 10, // Adjust this value to position the label horizontally
      child: Container(
        width: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          color: const Color.fromARGB(255, 50, 122, 46),
        ),
        child: "32% Off".text.color(Vx.white).make().centered(),
      ),
    ),
  ],
),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
