import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/create_bio_data_screen/controller/address_controller.dart';
import 'package:islamic_marriage/screens/create_bio_data_screen/model/test_data.dart';
import 'package:islamic_marriage/screens/my_bio_data_screen/controller/my_bio_data_controller.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_text_styles.dart';
import 'package:islamic_marriage/utils/validator.dart';
import 'package:islamic_marriage/screens/create_bio_data_screen/widgets/input_title_text.dart';
import 'package:islamic_marriage/widgets/common_widgets/custom_drop_down_button1.dart';
import 'package:islamic_marriage/widgets/common_widgets/custom_text_form_field.dart';

class AddressForm extends StatefulWidget {
  const AddressForm({super.key});

  @override
  State<AddressForm> createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  final AddressController _addressController = Get.find<AddressController>();
  final _address = Get.find<MyBioDataController>().myBioData!.address;
  late List<Division> divisions;


  @override
  void initState() {
    super.initState();
    divisions = getDivisions;
    if(_address != null){
      List<String> addressParts = _address.permanentAddress!.split(',');
      for(final division in divisions){
        if(division.name.toLowerCase() == addressParts[0].trim().toLowerCase()){
          _addressController.selectedDivision = division;
          break;
        }
      }
      if(_addressController.selectedDivision != null){
        for(final district in _addressController.selectedDivision!.districts){
          if(district.name.toLowerCase() == addressParts[1].trim().toLowerCase()){
            _addressController.selectedDistrict = district;
            break;
          }
        }
      }
      if(_addressController.selectedDistrict != null){
        for(final subDistrict in _addressController.selectedDistrict!.subDistricts){
          if(subDistrict.name.toLowerCase() == addressParts[2].trim().toLowerCase()){
            _addressController.selectedSubDistrict = subDistrict;
            break;
          }
        }
      }
      _addressController.presentAreaController.text = addressParts[3];
      _addressController.isSameAsPermanent = _address.isSameCurrentAddress!;
      _addressController.growUpController.text = _address.growUp!;
    }
    else{
      print('Address is null');
    }
  }



  @override
  Widget build(BuildContext context) {
    return Form(
      key: _addressController.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const InputTitleText(title: 'Permanent Address'),
          Gap(4.h),
          CustomDropdownButton1<Division>(
            validator: dropdownValidator,
            value: _addressController.selectedDivision,
            items: divisions,
            onChanged: (value) {
              setState(() {
                _addressController.selectedDivision = value;
                _addressController.selectedDistrict = null;
                _addressController.selectedSubDistrict = null;
              });
            },
          ),
          Gap(8.h),
          Row(
            children: [
              Expanded(
                child: CustomDropdownButton1<District>(
                  validator: dropdownValidator,
                  value: _addressController.selectedDistrict,
                  items: _addressController.selectedDivision?.districts ?? [],
                  onChanged: (value) {
                    setState(() {
                      _addressController.selectedDistrict = value;
                      _addressController.selectedSubDistrict = null;
                    });
                  },
                ),
              ),
              Gap(8.w),
              Expanded(
                child: CustomDropdownButton1<SubDistrict>(
                  validator: dropdownValidator,
                  value: _addressController.selectedSubDistrict,
                  items: _addressController.selectedDistrict?.subDistricts ?? [],
                  onChanged: (value) {
                    setState(() {
                      _addressController.selectedSubDistrict = value;
                    });
                  },
                ),
              ),
            ],
          ),
          Gap(8.h),
          CustomTextFormField(
              hintText: 'Area Name',
              controller: _addressController.permanentAreaController),
          Gap(4.h),
          Text(
              'Write the name of the village or area without entering the house number. Example- Mirpur 10, Baghmara',
              style: AppTextStyles.bodySmall(color: AppColors.violetClr)),
          Gap(16.h),
          const InputTitleText(title: 'Present Address'),
          Row(
            children: [
              Checkbox(
                  value: _addressController.isSameAsPermanent,
                  onChanged: (newValue) {
                    setState(() {
                      _addressController.isSameAsPermanent = newValue!;
                    });
                  },
                  checkColor: AppColors.whiteClr,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  activeColor: AppColors.violetClr),
              Text(
                'Same as permanent address',
                style: AppTextStyles.bodyMedium(),
              )
            ],
          ),
          Visibility(
            visible: _addressController.isSameAsPermanent,
            replacement: Column(
              children: [
                CustomDropdownButton1<Division>(
                  validator: dropdownValidator,
                  value: _addressController.selectedDivision1,
                  items: divisions,
                  onChanged: (value) {
                    setState(() {
                      _addressController.selectedDivision1 = value;
                      _addressController.selectedDistrict1 = null;
                      _addressController.selectedSubDistrict1 = null;
                    });
                  },
                ),
                Gap(8.h),
                Row(
                  children: [
                    Expanded(
                      child: CustomDropdownButton1<District>(
                        validator: dropdownValidator,
                        value: _addressController.selectedDistrict1,
                        items: _addressController.selectedDivision1?.districts ?? [],
                        onChanged: (value) {
                          setState(() {
                            _addressController.selectedDistrict1 = value;
                            _addressController.selectedSubDistrict1 = null;
                          });
                        },
                      ),
                    ),
                    Gap(8.w),
                    Expanded(
                      child: CustomDropdownButton1<SubDistrict>(
                        validator: dropdownValidator,
                        value: _addressController.selectedSubDistrict1,
                        items:
                        _addressController.selectedDistrict1?.subDistricts ?? [],
                        onChanged: (value) {
                          setState(() {
                            _addressController.selectedSubDistrict1 = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Gap(8.h),
                CustomTextFormField(
                    hintText: 'Area Name', controller: _addressController.presentAreaController),
                Gap(4.h),
                Text(
                    'Write the name of the village or area without entering the house number. Example- Mirpur 10, Baghmara',
                    style: AppTextStyles.bodySmall(color: AppColors.violetClr)),
              ],
            ),
            child: const SizedBox(),
          ),
          Gap(16.h),
          const InputTitleText(title: 'Where did you grow up?'),
          Gap(4.h),
          CustomTextFormField(
              validator: requiredValidator,
              hintText: 'Grow Up',
              controller: _addressController.growUpController),
          Gap(16.h),
        ],
      ),
    );
  }
}
