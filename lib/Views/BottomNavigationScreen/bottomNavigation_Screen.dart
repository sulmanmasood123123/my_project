import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../Utils/app_colors.dart';
import '../../Utils/app_constant.dart';
import '../../Widgets/custom_text.dart';
import '../ChatScreen/Screen/chat_screen.dart';
import '../DashboardScreen/Provider/signOut_provider.dart';
import '../DashboardScreen/Screen/dashboardscreen.dart';
import '../LoginScreen/Screen/loginScreen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedIndex = 0;
  static List<Widget> _pages = <Widget>[
    DashboardScreen(),
    ChatScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: EdgeInsets.only(left: 20.0).r,
            child: Center(
              child: CustomText(
                  textAlign: TextAlign.left,
                  text: "KGC",
                  color: AppColors.white,
                  weight: FontWeight.bold,
                  size: 20.sp),
            ),
          ),
          actions: [
            Consumer<SignOutProvider>(
              builder: (context, signOutProvider, child) {
                return InkWell(
                    onTap: () {
                      signOutProvider.signOut();
                      Get.showSnackbar(GetSnackBar(
                          message: AppConstants.logoutSuccessfully,
                          duration: Duration(seconds: 2),
                          backgroundColor: AppColors.green,
                          snackPosition: SnackPosition.TOP,
                          dismissDirection: DismissDirection.up));
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => LoginScreen()));
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 10.0).r,
                      child: Icon(Icons.logout,
                          color: AppColors.white, size: 20.sp),
                    ));
              },
            )
          ],
        ),
        body: _pages[_selectedIndex],
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(vertical: 10), // Add padding
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceAround, // Distribute items evenly
            children: <Widget>[
              buildNavItem(Icons.dashboard, 'Dashboard', 0),
              buildNavItem(Icons.chat, 'Chat', 1),
            ],
          ),
        ));
  }

  Widget buildNavItem(IconData icon, String label, int index) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            icon,
            color: isSelected ? Colors.blue : Colors.grey,
            size: isSelected ? 30 : 24, // Change size when selected
          ),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.blue : Colors.grey,
              fontSize: isSelected ? 14 : 12, // Change font size when selected
            ),
          ),
        ],
      ),
    );
  }
}
