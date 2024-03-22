import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:printing/printing.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shayari_posting/Constants/ColorConstants.dart';
import 'package:shayari_posting/Constants/utils.dart';
import 'package:shayari_posting/Controller.dart/categories_controller.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class ShayariListScreen extends StatelessWidget {
  final String category;
  ShayariListScreen({super.key, required this.category});

  final String text =
      'Flutter is a framework to build cross-platform applications. https://www.flutter.dev';

  final String imageAsset = 'assets/images/1.png';

  final String quote =
      "Life quotes can turn around the heaviest of days. Whether you’re feeling disconnected or need a positive note to help you through a particularly tough time, quotes about life can help put things into perspective.";

  final String imageNetwork =
      'https://www.rekhta.org/images/shayariimages/mehndii-lagaae-baithe-hain-kuchh-is-adaa-se-vo-couplets-riyaz-khairabadi-1_large.png';

  @override
  Widget build(BuildContext context) {
    CategoriesController categoriesController = Get.put(CategoriesController());
    return Scaffold(
      appBar: AppBar(
        title: CustomizedText(
            text: category,
            size: 20.sp,
            FontWeight: FontWeight.w600,
            color: white),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              4.h.heightBox,
              Text("Shayari for $category will be displayed here..."),
              7.h.heightBox,
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                    // border: Border.all(color: logoColor),
                    borderRadius: BorderRadius.circular(
                  25.r,
                )),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                        20.r,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                          20.r,
                        )),
                        child: CachedNetworkImage(
                          imageUrl: imageNetwork,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                    4.h.heightBox,
                    Row(
                      children: [
                        8.w.widthBox,
                        CircleAvatar(
                          radius: 15.sp,
                          backgroundImage: const NetworkImage(
                              "https://freesvg.org/img/abstract-user-flat-4.png"),
                        ),
                        5.w.widthBox,
                        CustomizedText(
                          text: "Muhammad Zahid",
                          size: 11.sp,
                          FontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () async {
                            final url = Uri.parse(imageNetwork);
                            final response = await http.get(url);
                            Share.shareXFiles([
                              XFile.fromData(
                                response.bodyBytes,
                                name: 'Flutter 3',
                                mimeType: 'image/png',
                              ),
                            ], subject: 'Flutter 3');
                          },
                          child: Icon(
                            Icons.share,
                            size: 26.sp,
                          ),
                        ),
                        10.w.widthBox,
                        GestureDetector(
                          onTap: () {
                            categoriesController.isFavoriteImg.toggle();
                          },
                          child: Obx(() => Icon(
                                categoriesController.isFavoriteImg.isTrue
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                size: 26.sp,
                                color: categoriesController.isFavoriteImg.isTrue
                                    ? Colors.red
                                    : Colors.black,
                              )),
                        ),
                        8.w.widthBox,
                      ],
                    )
                  ],
                ),
              ),
              8.h.heightBox,
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                    border: Border.all(color: logoColor),
                    borderRadius: BorderRadius.circular(
                      25.r,
                    )),
                child: Column(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                          20.r,
                        )),
                        child: CustomizedText(
                            text: "'$quote'",
                            size: 15.sp,
                            color: Colors.black,
                            FontWeight: FontWeight.w600)),
                    4.h.heightBox,
                    Row(
                      children: [
                        8.w.widthBox,
                        CircleAvatar(
                          radius: 15.sp,
                          backgroundImage: const NetworkImage(
                              "https://freesvg.org/img/abstract-user-flat-4.png"),
                        ),
                        5.w.widthBox,
                        CustomizedText(
                          text: "Muhammad Zahid",
                          size: 11.sp,
                          FontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            Share.share(quote);
                          },
                          child: Icon(
                            Icons.share,
                            size: 26.sp,
                          ),
                        ),
                        10.w.widthBox,
                        GestureDetector(
                          onTap: () {
                            categoriesController.isFavoriteTxt.toggle();
                          },
                          child: Obx(() => Icon(
                                categoriesController.isFavoriteTxt.isTrue
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                size: 26.sp,
                                color: categoriesController.isFavoriteTxt.isTrue
                                    ? Colors.red
                                    : Colors.black,
                              )),
                        ),
                        8.w.widthBox,
                      ],
                    )
                  ],
                ),
              ),
              30.h.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}
