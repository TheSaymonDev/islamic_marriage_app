import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/explore_screens/widgets/community_center_widget.dart';
import 'package:islamic_marriage/screens/explore_screens/widgets/kazi_office_widget.dart';
import 'package:islamic_marriage/screens/explore_screens/widgets/user_widget.dart';
import 'package:islamic_marriage/utils/app_colors.dart';

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
            labelStyle: Theme.of(context).textTheme.titleMedium,
            unselectedLabelStyle: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: greyClr),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: violetClr,
            indicatorWeight: 2.w,
            tabs: [
              Tab(
                child: Center(
                  child: Text(
                    'user'.tr,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Tab(
                child: Center(
                  child: Text(
                    'kaziOffice'.tr,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Tab(
                child: Center(
                  child: Text(
                    'communityCenter'.tr,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: const [
                UserWidget(),
                KaziOfficeWidget(),
                CommunityCenterWidget()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
