import 'package:flutter/material.dart';
import 'package:get/get.dart';

String? passwordValidator(value) {
  if (value!.isEmpty) {
    return 'Please enter a password.';
  }
  if (value.length < 6) {
    return 'Password must be at least 6 characters long.';
  }
  return null;
}

String? nameValidator(value) {
  if (value!.isEmpty) {
    return 'Please enter your name.';
  }
  return null;
}

String? emailValidator(value) {
  if (value!.isEmpty) {
    return 'Please enter your email address.';
  }
  if (!RegExp(r'[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}')
      .hasMatch(value)) {
    return 'Please enter a valid email address.';
  }
  return null;
}

String? phoneValidator(value) {
  final RegExp bdNumberRegex = RegExp(r"^(?:\+?88|0088)?01[3456789]\d{8}$");
  if (value!.isEmpty) {
    return 'Please enter your mobile number.';
  }
  if (!bdNumberRegex.hasMatch(value)) {
    return 'Please enter a valid mobile number.';
  }
  return null;
}

String? pinValidator(value) {
  final RegExp pinRegex =
  RegExp(r'^[0-9]{6}$'); // 4-digit PIN (adjust regex if needed)
  if (value!.isEmpty) {
    return 'Please enter your PIN.';
  }
  if (!pinRegex.hasMatch(value)) {
    return 'Please enter a valid 6-digit PIN.'; // Adjust error message if needed
  }
  return null;
}

String? identifierValidator(value) {
  if (value.isEmpty) {
    return 'Please enter your email address or mobile number.';
  }

  // Check for email format first
  if (RegExp(r'[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}')
      .hasMatch(value)) {
    return null; // Valid email
  }

  // Then check for mobile number format (replace bdNumberRegex with your specific mobile number format)
  final RegExp mobileNumberRegex = RegExp(r"^(?:\+?88|0088)?01[15-9]\d{8}$"); // Replace with your mobile format regex
  if (mobileNumberRegex.hasMatch(value)) {
    return null; // Valid mobile number
  }

  // If none of the above match, return error message
  return 'Please enter a valid email address or mobile number.';
}

String? confirmPasswordValidator(
    String? value, TextEditingController newPasswordController) {
  if (value!.isEmpty) {
    return 'Please confirm your password.';
  }
  if (value != newPasswordController.text) {
    return 'Passwords do not match.';
  }
  return null;
}

String? dropdownValidator(value) {
  if (value == null) {
    return 'dropDownValidationMsg'.tr;
  }
  return null;
}

String? dobValidator(value) {
  if (value == null || value.isEmpty) {
    return 'dobValidationMsg'.tr;
  }
  return null;
}

String? notEmptyValidator(value, message) {
  if (value!.isEmpty) {
    return message;
  }
  return null;
}

String? requiredValidator(value) {
  if (value!.isEmpty) {
    return 'fieldRequiredMsg'.tr;
  }
  return null;
}