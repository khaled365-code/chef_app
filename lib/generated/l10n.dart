// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Get started`
  String get getstarted {
    return Intl.message(
      'Get started',
      name: 'getstarted',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Chef App`
  String get welcome {
    return Intl.message(
      'Welcome to Chef App',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Please choose your language`
  String get chooselanguage {
    return Intl.message(
      'Please choose your language',
      name: 'chooselanguage',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `العربيه`
  String get arabic {
    return Intl.message(
      'العربيه',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Sign-up`
  String get signup {
    return Intl.message(
      'Sign-up',
      name: 'signup',
      desc: '',
      args: [],
    );
  }

  /// `Email address`
  String get emailaddress {
    return Intl.message(
      'Email address',
      name: 'emailaddress',
      desc: '',
      args: [],
    );
  }

  /// `password`
  String get password {
    return Intl.message(
      'password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Forgot passcode?`
  String get forgotpasscode {
    return Intl.message(
      'Forgot passcode?',
      name: 'forgotpasscode',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get fieldrequired {
    return Intl.message(
      'This field is required',
      name: 'fieldrequired',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get register {
    return Intl.message(
      'Sign up',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Chef App`
  String get chefApp {
    return Intl.message(
      'Chef App',
      name: 'chefApp',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back`
  String get welcomeBack {
    return Intl.message(
      'Welcome Back',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Login Sucessfully`
  String get loginSucessfully {
    return Intl.message(
      'Login Sucessfully',
      name: 'loginSucessfully',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Data`
  String get loginFailed {
    return Intl.message(
      'Invalid Data',
      name: 'loginFailed',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phone_number {
    return Intl.message(
      'Phone Number',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Send Reset Link`
  String get sendResetLink {
    return Intl.message(
      'Send Reset Link',
      name: 'sendResetLink',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email address below and we will send you a code via your mail to reset your password.`
  String get sendResetLinkInfo {
    return Intl.message(
      'Enter your email address below and we will send you a code via your mail to reset your password.',
      name: 'sendResetLinkInfo',
      desc: '',
      args: [],
    );
  }

  /// `Create Your New Password`
  String get createYourNewPassword {
    return Intl.message(
      'Create Your New Password',
      name: 'createYourNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Old Password`
  String get oldPassword {
    return Intl.message(
      'Old Password',
      name: 'oldPassword',
      desc: '',
      args: [],
    );
  }

  /// `Code`
  String get code {
    return Intl.message(
      'Code',
      name: 'code',
      desc: '',
      args: [],
    );
  }

  /// `Write some Description`
  String get description {
    return Intl.message(
      'Write some Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter valid E-mail`
  String get please_enter_email {
    return Intl.message(
      'Please Enter valid E-mail',
      name: 'please_enter_email',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter valid password`
  String get please_enter_valid_password {
    return Intl.message(
      'Please Enter valid password',
      name: 'please_enter_valid_password',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter valid Phone Number`
  String get please_enter_phone {
    return Intl.message(
      'Please Enter valid Phone Number',
      name: 'please_enter_phone',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter valid Name`
  String get please_enter_name {
    return Intl.message(
      'Please Enter valid Name',
      name: 'please_enter_name',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter valid Address`
  String get please_enter_address {
    return Intl.message(
      'Please Enter valid Address',
      name: 'please_enter_address',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter valid Social Media`
  String get please_enter_social {
    return Intl.message(
      'Please Enter valid Social Media',
      name: 'please_enter_social',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter valid Description`
  String get please_enter_desc {
    return Intl.message(
      'Please Enter valid Description',
      name: 'please_enter_desc',
      desc: '',
      args: [],
    );
  }

  /// `yes`
  String get yes {
    return Intl.message(
      'yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `no`
  String get no {
    return Intl.message(
      'no',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `L.E`
  String get le {
    return Intl.message(
      'L.E',
      name: 'le',
      desc: '',
      args: [],
    );
  }

  /// `Add Dish To Menu`
  String get addDishToMenu {
    return Intl.message(
      'Add Dish To Menu',
      name: 'addDishToMenu',
      desc: '',
      args: [],
    );
  }

  /// `Meal Name`
  String get mealName {
    return Intl.message(
      'Meal Name',
      name: 'mealName',
      desc: '',
      args: [],
    );
  }

  /// `Meal Description`
  String get mealDesc {
    return Intl.message(
      'Meal Description',
      name: 'mealDesc',
      desc: '',
      args: [],
    );
  }

  /// `Meal Price`
  String get mealPrice {
    return Intl.message(
      'Meal Price',
      name: 'mealPrice',
      desc: '',
      args: [],
    );
  }

  /// `Number`
  String get mealNumber {
    return Intl.message(
      'Number',
      name: 'mealNumber',
      desc: '',
      args: [],
    );
  }

  /// `Quantity`
  String get mealQuantity {
    return Intl.message(
      'Quantity',
      name: 'mealQuantity',
      desc: '',
      args: [],
    );
  }

  /// `Uplad Photo`
  String get upladPhoto {
    return Intl.message(
      'Uplad Photo',
      name: 'upladPhoto',
      desc: '',
      args: [],
    );
  }

  /// `Add To Menu`
  String get addToMenu {
    return Intl.message(
      'Add To Menu',
      name: 'addToMenu',
      desc: '',
      args: [],
    );
  }

  /// `Meal Added Sucessfully`
  String get mealAddedSucessfully {
    return Intl.message(
      'Meal Added Sucessfully',
      name: 'mealAddedSucessfully',
      desc: '',
      args: [],
    );
  }

  /// `mealDeletedSucessfully`
  String get mealDeletedSucessfully {
    return Intl.message(
      'mealDeletedSucessfully',
      name: 'mealDeletedSucessfully',
      desc: '',
      args: [],
    );
  }

  /// `Meal Updated Sucessfully`
  String get mealUpdatedSucessfully {
    return Intl.message(
      'Meal Updated Sucessfully',
      name: 'mealUpdatedSucessfully',
      desc: '',
      args: [],
    );
  }

  /// `Offline`
  String get offline {
    return Intl.message(
      'Offline',
      name: 'offline',
      desc: '',
      args: [],
    );
  }

  /// `Online`
  String get online {
    return Intl.message(
      'Online',
      name: 'online',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get editProfile {
    return Intl.message(
      'Edit Profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Logout Sucessfully`
  String get logoutSucessfully {
    return Intl.message(
      'Logout Sucessfully',
      name: 'logoutSucessfully',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Valid Meal Name`
  String get pleaseEnterValidMealName {
    return Intl.message(
      'Please Enter Valid Meal Name',
      name: 'pleaseEnterValidMealName',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Valid Meal Description`
  String get pleaseEnterValidMealDesc {
    return Intl.message(
      'Please Enter Valid Meal Description',
      name: 'pleaseEnterValidMealDesc',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Valid Meal Price`
  String get pleaseEnterValidMealPrice {
    return Intl.message(
      'Please Enter Valid Meal Price',
      name: 'pleaseEnterValidMealPrice',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Valid Meal Photo`
  String get pleaseEnterValidMealPhoto {
    return Intl.message(
      'Please Enter Valid Meal Photo',
      name: 'pleaseEnterValidMealPhoto',
      desc: '',
      args: [],
    );
  }

  /// `Check Your Mail`
  String get checkMail {
    return Intl.message(
      'Check Your Mail',
      name: 'checkMail',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Valid Code`
  String get pleaseEnterValidCode {
    return Intl.message(
      'Please Enter Valid Code',
      name: 'pleaseEnterValidCode',
      desc: '',
      args: [],
    );
  }

  /// `Password Changed Sucessfully`
  String get passwordChangedSucessfully {
    return Intl.message(
      'Password Changed Sucessfully',
      name: 'passwordChangedSucessfully',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Valid Number`
  String get pleaseEnterValidNumber {
    return Intl.message(
      'Please Enter Valid Number',
      name: 'pleaseEnterValidNumber',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message(
      'Camera',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get gallery {
    return Intl.message(
      'Gallery',
      name: 'gallery',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
