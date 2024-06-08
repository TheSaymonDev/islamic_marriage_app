import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:islamic_marriage/screens/home_screen/home_screen.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/widgets/custom_appbar/custom_appbar.dart';
import 'package:islamic_marriage/widgets/custom_drop_down_button.dart';
import 'package:islamic_marriage/widgets/custom_elevated_button.dart';
import 'package:islamic_marriage/widgets/custom_text_form_field.dart';


class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _postalController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();
  final _bookingDateController = TextEditingController();
  final _desController = TextEditingController();

  final List<String> _state = ['Dhaka', 'Chittagong', 'Khulna'];
  String _selectedState = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        onPressedBack: () {
          Get.back();
        },
        title: 'Booking Screen',
      ),
      body: Container(
        height: double.infinity.h,
        width: double.infinity.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Gap(16.h),
              CustomTextFormField(hintText: 'Name', controller: _nameController),
              Gap(16.h),
              CustomTextFormField(
                  hintText: 'Phone Number', controller: _phoneController),
              Gap(16.h),
              CustomDropdownButton(
                  items: _state,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedState = newValue!;
                    });
                  },
                  hintText: 'State'),
              Gap(16.h),
              CustomTextFormField(
                  hintText: 'Postal Code', controller: _postalController),
              Gap(16.h),
              CustomTextFormField(
                  hintText: 'Email', controller: _emailController),
              Gap(16.h),
              CustomTextFormField(
                  hintText: 'Address', controller: _addressController),
              Gap(16.h),
              CustomTextFormField(
                hintText: 'Booking Date',
                controller: _bookingDateController,
                suffixIcon: IconButton(
                    onPressed: () async {
                      DateTime? selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2001),
                        lastDate: DateTime(2024, 12, 31),
                      );
                      if (selectedDate != null) {
                        // Update your controller with the selected date
                        _bookingDateController.text =
                            DateFormat('dd/MM/yyyy').format(selectedDate);
                      }
                    },
                    icon: Icon(
                      Icons.calendar_today,
                      size: 20.sp,
                      color: AppColors.violetClr,
                    )),
                readOnly: true,
              ),
              Gap(16.h),
              CustomTextFormField(
                hintText: 'Description',
                controller: _desController,
                maxLines: 5,
              ),
              Gap(32.h),
              CustomElevatedButton(onPressed: (){
                Get.to(()=>const HomeScreen());
              }, buttonName: 'Submit')
            ],
          ),
        ),
      ),
    );
  }
}
