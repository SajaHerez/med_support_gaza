import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:med_support_gaza/app/core/extentions/space_extention.dart';
import 'package:med_support_gaza/app/core/utils/app_colors.dart';
import 'package:med_support_gaza/app/core/widgets/custom_button_widget.dart';
import 'package:med_support_gaza/app/core/widgets/custom_text_widget.dart';
import 'package:med_support_gaza/app/modules/appointment_booking/controllers/appointment_booking_controller.dart';
import 'package:med_support_gaza/app/modules/appointment_booking/views/doctor_card_widget.dart';
import 'package:med_support_gaza/app/modules/appointment_booking/views/specialization_widget.dart';

class AppointmentBookingView extends GetView<AppointmentBookingController> {
   AppointmentBookingView({super.key});
  // final controller= Get.put(AppointmentBookingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: CustomText('BookAppointment'.tr,
            fontSize: 16.sp, fontWeight: FontWeight.bold),
        centerTitle: true,
        backgroundColor: AppColors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            40.height,
            _buildHeader(),
            Expanded(
              child: Obx(() => _buildStepContent(context)),
            ),
            30.height,
            CustomButton(
              color: AppColors.accent,
              onPressed: controller.nextStep,
              text:
                  controller.currentStep.value == 3 ? 'Confirm'.tr : 'Next'.tr,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          'BookAppointment'.tr,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        10.height,
        Obx(() => Row(
              children: List.generate(4, (index) {
                return Expanded(
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 16.r,
                        backgroundColor: index <= controller.currentStep.value
                            ? AppColors.primary
                            : Colors.grey[300],
                        child: Icon(
                          Icons.check,
                          size: 14.sp,
                          color: index <= controller.currentStep.value
                              ? Colors.white
                              : Colors.grey,
                        ),
                      ),
                      if (index < 3)
                        Expanded(
                          child: Container(
                            height: 2.h,
                            color: index < controller.currentStep.value
                                ? AppColors.primary
                                : Colors.grey[300],
                          ),
                        ),
                    ],
                  ),
                );
              }),
            )),
        40.height,
        Obx(() => CustomText(
              controller.stepTitles[controller.currentStep.value].tr,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            )),
        10.height,
      ],
    );
  }

  Widget _buildStepContent(BuildContext context) {
    switch (controller.currentStep.value) {
      case 0:
        return _buildSpecializationStep();
      case 1:
        return _buildDoctorSelectionStep();
      case 2:
        return const _buildTimeSelectionStep();
      case 3:
        return _buildConfirmationStep(context);
      default:
        return Container();
    }
  }

  Widget _buildSpecializationStep() {
    return controller.isLoading.value
        ? Center(child: CircularProgressIndicator())
        : GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 16.h,
              childAspectRatio: 1.6,
            ),
            itemCount: controller.specializations.length,
            itemBuilder: (context, index) {
              final specialization = controller.specializations[index];
              return SpecializationWidget(
                onTap: () => controller.selectSpecialization(specialization),
                title: specialization.major,
                availableDoctors: specialization.doctorCount,
              );
            },
          );
  }
  //

  Widget _buildDoctorSelectionStep() {
    return Obx(() {
      if (controller.isLoadingDoctors.value) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(
                color: AppColors.primary,
                strokeWidth: 3,
              ),
              16.height,
              CustomText(
                'Loading doctors...'.tr,
                fontSize: 14.sp,
                color: AppColors.textLight,
              ),
            ],
          ),
        );
      }

      if (controller.hasError.value) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline_rounded,
                size: 48.sp,
                color: AppColors.error,
              ),
              16.height,
              CustomText(
                'Error loading doctors'.tr,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.error,
              ),
              8.height,
              CustomText(
                controller.errorMessage.value,
                fontSize: 14.sp,
                color: AppColors.textLight,
                textAlign: TextAlign.center,
              ),
              24.height,
              CustomButton(
                text: 'Try Again'.tr,
                color: AppColors.primary,
                width: 120.w,
                onPressed: () => controller.getDoctorsBySpecializations(),
              ),
            ],
          ),
        );
      }

      if (controller.availableDoctors.isEmpty) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                'No doctors available'.tr,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.textDark,
              ),
              8.height,
              CustomText(
                'There are currently no doctors available\nfor ${controller.selectedSpecialization?.value}'
                    .tr,
                fontSize: 14.sp,
                color: AppColors.textLight,
                textAlign: TextAlign.center,
              ),
              24.height,
              CustomButton(
                text: 'Choose Another Specialty'.tr,
                color: AppColors.primary,
                width: 200.w,
                onPressed: () => controller.currentStep.value = 0,
              ),
            ],
          ),
        );
      }

      return ListView.separated(
        itemCount: controller.availableDoctors.length,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 8.h),
        separatorBuilder: (context, index) => 16.height,
        itemBuilder: (context, index) {
          final doctor = controller.availableDoctors[index];
          return Hero(
            tag: 'doctor-${doctor.id}',
            child: Obx(
              () => DoctorCard(
                doctor: doctor,
                isSelected:
                    (controller.selectedDoctorId.value == doctor.id).obs,
                onTap: () => controller.selectDoctor(doctor),
              ),
            ),
          );
        },
      );
    });
  }

  Widget _buildConfirmationStep(BuildContext context) {
    return Obx(() => Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 12,
                spreadRadius: 2,
                offset: const Offset(0, 2),
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Icon(
                      Icons.fact_check_rounded,
                      color: AppColors.primary,
                      size: 20.sp,
                    ),
                  ),
                  12.width,
                  CustomText(
                    'Appointment Summary'.tr,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
              20.height,

              // Appointment Details
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                    color: Colors.grey[200]!,
                    width: 1,
                  ),
                ),
                child: Column(
                  children: [
                    _buildConfirmationItem(
                      'Specialization'.tr,
                      controller.selectedSpecialization!.value?.major ?? "Null",
                      Icons.local_hospital_rounded,
                    ),
                    Divider(height: 24.h, color: Colors.grey[200]),
                    _buildConfirmationItem(
                      'Doctor'.tr,
                      controller.selectedDoctorName.value,
                      Icons.person_rounded,
                    ),
                    Divider(height: 24.h, color: Colors.grey[200]),
                    _buildConfirmationItem(
                      'Date & Time'.tr,
                      '${
                          controller.selectedDate.value?.day}/${controller.selectedDate.value?.month}/${controller.selectedDate.value?.year
                      } at ${controller.selectedTime.value?.format(context)}'
                     ,
                      Icons.access_time_rounded,
                    ),
                  ],
                ),
              ),

              24.height,
              // Additional Information
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(
                    color: AppColors.primary.withOpacity(0.1),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: AppColors.primary,
                      size: 18.sp,
                    ),
                    12.width,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            'Please verify your appointment details'.tr,
                            fontSize: 12.sp,
                            color: Colors.grey[800],
                            fontWeight: FontWeight.w500,
                          ),
                          4.height,
                          CustomText(
                            'You can manage your appointments from the home screen'
                                .tr,
                            fontSize: 11.sp,
                            color: Colors.grey[600],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget _buildConfirmationItem(String label, String value, IconData icon) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              color: Colors.grey[200]!,
            ),
          ),
          child: Icon(
            icon,
            color: AppColors.primary,
            size: 18.sp,
          ),
        ),
        16.width,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                label,
                fontSize: 12.sp,
                color: Colors.grey[600],
              ),
              4.height,
              CustomText(
                value,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: Colors.grey[800],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _buildTimeSelectionStep extends GetView<AppointmentBookingController> {
  const _buildTimeSelectionStep();

  @override
  Widget build(BuildContext context) {
    controller.selectedDate.value ??= DateTime.now();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          20.height,
          // Date Selection Section
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 12,
                  spreadRadius: 2,
                  offset: const Offset(0, 2),
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Section
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.calendar_today_rounded,
                        color: AppColors.primary,
                        size: 20.sp,
                      ),
                    ),
                    12.width,
                    CustomText(
                      'Select Date'.tr,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ],
                ),
                16.height,
                CustomText(
                  'Choose your appointment date'.tr,
                  fontSize: 12.sp,
                  color: Colors.grey[600],
                ),
                24.height,

                // Date Selection Widget
                Obx(() => Container(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      decoration: BoxDecoration(
                        color: Colors.teal.shade50,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: CalendarDatePicker(
                        initialDate:
                            controller.selectedDate.value,
                        firstDate:
                            DateTime.now(), // Cannot select dates before today
                        lastDate: DateTime.now().add(const Duration(
                            days:
                                30)), // Can select up to 30 days in the future
                        onDateChanged: (date) {
                          controller.selectedDate.value = date;
                        },
                        selectableDayPredicate: (day) {
                          // Optionally add logic to disable certain days (weekends, holidays, etc.)
                          // For example, to disable weekends:
                          // return day.weekday != DateTime.saturday && day.weekday != DateTime.sunday;
                          return true;
                        },
                      ),
                    )),
              ],
            ),
          ),

          20.height,

          // Time Slots Section
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 12,
                  spreadRadius: 2,
                  offset: const Offset(0, 2),
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Section
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.access_time_rounded,
                        color: AppColors.primary,
                        size: 20.sp,
                      ),
                    ),
                    12.width,
                    CustomText(
                      'AvailableTimes'.tr,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ],
                ),
                16.height,
                CustomText(
                  'Select your preferred time slot'.tr,
                  fontSize: 12.sp,
                  color: Colors.grey[600],
                ),
                24.height,

                // Time Slots Section
                Obx(() {
                  final availableTimes = controller.getAvailableTimes();

                  if (availableTimes.isEmpty) {
                    return Container(
                      padding: EdgeInsets.all(20.w),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Icon(
                            Icons.event_busy,
                            size: 40.sp,
                            color: Colors.grey[400],
                          ),
                          16.height,
                          CustomText(
                            'No available slots for this date'.tr,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[600],
                            textAlign: TextAlign.center,
                          ),
                          12.height,
                          CustomText(
                            'Please select another date'.tr,
                            fontSize: 12.sp,
                            color: Colors.grey[500],
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  }

                  return Wrap(
                    spacing: 12.w,
                    runSpacing: 16.h,
                    children: List.generate(
                      availableTimes.length,
                      (index) {
                        final time = availableTimes[index];
                        final isSelected =
                            controller.selectedTime.value == time;

                        return InkWell(
                          onTap: () => controller.selectTime(time),
                          borderRadius: BorderRadius.circular(12.r),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.25,
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 12.h,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? AppColors.primary
                                  : AppColors.primary.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(12.r),
                              border: Border.all(
                                color: isSelected
                                    ? AppColors.primary
                                    : Colors.transparent,
                                width: 1.5.w,
                              ),
                            ),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.schedule,
                                  size: 16.sp,
                                  color: isSelected
                                      ? Colors.white
                                      : AppColors.primary,
                                ),
                                6.height,
                                CustomText(
                                  time.format(context),
                                  fontSize: 13.sp,
                                  fontWeight: isSelected
                                      ? FontWeight.w600
                                      : FontWeight.normal,
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.grey[800],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }),

                // Additional Info Section
                24.height,
                Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: Colors.blue[700],
                        size: 18.sp,
                      ),
                      12.width,
                      Expanded(
                        child: CustomText(
                          'Appointment duration is 30 minutes'.tr,
                          fontSize: 12.sp,
                          color: Colors.blue[700],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
