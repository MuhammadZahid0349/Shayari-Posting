import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shayari_posting/Constants/ColorConstants.dart';
import 'package:shayari_posting/Constants/utils.dart';
import 'package:shayari_posting/drawer.dart';
import 'package:velocity_x/velocity_x.dart';
import 'TabsScreens/categories.dart';
import 'TabsScreens/pictures.dart';
import 'TabsScreens/posts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerPage(),
      appBar: AppBar(
        backgroundColor: logoColor,
        elevation: 0,
        title: const TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Search',
            contentPadding: EdgeInsets.zero,
            hintStyle: TextStyle(color: Colors.white),
          ),
        ),
        actions: [
          Icon(
            Icons.notifications,
            size: 25.sp,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PopupMenuButton<String>(
              onSelected: (value) {
                // Handle the selected option here
                if (value == 'logout') {
                  // Handle logout
                } else if (value == 'login') {
                  // Handle login
                } else if (value == 'update_profile') {
                  // Handle update profile
                }
              },
              itemBuilder: (BuildContext context) => [
                PopupMenuItem<String>(
                  value: 'logout',
                  child: Text('Logout'),
                ),
                PopupMenuItem<String>(
                  value: 'login',
                  child: Text('Login'),
                ),
                PopupMenuItem<String>(
                  value: 'update_profile',
                  child: Text('Update Profile'),
                ),
              ],
              child: Icon(Icons.more_vert),
            ),
          )
        ],
        bottom: TabBar(
          controller: _tabController,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: white),
            color: Colors.black,
          ),
          padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 5.w),
          indicatorPadding: EdgeInsets.symmetric(horizontal: 5.h),
          tabs: const [
            ContainerTab(text: 'Categories'),
            ContainerTab(text: 'Pictures'),
            ContainerTab(text: 'Posts'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          CategoriesScreen(),
          PictureScreen(),
          PostScreen(),
        ],
      ),
      // bottomNavigationBar: Container(
      //   height: 35.h,
      //   decoration: BoxDecoration(
      //     image: DecorationImage(
      //       image: NetworkImage(
      //         'https://i.pinimg.com/564x/c8/e2/e5/c8e2e5caaf8aa44b47b41e25641c1a89.jpg', // Replace with your image URL
      //       ),
      //       fit: BoxFit.cover,
      //     ),
      // ),
      // ),
    );
  }
}

class ContainerTab extends StatelessWidget {
  final String text;
  const ContainerTab({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.h,
      width: 100.w,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Center(
        child: CustomizedText(
            text: text, FontWeight: FontWeight.w700, color: white, size: 12.sp),
      ),
    );
  }
}
