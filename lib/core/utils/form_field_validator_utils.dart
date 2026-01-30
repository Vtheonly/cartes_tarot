import 'package:dartz/dartz.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../error/failures/failures.dart';

abstract class FormFielsValidatorUtils {
  MultiValidator get passwordValidator;
  MultiValidator get emaildValidator;
  MultiValidator get phoneNumberValidator;
  MultiValidator get smsCodeValidator;
  Either<PhoneNumberFormatFailure, void> isValidPhoneNumber(String phoneNumber);
  Either<SmsCodeFormatFailure, void> isValidSmsCode(String smsCode);
}

class FormFielsValidatorUtilsImpl implements FormFielsValidatorUtils {
  const FormFielsValidatorUtilsImpl();
  @override
  MultiValidator get passwordValidator => MultiValidator([
        RequiredValidator(errorText: 'Password is required'),
        MinLengthValidator(8,
            errorText: 'password must be at least 8 digits long'),
        PatternValidator(r'(?=.*?[#?!@$%^&*-])',
            errorText: 'passwords must have at least one special character')
      ]);

  @override
  MultiValidator get emaildValidator => MultiValidator([
        RequiredValidator(errorText: 'Email is required'),
        EmailValidator(errorText: "Enter a valid email address"),
      ]);

  @override
  MultiValidator get phoneNumberValidator => MultiValidator([
        RequiredValidator(errorText: 'Phone number is required'),
        LengthRangeValidator(
            min: 10, max: 10, errorText: 'Must be exactly 10 digits long'),
        PatternValidator(r'^[0-9]+$', errorText: 'Must contain only digits'),
        PatternValidator(r'^0+[567]+[0-9]+$',
            errorText: 'Invalid phone number'),
      ]);

  @override
  MultiValidator get smsCodeValidator => MultiValidator([
        RequiredValidator(errorText: 'Sms code is required'),
        LengthRangeValidator(
            min: 6, max: 6, errorText: 'Must be exactly 6 digits long'),
        PatternValidator(r'^[0-9]+$', errorText: 'Must contain only digits'),
      ]);

  @override
  Either<PhoneNumberFormatFailure, void> isValidPhoneNumber(
          String phoneNumber) =>
      phoneNumberValidator.isValid(phoneNumber)
          ? const Right(null)
          : const Left(PhoneNumberFormatFailure());

  @override
  Either<SmsCodeFormatFailure, void> isValidSmsCode(String smsCode) =>
      smsCodeValidator.isValid(smsCode)
          ? const Right(null)
          : const Left(SmsCodeFormatFailure());
}
