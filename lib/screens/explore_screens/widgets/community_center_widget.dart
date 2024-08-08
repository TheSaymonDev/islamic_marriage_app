import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/community_center_details_screen/community_center_details_screen.dart';
import 'package:islamic_marriage/screens/explore_screens/model/kazi_office_model.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_text_styles.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/widgets/custom_card.dart';
import 'package:islamic_marriage/widgets/custom_drop_down_button.dart';
import 'package:islamic_marriage/widgets/custom_elevated_button.dart';
import 'package:islamic_marriage/widgets/custom_text_form_field.dart';

class CommunityCenterWidget extends StatefulWidget {
  const CommunityCenterWidget({super.key});

  @override
  State<CommunityCenterWidget> createState() => _CommunityCenterWidgetState();
}

class _CommunityCenterWidgetState extends State<CommunityCenterWidget> {

  final _kaziOfficeController = TextEditingController();
  final List<String> _sponsoredList = ['One Ummah', 'Believers Sign', 'Sunnah Shop'];
  String _selectedSponsored = '';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity.h,
      width: double.infinity.w,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Gap(16.h),
            SizedBox(
              height: 55.h,
              child: Row(
                children: [
                  Expanded(
                      child: CustomTextFormField(
                          hintText: 'Search', controller: _kaziOfficeController)),
                  Gap(8.w),
                  CustomElevatedButton(
                    onPressed: () {},
                    buttonName: 'Find',
                    buttonWidth: 146.w,
                    icon: Icons.search,
                  )
                ],
              ),
            ),
            Gap(16.h),
            SizedBox(height: 55.h,child: Row(
              children: [
                Text('Sort By', style: AppTextStyles.bodyMedium()),
                Gap(4.w),
                Expanded(
                  child: CustomDropdownButton(items: _sponsoredList, onChanged: (newValue){
                    setState(() {
                      _selectedSponsored = newValue!;
                    });
                  },),
                ),
                Gap(8.w),
                CustomElevatedButton(
                  onPressed: () {},
                  buttonName: 'Filter',
                  buttonWidth: 146.w,
                ),
              ],
            ),),
            Gap(16.h),
            Flexible(
              child: MasonryGridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 8.h,
                crossAxisSpacing: 4.w,
                itemBuilder: (context, index) {
                  final kaziOffice = KaziOfficeModel.kaziOfficeList[index];
                  return GestureDetector(
                    onTap: (){
                      Get.to(()=>const CommunityCenterDetailsScreen(des: AppUrls.loremData));
                    },
                    child: CustomCard(
                      height: 290.h,
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                      child: Column(
                        children: [
                          Container(
                            height: 160.h,
                            width: double.infinity.w,
                            alignment: Alignment.topRight,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              image: DecorationImage(
                                  image: AssetImage(kaziOffice.imgPath),
                                  fit: BoxFit.fill),
                            ),
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    kaziOffice.toggleFavourite();
                                  });
                                },
                                icon: Icon(
                                  kaziOffice.isFavourite
                                      ? Icons.favorite
                                      : Icons.favorite_outline,
                                  size: 25.sp,
                                  color: Colors.red,
                                )),
                          ),
                          Gap(16.h),
                          Text(
                            kaziOffice.name,
                            style: AppTextStyles.titleMedium()
                          ),
                          const Spacer(),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.location_on,
                                size: 12.sp,
                                color: AppColors.greyColor,
                              ),
                              Gap(4.w),
                              Text(
                                kaziOffice.location,
                                style: AppTextStyles.bodySmall(color: AppColors.greyColor)
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: KaziOfficeModel.kaziOfficeList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
