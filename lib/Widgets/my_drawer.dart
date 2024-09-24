import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_project/Widgets/custom_text.dart';

import '../Utils/app_constant.dart';
import '../Utils/app_images.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
              child: Container(
            height: 160.h,
            width: 280.w,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage(AppImages.logo))),
          )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: CustomText(
                    text: AppConstants.KGCCommunity,
                    color: Colors.blueGrey,
                    weight: FontWeight.w600),
              ),
              ListTile(
                title: CustomText(
                    text: AppConstants.LifeExpectancyCalculator,
                    color: Colors.blueGrey,
                    weight: FontWeight.w600),
              ),
            ],
          )
        ],
      ),
    );
  }
}
