import 'package:get/get.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ar': {
          'Hello': 'مرحباً',
          'Welcome': 'أهلاً وسهلاً',
          'GetFreeConsultation': 'احصل على استشارة طبية مجانية الآن',
          'SignUp': 'تسجيل الدخول',
          'Login': 'تسجيل الدخول',
          'FirstName': 'الاسم الأول',
          'LastName': 'الاسم الأخير',
          'Email': 'البريد الإلكتروني',
          'Password': 'كلمة المرور',
          'PhoneNumber': 'رقم الهاتف',
          'Age': 'العمر',
          'Gender': 'الجنس',
          'Male': 'ذكر',
          'Female': 'أنثى',
          'ForgotPassword': 'هل نسيت كلمة المرور؟',
          'NewPassword': 'كلمة مرور جديدة',
          'ConfirmPassword': 'تأكيد كلمة المرور',
          'Confirm': 'تأكيد',
          'welcome_message_medical_support_gaza':
              'مرحبًا بك في الدعم الطبي غزة! نحن هنا لمساعدتك في الحصول على استشارات طبية موثوقة وآمنة في أي وقت.',
          'select_account_type_message':
              'نحن هنا لخدمتك. يرجى تحديد نوع حسابك لتستمتع بالخدمات المناسبة لك',
          'next': 'التالي',
          'skip': 'تخطي',
          'doctor_team_welcome_message': 'نحن سعداء بانضمامك لفريق الأطباء',
          'welcome_doctor_message':
              'أهلًا بك في الدعم الطبي غزة، حيث يمكنك تقديم رعايتك الطبية للعديد من المرضى. نحن هنا لدعمك في جعل كل استشارة أكثر فعالية',
          'doctor': 'الدكتور',
          'patient': 'المريض',
          // Validation Messages
          'enter_email': 'يرجى إدخال البريد الإلكتروني',
          'valid_email': 'يرجى إدخال بريد إلكتروني صحيح',
          'enter_password': 'يرجى إدخال كلمة المرور',
          'valid_password': 'كلمة المرور يجب ان تحتوي على أكثر من 8 حروف ',
          'enter_name': 'يرجى إدخال الاسم',
          'enter_phone': 'يرجى إدخال رقم الهاتف',
          'valid_phone': 'يرجى إدخال رقم هاتف صحيح',
          'enter_age': 'يرجى إدخال العمر',
          'valid_age': 'يرجى إدخال عمر صحيح',
          'ResendOTP': 'أرسل OTP مرة أخرى',
          'EnterOTP': 'أدخل OTP',
          'CreateAccountNow': ' أنشئ حساب الآن',
          'DontHaveAccount': 'لا تمتلك حساب؟',
          'AlreadyHaveAccount': 'لديك حساب بالفعل؟',
          'SignIn': ' سجل دخولك',
          'Error': 'خطأ',
          'PleaseEnterCompleteOTP': 'يرجى إدخال رمز التحقق كاملاً',
          'SendOTP': 'إرسال رمز التحقق',
          'Hello, User Name': 'مرحباً، اسم المستخدم',
          'Upcoming Appointments': 'المواعيد القادمة',
          'Schedule New Appointment': 'جدولة موعد جديد',
          'MedicalRecords': 'السجل الطبي',
          'BookAppointment': 'حجز موعد',
          'SelectSpecialization': 'اختر التخصص',
          'Specialization 1': 'تخصص 1',
          'Specialization 2': 'تخصص 2',
          'Specialization 3': 'تخصص 3',
          'Specialization 4': 'تخصص 4',
          'Specialization 5': 'تخصص 5',
          'Specialization 6': 'تخصص 6',
          'Next': 'التالي',
          'Dr. Ahmed Mohammed': 'د. أحمد محمد',
          'Dr. Ali Mohammed': 'د. علي محمد',
          'Dr. Samy Ahmed': 'د. سامي أحمد',
          'Today': 'اليوم',
          'Tomorrow': 'غداً',
          '10:30 AM': '10:30 ص',
          '8:30 AM': '8:30 ص',
          '12:30 AM': '12:30 ص',
          'Cardiology': 'أمراض القلب',

          'country': 'الدولة',
          'speciality': 'التخصص',
          'upload_medical_certificate': 'تحميل الشهادة الطبية',
          'enter_conutry': 'يرجى إدخال دولتك',
          'valid_conutry': 'يرجى إدخال اسم بلدك الصحيح',
          'enter_speciality': 'الرجاء إدخال تخصصك',
          'valid_speciality': 'الرجاء إدخال تخصصك الصحيح',
          'confirmation_maessage': 'تاكد من تطابق كلمة المرور المدخلة',
          'file_selected': 'تم تحديد الملف',
          'file_not_selected': 'لم يتم تحديد أي ملف',
          'file_selected_message': 'الملف',
          'file_not_selected_message': 'الرجاء اختيار ملف',
          'file_error_message': ':خطأ في اختيار الملف',
          'settings': 'الاعدادات',
          'technical_support': 'الدعم الفني',
          'language': 'اللغة',
          'logout': 'تسجيل الخروج',
          'edit_profile': 'تعديل الملف الشخصي',
          'change_profile_picture': 'تغيير الصورة الشخصية',
          'take_photo': 'التقاط صورة',
          'choose_from_gallery': 'اختيار من المعرض',
          'logout_confirmation': 'تسجيل الخروج',
          'logout_message': 'هل أنت متأكد من تسجيل الخروج؟',
          'cancel': 'إلغاء',
          'confirm': 'تأكيد',
          'home': 'الرئيسية',
          'doctors': 'الأطباء',
          'chats': 'المحادثات',
          'profile': 'الملف الشخصي',
          'arabic': 'العربية',
          'english': 'English',
          'select_language': 'اختر اللغة',
          // doctor translations
          'time_management': ' ادارة المواعيد',
          'No Upcoming Appointments': 'لا توجد مواعيد قادمة',
          'Schedule an appointment to get started': 'قم بجدولة موعد للبدء',
          'The email address is badly formatted':
              'تنسيق البريد الإلكتروني غير صحيح',
          'This user account has been disabled': 'تم تعطيل حساب المستخدم هذا',
          'No user found with this email':
              'لم يتم العثور على مستخدم بهذا البريد الإلكتروني',
          'Incorrect password': 'كلمة المرور غير صحيحة',
          'An account already exists with this email':
              'يوجد حساب بالفعل بهذا البريد الإلكتروني',
          'This sign in method is not allowed':
              'طريقة تسجيل الدخول هذه غير مسموح بها',
          'The password provided is too weak': 'كلمة المرور المقدمة ضعيفة جداً',
          'Too many sign in attempts. Please try again later':
              'محاولات تسجيل دخول كثيرة. يرجى المحاولة لاحقاً',
          'Please check your internet connection':
              'يرجى التحقق من اتصال الإنترنت',
          'Invalid verification code': 'رمز التحقق غير صالح',
          'Invalid verification ID': 'معرف التحقق غير صالح',
          'An error occurred. Please try again':
              'حدث خطأ. يرجى المحاولة مرة أخرى',
          'Unknown error occurred': 'حدث خطأ غير معروف',
          'Appointment Type': 'نوع الموعد',
          'New Appointment': 'موعد جديد',
          'Follow Up': 'متابعة',
          'Select Previous Appointment': 'اختر الموعد السابق',
          'No previous appointments found': 'لا توجد مواعيد سابقة',
          'Selected time slot is no longer available':
              'الموعد المحدد لم يعد متاحاً',
          'Please select the previous appointment':
              'الرجاء اختيار الموعد السابق',
          // doctor appointment management translation
          'morning_period': "الفترة الصباحية",
          'evening_period': 'الفترة المسائية',
          'date': 'اليوم',
          'add': 'اضافة',
          'evening_period_time': ' من 12:00 م الى 3:00 م',
          'morning_period_time': 'من 8:00 ص الى 11:00 ص',
          'appointments_title_massage': 'ما هي المواعيد المتاحة لديك؟',

          // months
          "January": "يناير",
          "February": 'فبراير',
          "March": 'مارس',
          "April": 'ابريل',
          "May": 'مايو',
          "June": 'يونيو',
          "July": 'يوليو',
          "August": 'اغسطس',
          "September": 'سبتمبر',
          "October": 'اكتوبر',
          "November": 'نوفمبر',
          "December": 'ديسمبر',

          // DAYS
          "Sunday": 'الأحد',
          "Monday": 'الاثنين',
          "Tuesday": 'الثلاثاء',
          "Wednesday": 'الأربعاء',
          "Thursday": 'الخميس',
          "Friday": 'الجمعة',
          "Saturday": 'السبت',

          'daily_schedule': 'جدول المواعيد اليومية',
          'no_appointment_message': 'لا يوجد مواعيد حالياً',
          'cancel_appointment': 'الغاء الموعد',
          'more': 'المزيد>',
          'quick_statistics': 'الاحصائيات السريعة',
          'Number of unread messages': 'عدد الرسائل غير المقروءة',
          'Unread message from patients': 'رسالة غير مقروءة من المرضى',
          'Show details': 'عرض التفاصيل',
          'Dashboard': 'لوحة التحكم',
          'userManagment': 'إدارة المستخدمين',
          'contentManagment': 'إدارة المحتوى',
          'serviceManagment': 'إدارة الخدمات',

          // User Management Screen
          'search': 'بحث',
          'patients': 'المرضى',
          'doctors': 'الأطباء',
          'no_patients_found': 'لا يوجد مرضى',
          'no_doctors_found': 'لا يوجد أطباء',
          'send_email': 'ارسال رسالة عبر البريد الالكتروني',
          'delete_user': 'حذف المستخدم',
          'delete_confirmation': 'هل أنت متأكد من حذف هذا المستخدم؟',
          'yes': 'نعم',
          'no': 'لا',
          'delete_success': 'تم حذف المستخدم بنجاح',
          'delete_error': 'حدث خطأ أثناء حذف المستخدم',
          'email_sent': 'تم إرسال البريد الإلكتروني بنجاح',
          'email_error': 'حدث خطأ أثناء إرسال البريد الإلكتروني',
          'refresh_error': 'حدث خطأ أثناء تحديث البيانات',
          'loading': 'جاري التحميل...',
          'user_management': 'إدارة المستخدمين',
          'confirm_delete': 'تأكيد الحذف',
          'error': 'خطأ',
          'success': 'نجاح',

          // Content Management
          'content_management': 'إدارة المحتوى',
          'content_list': 'المحتوى',
          'add_new': 'إضافة جديد',
          'search': 'بحث',
          'no_content': 'لا يوجد محتوى',
          'article_title': 'عنوان المقال',
          'enter_article_title': 'أدخل عنوان المقال',
          'article_content': 'محتوى المقال',
          'write_article_content': 'اكتب محتوى المقال...',
          'publish': 'نشر',
          'title_required': 'العنوان مطلوب',
          'content_required': 'المحتوى مطلوب',
          'content_saved': 'تم حفظ المحتوى بنجاح',
          'save_error': 'فشل في حفظ المحتوى',
          'load_error': 'فشل في تحميل المحتوى',

          // Health Content
          'flu_protection': 'كيف تحمي نفسك من الإنفلونزا؟',
          'seasonal_precautions':
              'تعرف على أهم الإجراءات الوقائية من الإنفلونزا خلال المواسم',
          'health': 'صحة',
          'prevention': 'وقاية',
          'flu': 'إنفلونزا',

          'article_image': 'صورة المقال',
          'tap_to_upload_image': 'انقر لتحميل صورة',
          'image_pick_error': 'فشل في اختيار الصورة',
          'image_required': 'الصورة مطلوبة',

          'Bookings': 'الحجوزات',
          'Approve': 'موافقة',
          'Reject': 'رفض',
          'Status': 'الحالة',
          'Approved': 'مقبول',
          'Pending': 'قيد الانتظار',
        },
        'en': {
          'Hello': 'Hello',
          'Welcome': 'Welcome',
          'GetFreeConsultation': 'Get a free medical consultation now',
          'SignUp': 'Sign Up',
          'Login': 'Login',
          'FirstName': 'First Name',
          'LastName': 'Last Name',
          'Email': 'Email',
          'Password': 'Password',
          'PhoneNumber': 'Phone Number',
          'Age': 'Age',
          'Gender': 'Gender',
          'Male': 'Male',
          'Female': 'Female',
          'ForgotPassword': 'Forgot Password?',
          'NewPassword': 'New Password',
          'ConfirmPassword': 'Confirm Password',
          'Confirm': 'Confirm',

          'welcome_message_medical_support_gaza':
              'Welcome to Medical Support Gaza! We are here to assist you in obtaining reliable and safe medical consultations anytime.',
          'select_account_type_message':
              'We are here to serve you. Please select your account type to enjoy the services tailored to your needs.',
          'next': 'Next',
          'skip': 'Skip',
          'doctor_team_welcome_message':
              'We are happy to have you join the team of doctors.',
          'welcome_doctor_message':
              'Welcome to Medical Support Gaza, where you can provide your medical care to many patients. We are here to support you in making every consultation more effective.',
          'doctor': 'Doctor',
          'patient': 'Patient',
          // Validation Messages
          'enter_email': 'Please enter your email',
          'valid_email': 'Please enter a valid email',
          'enter_password': 'Please enter your password',
          'valid_password': 'Password must be at least 8 characters',
          'enter_name': 'Name is required',
          'enter_phone': 'Phone number is required',
          'valid_phone': 'Enter a valid phone number',
          'enter_age': 'Please enter your age',
          'valid_age': 'Please enter a valid age',
          'AlreadyHaveAccount': 'Already have an account? ',
          'CreateAccountNow': ' Create Account Now',
          'DontHaveAccount': 'Don\'t have an account?',
          'SignIn': 'Sign In',
          'EnterOTP': 'Enter OTP',
          'Error': 'Error',
          'PleaseEnterCompleteOTP': 'Please enter complete OTP',
          'SendOTP': 'Send OTP',
          'settings': 'Settings',
          'technical_support': 'Technical Support',
          'language': 'Language',
          'logout': 'Logout',
          'edit_profile': 'Edit Profile',
          'change_profile_picture': 'Change Profile Picture',
          'take_photo': 'Take Photo',
          'choose_from_gallery': 'Choose from Gallery',
          'logout_confirmation': 'Logout',
          'logout_message': 'Are you sure you want to logout?',
          'cancel': 'Cancel',
          'confirm': 'Confirm',
          'home': 'Home',
          'doctors': 'Doctors',
          'chats': 'Chats',
          'profile': 'Profile',
          'arabic': 'Arabic',
          'english': 'English',
          'select_language': 'Select Language',
          'No Upcoming Appointments': 'No Upcoming Appointments',
          'Schedule an appointment to get started':
              'Schedule an appointment to get started',
          'The email address is badly formatted':
              'The email address is badly formatted',
          'This user account has been disabled':
              'This user account has been disabled',
          'No user found with this email': 'No user found with this email',
          'Incorrect password': 'Incorrect password',
          'An account already exists with this email':
              'An account already exists with this email',
          'This sign in method is not allowed':
              'This sign in method is not allowed',
          'The password provided is too weak':
              'The password provided is too weak',
          'Too many sign in attempts. Please try again later':
              'Too many sign in attempts. Please try again later',
          'Please check your internet connection':
              'Please check your internet connection',
          'Invalid verification code': 'Invalid verification code',
          'Invalid verification ID': 'Invalid verification ID',
          'An error occurred. Please try again':
              'An error occurred. Please try again',
          'Unknown error occurred': 'Unknown error occurred',
          'Appointment Type': 'Appointment Type',
          'New Appointment': 'New Appointment',
          'Follow Up': 'Follow Up',
          'Select Previous Appointment': 'Select Previous Appointment',
          'No previous appointments found': 'No previous appointments found',
          'Selected time slot is no longer available':
              'Selected time slot is no longer available',
          'Please select the previous appointment':
              'Please select the previous appointment',
          // doctor appointment management translation
          'morning_period': 'Morning Period',
          'evening_period': 'Evening period',
          'date': 'Date',
          'add': 'Add',
          'evening_period_time': ' frome 12:00 pm to 3:00 pm',
          'morning_period_time': 'from 8:00 am  to 11:00 am',
          'appointments_title_massage':
              'What appointments do you have available?',

          // months
          "January": "Jan",
          "February": 'Feb',
          "March": 'Mar',
          "April": 'Apr',
          "May": 'May',
          "June": 'Jun',
          "July": 'Jul',
          "August": 'Aug',
          "September": 'Sep',
          "October": 'Oct',
          "November": 'Nov',
          "December": 'Dec',

          // DAYS
          "Sunday": 'Sun',
          "Monday": 'Mon',
          "Tuesday": 'Tue',
          "Wednesday": 'Wed',
          "Thursday": 'Thu',
          "Friday": 'Fri',
          "Saturday": 'Sat',

          'time_management': 'Time Management',
          'daily_schedule': 'Daily appointment schedule',
          'no_appointment_message': 'No appointments currently',
          'cancel_appointment': 'Cancel Appointment',
          'more': 'more >',
          'quick_statistics': 'Quick Statistics',
          'Number of unread messages': 'Number of unread messages',
          'Unread message from patients': 'Unread message from patients',
          'Show details': 'Show details',

          'Dashboard': 'Dashboard',
          'userManagment': 'User Management',
          'contentManagment': 'Content Management',
          'serviceManagment': 'Service Management',

          // User Management Screen
          'search': 'Search',
          'patients': 'Patients',
          'no_patients_found': 'No patients found',
          'no_doctors_found': 'No doctors found',
          'send_email': 'Send Email',
          'delete_user': 'Delete User',
          'delete_confirmation': 'Are you sure you want to delete this user?',
          'yes': 'Yes',
          'no': 'No',
          'delete_success': 'User deleted successfully',
          'delete_error': 'Error deleting user',
          'email_sent': 'Email sent successfully',
          'email_error': 'Error sending email',
          'refresh_error': 'Error refreshing data',
          'loading': 'Loading...',
          'user_management': 'User Management',
          'confirm_delete': 'Confirm Delete',
          'error': 'Error',
          'success': 'Success',

          // Content Management
          'content_management': 'Content Management',
          'content_list': 'Content',
          'add_new': 'Add New',
          'no_content': 'No content available',
          'article_title': 'Article Title',
          'enter_article_title': 'Enter article title',
          'article_content': 'Article Content',
          'write_article_content': 'Write article content...',
          'publish': 'Publish',
          'title_required': 'Title is required',
          'content_required': 'Content is required',
          'content_saved': 'Content saved successfully',
          'save_error': 'Failed to save content',
          'load_error': 'Failed to load content',

          // Health Content
          'flu_protection': 'How to Protect Yourself from the Flu?',
          'seasonal_precautions':
              'Learn about important preventive measures against flu during seasons',
          'health': 'Health',
          'prevention': 'Prevention',
          'flu': 'Flu',
          'article_image': 'Article Image',
          'tap_to_upload_image': 'Tap to upload image',
          'image_pick_error': 'Failed to pick image',
          'image_required': 'Image is required',

          'Bookings': 'Bookings',
          'Approve': 'Approve',
          'Reject': 'Reject',
          'Status': 'Status',
          'Approved': 'Approved',
          'Pending': 'Pending',
        },
      };
}
