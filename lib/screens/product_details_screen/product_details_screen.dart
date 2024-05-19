import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/product_details_screen/controller/product_des_controller.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_text_styles.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/widgets/common_widgets/custom_back_icon.dart';
import 'package:islamic_marriage/widgets/common_widgets/custom_elevated_button.dart';
import 'package:islamic_marriage/widgets/product_details_widgets/increment_decrement_button.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {


  final double _height = 400.h;
  final List<String> _productSize = ['S', 'M', 'L', 'XL', 'XXL'];
  int _selectedSize = 0;

  final ProductDesController productDesController = Get.put(ProductDesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: double.infinity.h,
          width: double.infinity.w,
          child: Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverPersistentHeader(
                        pinned: true,
                        floating: true,
                        delegate: _buildSliverAppBarDelegate),
                    SliverToBoxAdapter(
                        child: Container(
                            margin: EdgeInsets.only(top: 16.h),
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Panjabi',
                                          style: AppTextStyles.titleLarge()),
                                      Text('${AppUrls.takaSign}100',
                                          style: AppTextStyles.titleLarge()),
                                    ],
                                  ),
                                  Gap(16.h),
                                  Text('Select Size',
                                      style: AppTextStyles.titleMedium()),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                          children: List.generate(
                                              _productSize.length,
                                              (index) => GestureDetector(
                                                    onTap: () {
                                                      _selectedSize = index;
                                                      setState(() {});
                                                    },
                                                    child: Container(
                                                      height: 40.h,
                                                      width: 40.w,
                                                      alignment:
                                                          Alignment.center,
                                                      margin: EdgeInsets.only(
                                                          right: 8.w),
                                                      decoration: BoxDecoration(
                                                          color: _selectedSize ==
                                                                  index
                                                              ? AppColors
                                                                  .purple50Clr
                                                              : AppColors
                                                                  .whiteClr,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.r),
                                                          border: Border.all(
                                                              color: _selectedSize ==
                                                                      index
                                                                  ? AppColors
                                                                      .purpleClr
                                                                  : AppColors
                                                                      .greyColor
                                                                      .withOpacity(
                                                                          0.5))),
                                                      child: Text(
                                                          _productSize[index],
                                                          style: AppTextStyles
                                                              .titleSmall()),
                                                    ),
                                                  ))),
                                      Container(
                                        height: 45.h,
                                        width: 125.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                            color: AppColors.filledClr),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            IncrementDecrementButton(
                                                iconData: Icons.remove,
                                                onTap: ()=> productDesController.decrementQuantity()),
                                            GetBuilder<ProductDesController>(
                                              builder: (controller) {
                                                return Text(controller.quantity.toString(),
                                                    style:
                                                        AppTextStyles.bodyMedium());
                                              }
                                            ),
                                            IncrementDecrementButton(
                                                iconData: Icons.add,
                                                onTap: ()=> productDesController.incrementQuantity(10))
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Gap(16.h),
                                  buildProductDescription,
                                  Gap(16.h),
                                  Text(
                                    'Reviews',
                                    style: AppTextStyles.titleMedium()
                                  ),
                                  Gap(8.h),
                                  InkWell(
                                      onTap: () {
                                        // Get.to(() => const ReviewScreen());
                                      },
                                      child: Text('Write your review',
                                          style: AppTextStyles.bodyMedium(
                                              color: AppColors.purpleClr))),
                                  Gap(30.h)
                                ]))),
                    SliverToBoxAdapter(child: Gap(16.h))
                  ],
                ),
              ),
              Container(
                  height: 92.h,
                  width: double.infinity.w,
                  decoration:
                      BoxDecoration(color: AppColors.whiteClr, boxShadow: [
                    BoxShadow(
                        color: AppColors.blackClr.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, -3) // Offset for top shadow
                        )
                  ]),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                            onTap: () {},
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Price',
                                      style: AppTextStyles.bodySmall(
                                          color: AppColors.greyColor)),
                                  Text('${AppUrls.takaSign}100',
                                      style: AppTextStyles.titleMedium(
                                          color: AppColors.purpleClr)),
                                ])),
                        CustomElevatedButton(onPressed: (){}, buttonName: 'Add to cart', buttonWidth: 180.w)
                      ]))
            ],
          ),
        ),
      ),
    );
  }

  _SliverAppBarDelegate get _buildSliverAppBarDelegate {
    return _SliverAppBarDelegate(
        minHeight: 200.h,
        maxHeight: _height,
        child: GestureDetector(
            onTap: () {
              // Get.to(() => ProductViewPage(
              //     imagePath: widget.product
              //         .images![_productDetailsScreenController.selectedImg].path,
              //     imagesPath: widget.product.images));
            },
            child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AppUrls.demoPanjabiPng),
                        fit: BoxFit.cover)),
                child: LayoutBuilder(
                    builder: (context, constraints) => Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(top: 16.h, left: 16.w),
                                    child: CustomBackButton(onPressed: () {
                                      Get.back();
                                    }),
                                  )),
                              Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16.w,
                                    vertical: 16.h,
                                  ),
                                  child: Visibility(
                                      visible: constraints.maxHeight >= _height,
                                      child: buildMultipleImage))
                            ])))));
  }

  Container get buildMultipleImage {
    return Container(
        height: 100.h,
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.w),
        alignment: Alignment.center,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => GestureDetector(
                onTap: () {},
                child: Container(
                    height: 80.h,
                    width: 90.w,
                    decoration: BoxDecoration(
                        color: AppColors.whiteClr,
                        borderRadius: BorderRadius.circular(16.r),
                        image: DecorationImage(
                            image: AssetImage(AppUrls.demoPanjabiPng),
                            fit: BoxFit.cover)))),
            separatorBuilder: (context, index) => Gap(8.w),
            itemCount: 5));
  }

  Column get buildProductDescription {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Details', style: Get.textTheme.titleMedium),
        Gap(8.h),
        GetBuilder<ProductDesController>(builder: (controller) {
          return Text(
              controller.isExpanded == true
                  ? AppUrls.longDes
                  : AppUrls.shortDes,
              style: AppTextStyles.bodyMedium());
        }),
        Gap(8.h),
        GetBuilder<ProductDesController>(builder: (controller) {
          return GestureDetector(
              onTap: () => controller.toggleDes(),
              child: Text(controller.isExpanded ? 'Show Less' : 'Show More',
                  style: Get.textTheme.bodyMedium!.copyWith(color: AppColors.purpleClr)));
        })
      ],
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
