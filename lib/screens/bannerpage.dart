import 'package:dealsdray_1/screens/carousel_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BannerpageView extends StatelessWidget {
  const BannerpageView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CarouselLoading(),
      ),
    );
  }
}