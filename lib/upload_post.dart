import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shayari_posting/Constants/ColorConstants.dart';
import 'package:shayari_posting/Constants/utils.dart';
import 'package:velocity_x/velocity_x.dart';

class UploadPostScreen extends StatefulWidget {
  const UploadPostScreen({super.key});

  @override
  State<UploadPostScreen> createState() => _UploadPostScreenState();
}

class _UploadPostScreenState extends State<UploadPostScreen> {
  final TextEditingController _textController = TextEditingController();

  var categoriesShayari = [
    'Sad Shayari',
    'Love Shayari',
    'Pyar Shayari',
    'Dosti Shayari',
    'Dard Shayari',
    'Independence Day Shayari',
    'Romantic Shayari',
  ];

  bool showPostDetails = false;

  String selectedCategory = 'Sad Shayari'; // Set to the first item in the list

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              35.h.heightBox,
              Center(
                child: CustomizedText(
                    text: "Upload Post",
                    size: 22.sp,
                    color: MColor,
                    FontWeight: FontWeight.w700),
              ),
              15.h.heightBox,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () async {
                    final value = await FlutterClipboard.paste();
                    setState(() {
                      _textController.text = value;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomizedText(
                          text: "Write",
                          size: 12.sp,
                          FontWeight: FontWeight.w700),
                      Icon(
                        FontAwesomeIcons.paste,
                        color: MColor,
                        size: 18.sp,
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: Container(
                  height: 250.h,
                  width: 320.w,
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(blurRadius: 15.0, color: Colors.grey),
                      ],
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                      color: white,
                      borderRadius: BorderRadius.all(Radius.circular(20.r))),
                  child: TextField(
                    maxLines: 500,
                    style: TextStyle(
                        color: const Color(0xff070821),
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        height: 1.5),
                    textAlignVertical: TextAlignVertical.center,
                    controller: _textController,
                    decoration: InputDecoration(
                        isDense: true,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        contentPadding: EdgeInsets.all(10),
                        hintText: "Post...",
                        hintStyle: const TextStyle(color: Colors.grey),
                        border: InputBorder.none),
                  ),
                ),
              ),
              15.h.heightBox,
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: GestureDetector(
                  onTap: () {
                    _textController.clear();
                  },
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: CustomizedText(
                        text: "Clear Text",
                        size: 12.sp,
                        FontWeight: FontWeight.w800,
                        btwSpace: 0.2),
                  ),
                ),
              ),
              10.h.heightBox,
              const Divider(),
              CustomizedText(
                  text: "Select category of Shayari",
                  size: 12.sp,
                  FontWeight: FontWeight.w700),
              Center(
                child: DropdownButton<String>(
                  value: selectedCategory,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedCategory = newValue!;
                    });
                  },
                  items: categoriesShayari.map((String category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                ),
              ),
              const Divider(),
              Center(
                child: SizedBox(
                  width: 220.w,
                  child: CustomziedButton(
                    text: "Post",
                    onFunction: () {
                      try {
                        if (_textController.text.isNotEmpty) {
                          setState(() {
                            showPostDetails = true;
                          });
                        } else {
                          throw Exception("Post text is empty");
                        }
                      } catch (e) {
                        CustomizedSnackBar("Error", e.toString());
                      }
                    },
                  ),
                ),
              ),
              const Divider(),

              //show the all details of post after click on post _textcontroller and category name etc
              showPostDetails == true
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                              border: Border.all(color: logoColor),
                              borderRadius: BorderRadius.circular(
                                25.r,
                              )),
                          child: Column(
                            children: [
                              CustomizedText(
                                text: selectedCategory,
                                size: 11.sp,
                                FontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                              5.h.heightBox,
                              Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                    20.r,
                                  )),
                                  child: CustomizedText(
                                      text: "'${_textController.text}'",
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
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  : const SizedBox(),
              50.h.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}
