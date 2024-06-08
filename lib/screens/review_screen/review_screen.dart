import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/widgets/custom_appbar/custom_appbar.dart';
import 'package:islamic_marriage/widgets/custom_elevated_button.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {

  final _reviewController = TextEditingController();
  List<File> _selectedImages = [];

  Future<void> _pickImagesFromGallery() async {
    final List<XFile>? images = await ImagePicker().pickMultiImage();
    if (images != null) {
      setState(() {
        _selectedImages = images.map((e) => File(e.path)).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final myTextStyle = Theme.of(context).textTheme;
    return Scaffold(
      appBar: CustomAppbar(
        onPressedBack: () {
          Get.back();
        },
        title: 'Review & Rating',
      ),
      body: Container(
        height: double.infinity.h,
        width: double.infinity.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Gap(40.h),
              Text(
                'What is your rate?',
                style: myTextStyle.bodyLarge,
              ),
              Gap(8.h),
              RatingBar.builder(
                initialRating: 0,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              Gap(40.h),
              Text(
                'Please share your opinion\nabout the product',
                style: myTextStyle.bodyMedium,
                textAlign: TextAlign.center,
              ),
              Gap(8.h),
              SizedBox(
                height: 200.h,
                child: TextFormField(
                  maxLines: 5,
                  cursorColor: AppColors.blackClr,
                  controller: _reviewController,
                  style: myTextStyle.bodyMedium,
                  decoration: InputDecoration(
                    hintText: 'Write your review',
                    fillColor: AppColors.whiteClr,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.r),
                        borderSide: BorderSide(color: AppColors.violetClr, width: 1.w)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.r),
                        borderSide: BorderSide(color: AppColors.violetClr, width: 1.w)),
                  ),
                ),
              ),
              Gap(16.h),
              SizedBox(
                height: 100.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: _selectedImages.isEmpty
                          ? const SizedBox()
                          : ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: _selectedImages.length,
                              separatorBuilder: (context, index) => Gap(4.w),
                              itemBuilder: (context, index) {
                                return SizedBox(
                                  height: 100.h,
                                  width: 104.w,
                                  child: Image.file(_selectedImages[index],
                                      fit: BoxFit.cover),
                                );
                              },
                            ),
                    ),
                    GestureDetector(
                      onTap: _pickImagesFromGallery,
                      child: SizedBox(
                        height: 100.h,
                        width: 104.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 60.h,
                              width: 60.w,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.violetClr,
                              ),
                              child: Icon(Icons.camera_alt_outlined,
                                  size: 20.sp, color: AppColors.whiteClr),
                            ),
                            Gap(4.h),
                            Text('Add photos', style: myTextStyle.titleSmall),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Gap(200.h),
              CustomElevatedButton(onPressed: () {}, buttonName: 'Review Send'),
            ],
          ),
        ),
      ),
    );
  }

// Future _pickImageFromGallery() async {
//   final returnedImage =
//   await ImagePicker().pickImage(source: ImageSource.gallery);
//   if (returnedImage == null) return;
//   setState(() {
//     _selectedImage = File(returnedImage.path);
//   });
// }
}
