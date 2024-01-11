import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shayari_posting/Constants/ColorConstants.dart';
import 'package:shayari_posting/Constants/FullScreenPP.dart';
import 'package:shayari_posting/Constants/utils.dart';
import 'package:shayari_posting/TabsScreens/pictures.dart';
import 'package:shayari_posting/upload_post.dart';
import 'package:velocity_x/velocity_x.dart';

class PostScreen extends StatelessWidget {
  PostScreen({super.key});

  List<String> imageAddress = [
    'https://www.rekhta.org/images/shayariimages/yuun-bhii-hazaaron-laakhon-men-tum-intikhaab-ho-couplets-dagh-dehlvi-1_large.png',
    'https://www.rekhta.org/images/shayariimages/2be277cf-da8b-4be7-bc81-3ca410ea4628_large.png',
    'https://www.rekhta.org/images/shayariimages/mehndii-lagaae-baithe-hain-kuchh-is-adaa-se-vo-couplets-riyaz-khairabadi-1_large.png',
    'https://www.rekhta.org/images/shayariimages/gam-mujhe-dete-ho-auron-kii-khushii-ke-vaaste-couplets-riyaz-khairabadi_large.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.h),
          child: Column(
            children: [
              10.h.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                    child: CustomizedText(
                        text: "Muhammad Zahid",
                        size: 16.sp,
                        FontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(color: logoColor)),
                    child: CustomizedText(
                        text: "Total post: 4",
                        size: 9.sp,
                        FontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ],
              ),
              10.h.heightBox,
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => UploadPostScreen());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: logoColor)),
                    child: Icon(
                      Icons.add_outlined,
                      size: 35.sp,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              const Divider(),
              10.h.heightBox,
              SizedBox(
                height: 500.h,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0, // Adjust the spacing as needed
                    mainAxisSpacing: 8.0, // Adjust the spacing as needed
                  ),
                  itemCount: imageAddress.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => FullScreenImagePage(imageAddress[index]));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust the border radius as needed
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.r), //
                          child: Image.network(
                            imageAddress[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
