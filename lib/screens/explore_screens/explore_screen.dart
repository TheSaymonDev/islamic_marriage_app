import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_marriage/screens/explore_screens/explore_screen_components/community_center_screen.dart';
import 'package:islamic_marriage/screens/explore_screens/explore_screen_components/kazi_office_screen.dart';
import 'package:islamic_marriage/screens/explore_screens/explore_screen_components/user_screen.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_text_styles.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity.h,
      width: double.infinity.w,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            labelStyle: AppTextStyles.titleMedium(),
            unselectedLabelStyle:
                AppTextStyles.titleMedium(color: AppColors.greyColor),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: AppColors.violetClr,
            indicatorWeight: 2.w,
            tabs: const [
              Tab(
                text: 'User',
              ),
              Tab(
                text: 'Kazi Office',
              ),
              Tab(
                text: 'Community\nCenter',
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: const [
                UserScreen(),
                KaziOfficeScreen(),
                CommunityCenterScreen()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
