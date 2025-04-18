import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:med_support_gaza/app/core/extentions/space_extention.dart';
import 'package:med_support_gaza/app/core/utils/app_colors.dart';
import 'package:med_support_gaza/app/core/widgets/custom_text_widget.dart';
import 'package:med_support_gaza/app/modules/home/controllers/home_controller.dart';
import 'package:med_support_gaza/app/modules/home/views/widgets/health_tips.dart';
import 'package:med_support_gaza/app/modules/home/views/widgets/suggested_doctors.dart';
import 'package:med_support_gaza/app/routes/app_pages.dart';

class PatientMainView extends GetView<HomeController> {
  const PatientMainView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 20.h),
            child: RefreshIndicator(
              onRefresh: () async {
                await controller.refreshData();
              },
              child: ListView(
                children: [
                 Padding(
                   padding:  EdgeInsets.symmetric(horizontal: 8.0.w),
                   child: Row(
                        children: [
                        Obx(()=>  CustomText(
                           ' ${controller.patient.value!.firstName} ${controller.patient.value!.lastName}',
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                 ),
                        ),
                          const Spacer(),
                          CircleAvatar(
                            radius: 20.r,
                            backgroundColor: AppColors.primary,
                            child: const Icon(
                              Icons.person,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                 ),
                  40.height,
                  _buildScheduleButton(controller),
                  SizedBox(height: 20.h),
                  24.height,
                  const SuggestedDoctors(),
                  24.height,
                  const HealthTipsView(),
                  24.height,
                ],
              ),
            )),
      ),
    );
  }
}

Widget _buildScheduleButton(HomeController controller) {
  return Padding(
    padding:  EdgeInsets.symmetric(horizontal: 8.0.w),
    child: InkWell(
      onTap: () => Get.toNamed(Routes.APPOINTMENT_BOOKING),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.add_circle_outline_sharp,
              color: Colors.white,
            ),
            12.width,
            CustomText(
              'Schedule New Appointment'.tr,
              fontSize: 12.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    ),
  );
}
