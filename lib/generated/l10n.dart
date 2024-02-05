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
