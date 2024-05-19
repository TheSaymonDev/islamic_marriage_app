import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_text_styles.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/widgets/common_widgets/custom_card.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  int _selectedMobileBanking = 0;
  final List<String> _mobileBankingIconUrls = [AppUrls.bkashSvg, AppUrls.rocketSvg, AppUrls.nagadSvg];
  int _selectedCard = 0;
  final List<String> _cardIconUrls = [AppUrls.masterCardSvg, AppUrls.masterCardSvg, AppUrls.masterCardSvg];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(16.h),
        Text(
          'Premium Plan',
          style: AppTextStyles.titleMedium(),
        ),
        Gap(16.h),
        Text(
          'Select the payment method you want to use',
          style: AppTextStyles.bodySmall(),
        ),
        Gap(16.h),
        Divider(
          color: AppColors.violetClr,
          thickness: 2.w
        ),
        Gap(16.h),
        TabBar(
          controller: _tabController,
          indicatorColor: AppColors.violetClr,
          indicatorWeight: 1.5.w,
          indicatorSize: TabBarIndicatorSize.tab,
          unselectedLabelStyle: AppTextStyles.titleMedium(color: AppColors.greyColor),
          labelStyle: AppTextStyles.titleMedium(),
          tabs: const [
            Tab(
              text: 'Mobile Banking',
            ),
            Tab(
              text: 'Card',
            )
          ],
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 32.h),
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: [
                Column(
                  children: List.generate(_mobileBankingIconUrls.length, (index) =>  GestureDetector(
                    onTap: (){
                      setState(() {
                        _selectedMobileBanking=index;
                      });
                    },
                    child: CustomCard(
                      height: 56.h,
                      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 8.h),
                      margin: EdgeInsets.only(bottom: 16.h),
                      border: Border.all(color: AppColors.violetClr, width: 1.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(_mobileBankingIconUrls[index], width: 85.w,),
                          Container(
                            height: 20.h,
                            width: 20.w,
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.violetClr, width: 1.w),
                              color: _selectedMobileBanking==index ? AppColors.violetClr : null,
                              shape: BoxShape.circle
                            ),
                          )
                        ],
                      ),
                    ),
                  ))
                ),
                Column(
                    children: List.generate(_cardIconUrls.length, (index) =>  GestureDetector(
                      onTap: (){
                        setState(() {
                          _selectedCard=index;
                        });
                      },
                      child: CustomCard(
                        height: 56.h,
                        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 8.h),
                        margin: EdgeInsets.only(bottom: 16.h),
                        border: Border.all(color: AppColors.violetClr, width: 1.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(_cardIconUrls[index], width: 85.w,),
                            Container(
                              height: 20.h,
                              width: 20.w,
                              decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.violetClr, width: 1.w),
                                  color: _selectedCard==index ? AppColors.violetClr : null,
                                shape: BoxShape.circle
                              ),
                            )
                          ],
                        ),
                      ),
                    ))
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
