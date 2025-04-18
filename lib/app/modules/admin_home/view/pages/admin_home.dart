import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:med_support_gaza/app/core/utils/app_assets.dart';
import 'package:med_support_gaza/app/core/utils/app_colors.dart';
import 'package:med_support_gaza/app/core/widgets/custom_text_widget.dart';
import 'package:med_support_gaza/app/modules/admin_home/controller/admin_auth_controller.dart';
import 'package:med_support_gaza/app/modules/admin_home/view/pages/admin_auth.dart';
import 'package:med_support_gaza/app/modules/admin_home/view/pages/admin_content_management_view.dart';
import 'package:med_support_gaza/app/modules/admin_home/view/pages/admin_doctors.dart';
import 'package:med_support_gaza/app/modules/admin_home/view/pages/admin_insights.dart';
import 'package:med_support_gaza/app/modules/admin_home/view/pages/admin_user_management_view.dart';
import 'package:med_support_gaza/app/routes/app_pages.dart';

import '../../controller/admin_home_controller.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    final AdminHomeController controller = Get.put(AdminHomeController());
    final AdminController authController = Get.put(AdminController());

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Obx(() => CustomText(
                controller.getPageTitle(),
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              )),
          centerTitle: true,
          actions: [
            Obx(() => Visibility(
                  visible: controller.selectedIndex.value == 0,
                  child: IconButton(
                    icon: SvgPicture.asset(
                      IconAssets.logOut,
                      color: Colors.red,
                      width: 22.w,
                      height: 22.h,
                    ),
                    onPressed: () {
                      authController.signOut();
                    },
                  ),
                )),
          ],
        ),
        body: Obx(() {
          // Display the corresponding page
          switch (controller.selectedIndex.value) {
            case 0:
              return const InsightsPage();
            case 1:
              return const AdminUserManagementView();
            case 2:
              return const AdminContentManagementView();

            case 3:
              return const AdminDoctors();
            default:
              return const SizedBox();
          }
        }),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            backgroundColor: AppColors.white,
            selectedItemColor: AppColors.accent,
            currentIndex: controller.selectedIndex.value,
            onTap: (index) {
              controller.changeTab(index);
            },
            items: [
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  IconAssets.dashboard,
                  color: AppColors.accent,
                ),
                icon: SvgPicture.asset(
                  IconAssets.dashboard,
                ),
                label: 'Dashboard'.tr,
              ),
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  IconAssets.userManagment,
                  color: AppColors.accent,
                ),
                icon: SvgPicture.asset(
                  IconAssets.userManagment,
                ),
                label: 'userManagment'.tr,
              ),
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  IconAssets.contentManagment,
                  color: AppColors.accent,
                ),
                icon: SvgPicture.asset(
                  IconAssets.contentManagment,
                ),
                label: 'contentManagment'.tr,
              ),
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  IconAssets.serviceManagment,
                  color: AppColors.accent,
                ),
                icon: SvgPicture.asset(
                  IconAssets.serviceManagment,
                ),
                label: 'serviceManagment'.tr,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
