import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/services/cache_helper.dart';
import '../../../core/services/status_service.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/custom_snackbar_widget.dart';
import '../../../data/api_services/doctor_appointment_api.dart';
import '../../../data/models/appointment.dart';
import '../../../routes/app_pages.dart';

class DoctorAppointmentManagementController extends GetxController {
  var selectedDate = DateTime.now().obs;
  var selectedTime = '09:00 AM'.obs;
  var endTime = '09:30 AM'.obs;
  var availableTimes = <String>[].obs;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  RxList<Appointment> appointments = <Appointment>[].obs;
  RxBool isloading = false.obs;
  var dayilyappointments = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Replace with actual doctorId
    // final String doctorId = FirebaseAuth.instance.currentUser?.uid ?? '';
    loadAvailableAppointments();
    generateAvailableTimes();
    //getDayilyappointment();
  }

  void generateAvailableTimes() {
    availableTimes.clear();

    // Create times from 9 AM to 4 PM
    for (int hour = 9; hour <= 16; hour++) {
      // For each hour, create :00 and :30 slots
      String period = hour < 12 ? 'AM' : 'PM';
      int displayHour =hour > 12 ? hour - 12 : hour;

      // Add XX:00 slot
      availableTimes
          .add('${displayHour.toString().padLeft(2, '0')}:00 $period');

      // Add XX:30 slot if not the last hour
      if (hour != 16) {
        availableTimes
            .add('${displayHour.toString().padLeft(2, '0')}:30 $period');
      }
    }
  }

  void updateSelectedTime(String time) {
    selectedTime.value = time;
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primary,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
    }
  }

  Future<void> addAppointment() async {
    try {
      print(' addAppointment :  $appointments');

      print(selectedDate.value);
      String date = dateFormate(selectedDate.value);
      String? token = CacheHelper.getData(key: 'token');
      if (token == null) {
        Get.toNamed(Routes.DOCTOR_LOGIN);
        return;
      }
      setEndTime();
      isloading.value = true;
      final response = await Get.find<DoctorAppointmentAPI>()
          .addDoctorAppointment(
              token: token,
              date: date,
              startTime: selectedTime.value,
              endTime: endTime.value);
      if (response.data != null) {
        Appointment appointment =
            Appointment.fromJson(response.data['appointment']);
        appointments.add(appointment);
      }
      print(' addAppointment :  $appointments');

      // getDayilyappointment();
    } catch (e) {
      isloading.value = false;
      print(e.toString());
    } finally {
      isloading.value = false;
    }
  }

  void setEndTime() {
    // Calculate the end time based on the selected time ( the end time is half hour after the start time)
    List<String> timeSplit = selectedTime.value.split(':');
    int hour = int.parse(timeSplit[0]);
    int minute = int.parse(timeSplit[1].split(' ')[0]);
    String period = timeSplit[1].split(' ')[1];
    minute += 30;
    if (minute >= 60) {
      hour += 1;
      minute -= 60;
    }
    if (hour == 12) {
      period = 'PM';
    }

    endTime.value =
        '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} $period';
  }

  void deleteAppointment(int index) async {
    String? token = CacheHelper.getData(key: 'token');

    if (token == null) {
      Get.toNamed(Routes.DOCTOR_LOGIN);
      return;
    }
    try {
      isloading.value = true;
      await Get.find<DoctorAppointmentAPI>()
          .delelteDoctorAppointment(token: token, id: appointments[index].id);
      appointments.removeAt(index);
    } catch (e) {
      isloading.value = false;
      print(e.toString());
    } finally {
      isloading.value = false;
    }
  }

  void loadAvailableAppointments() async {
    String? token = CacheHelper.getData(key: 'token');

    if (token == null) {
      Get.toNamed(Routes.DOCTOR_LOGIN);
      return;
    }
    try {
      isloading.value = true;
      String? status;

      status = 'Available';
      final response = await Get.find<DoctorAppointmentAPI>()
          .getDoctorAppointments(token: token, status: status);
      appointments.value =
          AppointmentModel.fromJson(response.data).appointments;
    } catch (e) {
      isloading.value = false;
      print(e.toString());
    } finally {
      isloading.value = false;
    }
  }

  void approveBooking(int index) {}

  void rejectBooking(int index) {}

  // Helper functions
  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  String getFormatedDate(DateTime selectedDate) {
    String monthName = DateFormat.MMMM().format(selectedDate);
    String dayName = DateFormat.EEEE().format(selectedDate);
    String formattedDate =
        '${dayName.tr}   ${selectedDate.day}  ${monthName.tr}';
    return formattedDate;
  }

  String dateFormate(DateTime dateTime) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
    return formattedDate;
  }

  // get the daily appointment that is booking from a appointments list due to the date

  // void getDayilyappointment() {
  //   try {
  //     // Clear current daily appointments
  //     dayilyappointments.clear();

  //     // Filter appointments for selected date
  //     // for (var appointment in appointments) {
  //     //   DateTime appointmentDate = (appointment['date'] as DateTime);
  //     //   print(
  //     //       '-------------------- $appointmentDate--------------------------');
  //     //   if (isSameDay(appointmentDate, selectedDate.value) &&
  //     //       appointment['isBooked'] == true) {
  //     //     // Convert appointment time format if needed
  //     //     dayilyappointments.add({
  //     //       'patientName': appointment['patientName'],
  //     //       'patientid': appointment['patientid'],
  //     //       'date': appointment['date'],
  //     //       'startTime': appointment['startTime'],
  //     //       'isBooked': appointment['isBooked'],
  //     //       'status': appointment['status'],
  //     //       'createdAt': appointment['createdAt'],
  //     //     });
  //     //
  //     //  }
  //       // Sort daily appointments by time
  //       dayilyappointments.sort(
  //           (a, b) => (a['startTime'] ?? '').compareTo(b['startTime'] ?? ''));
  //     }
  //   } catch (e) {
  //     CustomSnackBar.showCustomSnackBar(
  //       title: 'Error',
  //       message: 'Failed to load daily appointments: ${e.toString()}',
  //     );
  //   }
  //}
}

  /// A controller for managing doctor appointments.
  ///
  /// This controller has methods for loading appointments, marking an appointment
  /// as approved or rejected, and helper functions for formatting dates and
  /// checking if two dates are the same.
  ///
  /// The appointments are stored in the [appointments] list and are loaded by the
  /// [loadAppointments] method. The [dayilyappointments] list contains the daily
  /// appointments for the selected date and is populated by the
  /// [getDayilyappointment] method.
  ///
  /// The [approveBooking] and [rejectBooking] methods are used to change the
  /// status of an appointment.
  ///
  /// The [isSameDay] method is used to check if two dates are the same.
  ///
  /// The [getFormatedDate] method is used to format a date as a string.

