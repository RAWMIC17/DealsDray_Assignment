import 'package:dealsdray_1/screens/carousel_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({super.key});

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  int myindex = 0;

  List<Widget> widgetList = const [
    CarouselLoading(),
    Text("Caregories Page"),
    Text("Deals Page"),
    Text("Cart Page"),
    Text("Profile Page"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Vx.red500,
        elevation: 5,
        onPressed: () {},
        label: "Chat".text.xl2.color(Vx.white).make(),
        icon: Transform.flip(
          child: Icon(CupertinoIcons.chat_bubble_text_fill,color: Vx.white,),
          flipX: true,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(CupertinoIcons.bars, size: 32, color: Vx.black),
          splashColor: Vx.red200
        ),
        elevation: 5,
        backgroundColor: Vx.white,
        shadowColor: Vx.black,
        title: Row(
    children: [
      Expanded(
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.all(7.0),
              child: SizedBox(width: 10,
                  height: 10,
                child: Image.asset(
                  "lib/assets/img/dealsdray_img_icon.png",
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            hintText: 'Search here',
            hintStyle: TextStyle(color: Vx.gray400),
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(10),
            fillColor: Vx.gray200,
            suffixIcon: Icon(CupertinoIcons.search,size: 28,),
            suffixIconColor: Vx.gray500,
            filled: true,
            //disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(style: BorderStyle.none))
          ),
        ),
      ),
    ],
  ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(CupertinoIcons.bell, size: 30, color: Vx.black),
            splashColor: Vx.red200,
          ),
        ],
      ),
      body: Center(
        child: widgetList[myindex], // Display the selected widget based on `myindex`
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: myindex, // Set the selected index
        onTap: (index) {
          setState(() {
            myindex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Vx.gray400,
        showUnselectedLabels: true,
        selectedItemColor: Vx.red500,
        elevation: 10,
        iconSize: 32,
        items:  [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: SizedBox(width: 33,
                height: 33,
              child: Image.asset(
                "lib/assets/img/dealsdray_img_icon.png",
                fit: BoxFit.contain,
                color: myindex == 2 ? null : Vx.gray400,
              ),
            ),
            label: "Deals",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.shopping_cart),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
