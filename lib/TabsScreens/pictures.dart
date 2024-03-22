import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shayari_posting/Constants/FullScreenPP.dart';

class PictureScreen extends StatefulWidget {
  PictureScreen({super.key});

  @override
  State<PictureScreen> createState() => _PictureScreenState();
}

class _PictureScreenState extends State<PictureScreen> {
  @override
  void initState() {
    super.initState();
  }

  List<String> imageAddress = [
    'https://www.rekhta.org/images/shayariimages/yuun-bhii-hazaaron-laakhon-men-tum-intikhaab-ho-couplets-dagh-dehlvi-1_large.png',
    'https://www.rekhta.org/images/shayariimages/2be277cf-da8b-4be7-bc81-3ca410ea4628_large.png',
    'https://www.rekhta.org/images/shayariimages/mehndii-lagaae-baithe-hain-kuchh-is-adaa-se-vo-couplets-riyaz-khairabadi-1_large.png',
    'https://www.rekhta.org/images/shayariimages/gam-mujhe-dete-ho-auron-kii-khushii-ke-vaaste-couplets-riyaz-khairabadi_large.png',
    'https://www.rekhta.org/images/shayariimages/yuun-bhii-hazaaron-laakhon-men-tum-intikhaab-ho-couplets-dagh-dehlvi-1_large.png',
    'https://www.rekhta.org/images/shayariimages/2be277cf-da8b-4be7-bc81-3ca410ea4628_large.png',
    'https://www.rekhta.org/images/shayariimages/mehndii-lagaae-baithe-hain-kuchh-is-adaa-se-vo-couplets-riyaz-khairabadi-1_large.png',
    'https://www.rekhta.org/images/shayariimages/gam-mujhe-dete-ho-auron-kii-khushii-ke-vaaste-couplets-riyaz-khairabadi_large.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                child: CachedNetworkImage(
                  imageUrl: imageAddress[index],
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
