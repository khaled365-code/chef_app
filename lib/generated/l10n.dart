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

  /// `Forget password`
  String get forgetpassword {
    return Intl.message(
      'Forget password',
      name: 'forgetpassword',
      desc: '',
      args: [],
    );
  }

  /// `Forgot passcode ?`
  String get forgotpasscode {
    return Intl.message(
      'Forgot passcode ?',
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

  /// `Signup Sucessfully`
  String get signupSucessfully {
    return Intl.message(
      'Signup Sucessfully',
      name: 'signupSucessfully',
      desc: '',
      args: [],
    );
  }

  /// `Signup Failld`
  String get signupFailed {
    return Intl.message(
      'Signup Failld',
      name: 'signupFailed',
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

  /// `Send Code`
  String get sendcode {
    return Intl.message(
      'Send Code',
      name: 'sendcode',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verify {
    return Intl.message(
      'Verify',
      name: 'verify',
      desc: '',
      args: [],
    );
  }

  /// `Show Password`
  String get showpassword {
    return Intl.message(
      'Show Password',
      name: 'showpassword',
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

  /// `Enter your email address we will`
  String get sendResetemail {
    return Intl.message(
      'Enter your email address we will',
      name: 'sendResetemail',
      desc: '',
      args: [],
    );
  }

  /// `Send you code to reset password`
  String get sendResetcode {
    return Intl.message(
      'Send you code to reset password',
      name: 'sendResetcode',
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

  /// `Passwords doesn't match!`
  String get confirmPasswordError {
    return Intl.message(
      'Passwords doesn\'t match!',
      name: 'confirmPasswordError',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter valid Brand Name`
  String get pleaseEnterBrandName {
    return Intl.message(
      'Please Enter valid Brand Name',
      name: 'pleaseEnterBrandName',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter valid Charge `
  String get pleaseEnterMinumumCharge {
    return Intl.message(
      'Please Enter valid Charge ',
      name: 'pleaseEnterMinumumCharge',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter valid Location `
  String get pleaseEnterValidLocation {
    return Intl.message(
      'Please Enter valid Location ',
      name: 'pleaseEnterValidLocation',
      desc: '',
      args: [],
    );
  }

  /// `Disc length must be at least 20 characters`
  String get pleaseDiscLength {
    return Intl.message(
      'Disc length must be at least 20 characters',
      name: 'pleaseDiscLength',
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

  /// `Meal Not Added Sucessfully`
  String get mealNotAddedSucessfully {
    return Intl.message(
      'Meal Not Added Sucessfully',
      name: 'mealNotAddedSucessfully',
      desc: '',
      args: [],
    );
  }

  /// `Meal Deleted Sucessfully`
  String get mealDeletedSucessfully {
    return Intl.message(
      'Meal Deleted Sucessfully',
      name: 'mealDeletedSucessfully',
      desc: '',
      args: [],
    );
  }

  /// `Meal Not Deleted Sucessfully`
  String get mealNotDeletedSucessfully {
    return Intl.message(
      'Meal Not Deleted Sucessfully',
      name: 'mealNotDeletedSucessfully',
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

  /// `Location`
  String get location {
    return Intl.message(
      'Location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Brand Name`
  String get brandname {
    return Intl.message(
      'Brand Name',
      name: 'brandname',
      desc: '',
      args: [],
    );
  }

  /// `Minumum Charge`
  String get mincharge {
    return Intl.message(
      'Minumum Charge',
      name: 'mincharge',
      desc: '',
      args: [],
    );
  }

  /// `Discreption`
  String get disc {
    return Intl.message(
      'Discreption',
      name: 'disc',
      desc: '',
      args: [],
    );
  }

  /// `Delicious`
  String get delicious {
    return Intl.message(
      'Delicious',
      name: 'delicious',
      desc: '',
      args: [],
    );
  }

  /// `food for you`
  String get foodforyou {
    return Intl.message(
      'food for you',
      name: 'foodforyou',
      desc: '',
      args: [],
    );
  }

  /// `Delete meal ? `
  String get deletemeal {
    return Intl.message(
      'Delete meal ? ',
      name: 'deletemeal',
      desc: '',
      args: [],
    );
  }

  /// `No meals yet`
  String get nomealsyet {
    return Intl.message(
      'No meals yet',
      name: 'nomealsyet',
      desc: '',
      args: [],
    );
  }

  /// `Hit the orange button`
  String get hitorangebutton {
    return Intl.message(
      'Hit the orange button',
      name: 'hitorangebutton',
      desc: '',
      args: [],
    );
  }

  /// `down below to add meal`
  String get belowaddmeal {
    return Intl.message(
      'down below to add meal',
      name: 'belowaddmeal',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get category {
    return Intl.message(
      'Category',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get descriptiontextfield {
    return Intl.message(
      'Description',
      name: 'descriptiontextfield',
      desc: '',
      args: [],
    );
  }

  /// `Number`
  String get number {
    return Intl.message(
      'Number',
      name: 'number',
      desc: '',
      args: [],
    );
  }

  /// `Quantity`
  String get quantity {
    return Intl.message(
      'Quantity',
      name: 'quantity',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get policy {
    return Intl.message(
      'Privacy Policy',
      name: 'policy',
      desc: '',
      args: [],
    );
  }

  /// `FAQ`
  String get faq {
    return Intl.message(
      'FAQ',
      name: 'faq',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to logout?`
  String get logoutsure {
    return Intl.message(
      'Are you sure you want to logout?',
      name: 'logoutsure',
      desc: '',
      args: [],
    );
  }

  /// `You want to delete this meal?`
  String get deleteMealSure {
    return Intl.message(
      'You want to delete this meal?',
      name: 'deleteMealSure',
      desc: '',
      args: [],
    );
  }

  /// ` Find for food or restaurant..`
  String get search {
    return Intl.message(
      ' Find for food or restaurant..',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update {
    return Intl.message(
      'Update',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Delete Account`
  String get deleteaccount {
    return Intl.message(
      'Delete Account',
      name: 'deleteaccount',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure ?`
  String get areyousure {
    return Intl.message(
      'Are you sure ?',
      name: 'areyousure',
      desc: '',
      args: [],
    );
  }

  /// `Please choose your language`
  String get pleasechooselanguage {
    return Intl.message(
      'Please choose your language',
      name: 'pleasechooselanguage',
      desc: '',
      args: [],
    );
  }

  /// `you want for this app`
  String get youwantforthisapp {
    return Intl.message(
      'you want for this app',
      name: 'youwantforthisapp',
      desc: '',
      args: [],
    );
  }

  /// `What happens during signup and login ?`
  String get question1 {
    return Intl.message(
      'What happens during signup and login ?',
      name: 'question1',
      desc: '',
      args: [],
    );
  }

  /// `How do we handle password reset ?`
  String get question2 {
    return Intl.message(
      'How do we handle password reset ?',
      name: 'question2',
      desc: '',
      args: [],
    );
  }

  /// `How privacy is maintained ?`
  String get question3 {
    return Intl.message(
      'How privacy is maintained ?',
      name: 'question3',
      desc: '',
      args: [],
    );
  }

  /// `How to ensure the security of user data ?`
  String get question4 {
    return Intl.message(
      'How to ensure the security of user data ?',
      name: 'question4',
      desc: '',
      args: [],
    );
  }

  /// `Can users customize their language ?`
  String get question5 {
    return Intl.message(
      'Can users customize their language ?',
      name: 'question5',
      desc: '',
      args: [],
    );
  }

  /// `How can users manage their accounts ?`
  String get question6 {
    return Intl.message(
      'How can users manage their accounts ?',
      name: 'question6',
      desc: '',
      args: [],
    );
  }

  /// `What about account deletion ?`
  String get question7 {
    return Intl.message(
      'What about account deletion ?',
      name: 'question7',
      desc: '',
      args: [],
    );
  }

  /// `How does the app utilize user data ?`
  String get question8 {
    return Intl.message(
      'How does the app utilize user data ?',
      name: 'question8',
      desc: '',
      args: [],
    );
  }

  /// `How are user interactions with the app ?`
  String get question9 {
    return Intl.message(
      'How are user interactions with the app ?',
      name: 'question9',
      desc: '',
      args: [],
    );
  }

  /// `During signup and login, we collect basic user information such as email address, username, and password to facilitate account creation and authentication.`
  String get answer1 {
    return Intl.message(
      'During signup and login, we collect basic user information such as email address, username, and password to facilitate account creation and authentication.',
      name: 'answer1',
      desc: '',
      args: [],
    );
  }

  /// `Password reset requests are handled securely by sending a verification code to the user's registered email address. Once received, users can reset their password within the app.`
  String get answer2 {
    return Intl.message(
      'Password reset requests are handled securely by sending a verification code to the user\'s registered email address. Once received, users can reset their password within the app.',
      name: 'answer2',
      desc: '',
      args: [],
    );
  }

  /// `User-added meals are treated as confidential information. The app allows users to add and manage their meals independently. Users have control over the visibility and management of their meal data.`
  String get answer3 {
    return Intl.message(
      'User-added meals are treated as confidential information. The app allows users to add and manage their meals independently. Users have control over the visibility and management of their meal data.',
      name: 'answer3',
      desc: '',
      args: [],
    );
  }

  /// `We prioritize the security of user data by implementing robust encryption techniques and adhering to industry best practices. User data is stored securely and accessed only for necessary app functionalities.`
  String get answer4 {
    return Intl.message(
      'We prioritize the security of user data by implementing robust encryption techniques and adhering to industry best practices. User data is stored securely and accessed only for necessary app functionalities.',
      name: 'answer4',
      desc: '',
      args: [],
    );
  }

  /// `Yes, users have the flexibility to choose their preferred language between English and Arabic within the app settings.`
  String get answer5 {
    return Intl.message(
      'Yes, users have the flexibility to choose their preferred language between English and Arabic within the app settings.',
      name: 'answer5',
      desc: '',
      args: [],
    );
  }

  /// `Users have full control over their accounts and profile information. They can update their profile details, including personal information and meal preferences, at any time.`
  String get answer6 {
    return Intl.message(
      'Users have full control over their accounts and profile information. They can update their profile details, including personal information and meal preferences, at any time.',
      name: 'answer6',
      desc: '',
      args: [],
    );
  }

  /// `The app provides options for users to logout, delete their accounts, or deactivate their profiles. These features are accessible through the app settings for user convenience.`
  String get answer7 {
    return Intl.message(
      'The app provides options for users to logout, delete their accounts, or deactivate their profiles. These features are accessible through the app settings for user convenience.',
      name: 'answer7',
      desc: '',
      args: [],
    );
  }

  /// `User data collected during app usage is utilized solely for improving user experience and providing personalized services within the app. We do not share user data with third parties without user consent.`
  String get answer8 {
    return Intl.message(
      'User data collected during app usage is utilized solely for improving user experience and providing personalized services within the app. We do not share user data with third parties without user consent.',
      name: 'answer8',
      desc: '',
      args: [],
    );
  }

  /// `User interactions within the app, such as meal additions and updates, are tracked to enhance app functionality and tailor user experiences. This data helps us improve the app's performance and cater to user preferences.`
  String get answer9 {
    return Intl.message(
      'User interactions within the app, such as meal additions and updates, are tracked to enhance app functionality and tailor user experiences. This data helps us improve the app\'s performance and cater to user preferences.',
      name: 'answer9',
      desc: '',
      args: [],
    );
  }

  /// `Can I contact support for assistance ?`
  String get faq1 {
    return Intl.message(
      'Can I contact support for assistance ?',
      name: 'faq1',
      desc: '',
      args: [],
    );
  }

  /// `Can I change my language ?`
  String get faq2 {
    return Intl.message(
      'Can I change my language ?',
      name: 'faq2',
      desc: '',
      args: [],
    );
  }

  /// `How can I delete my account?`
  String get faq3 {
    return Intl.message(
      'How can I delete my account?',
      name: 'faq3',
      desc: '',
      args: [],
    );
  }

  /// `What info is collected during signup?`
  String get faq4 {
    return Intl.message(
      'What info is collected during signup?',
      name: 'faq4',
      desc: '',
      args: [],
    );
  }

  /// `Is my meal data private?`
  String get faq5 {
    return Intl.message(
      'Is my meal data private?',
      name: 'faq5',
      desc: '',
      args: [],
    );
  }

  /// `Can I manage my profile information?`
  String get faq6 {
    return Intl.message(
      'Can I manage my profile information?',
      name: 'faq6',
      desc: '',
      args: [],
    );
  }

  /// `Are there any security for user data?`
  String get faq7 {
    return Intl.message(
      'Are there any security for user data?',
      name: 'faq7',
      desc: '',
      args: [],
    );
  }

  /// `How do I add meals to the app?`
  String get faq8 {
    return Intl.message(
      'How do I add meals to the app?',
      name: 'faq8',
      desc: '',
      args: [],
    );
  }

  /// `Is there a way to logout from the app?`
  String get faq9 {
    return Intl.message(
      'Is there a way to logout from the app?',
      name: 'faq9',
      desc: '',
      args: [],
    );
  }

  /// `Yes, you can contact our support team for further assistance. Simply reach out through the app's help center or contact us via email, and we'll be happy to assist you with any queries or concerns.`
  String get faqanswer1 {
    return Intl.message(
      'Yes, you can contact our support team for further assistance. Simply reach out through the app\'s help center or contact us via email, and we\'ll be happy to assist you with any queries or concerns.',
      name: 'faqanswer1',
      desc: '',
      args: [],
    );
  }

  /// `Yes, you can change your language preference within the app's settings. You have the option to switch between English and Arabic languages.`
  String get faqanswer2 {
    return Intl.message(
      'Yes, you can change your language preference within the app\'s settings. You have the option to switch between English and Arabic languages.',
      name: 'faqanswer2',
      desc: '',
      args: [],
    );
  }

  /// `To delete your account, go to the account settings section in the app and select the option to delete your account. Please note that this action is irreversible and will permanently delete all your data.`
  String get faqanswer3 {
    return Intl.message(
      'To delete your account, go to the account settings section in the app and select the option to delete your account. Please note that this action is irreversible and will permanently delete all your data.',
      name: 'faqanswer3',
      desc: '',
      args: [],
    );
  }

  /// `During signup, we collect basic user information such as email address, username, and password to create your account and ensure secure login.`
  String get faqanswer4 {
    return Intl.message(
      'During signup, we collect basic user information such as email address, username, and password to create your account and ensure secure login.',
      name: 'faqanswer4',
      desc: '',
      args: [],
    );
  }

  /// `Yes, your meal data is private. Only you have access to the meals you add through the app. We prioritize the security and privacy of your data.`
  String get faqanswer5 {
    return Intl.message(
      'Yes, your meal data is private. Only you have access to the meals you add through the app. We prioritize the security and privacy of your data.',
      name: 'faqanswer5',
      desc: '',
      args: [],
    );
  }

  /// `Yes, you can manage your profile information within the app. Simply navigate to the profile settings where you can update your personal details and meal preferences.`
  String get faqanswer6 {
    return Intl.message(
      'Yes, you can manage your profile information within the app. Simply navigate to the profile settings where you can update your personal details and meal preferences.',
      name: 'faqanswer6',
      desc: '',
      args: [],
    );
  }

  /// `We have implemented robust security measures to protect user data. This includes encryption techniques and adherence to industry best practices to ensure the confidentiality and integrity of your information.`
  String get faqanswer7 {
    return Intl.message(
      'We have implemented robust security measures to protect user data. This includes encryption techniques and adherence to industry best practices to ensure the confidentiality and integrity of your information.',
      name: 'faqanswer7',
      desc: '',
      args: [],
    );
  }

  /// `You can add meals to the app by using the meal addition feature. As a user, you are treated as a chef and can add your meals through the app's interface or API.`
  String get faqanswer8 {
    return Intl.message(
      'You can add meals to the app by using the meal addition feature. As a user, you are treated as a chef and can add your meals through the app\'s interface or API.',
      name: 'faqanswer8',
      desc: '',
      args: [],
    );
  }

  /// `Yes, you can logout from the app by accessing the logout option in the app's settings or menu.`
  String get faqanswer9 {
    return Intl.message(
      'Yes, you can logout from the app by accessing the logout option in the app\'s settings or menu.',
      name: 'faqanswer9',
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
