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
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Welcome to Smartora!`
  String get welcome {
    return Intl.message(
      'Welcome to Smartora!',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Log in to control your smart home devices anytime, anywhere.`
  String get login_prompt {
    return Intl.message(
      'Log in to control your smart home devices anytime, anywhere.',
      name: 'login_prompt',
      desc: '',
      args: [],
    );
  }

  /// `Log In`
  String get login_button {
    return Intl.message('Log In', name: 'login_button', desc: '', args: []);
  }

  /// `Sign Up`
  String get signup_button {
    return Intl.message('Sign Up', name: 'signup_button', desc: '', args: []);
  }

  /// `Enter your email`
  String get email_hint {
    return Intl.message(
      'Enter your email',
      name: 'email_hint',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get password_hint {
    return Intl.message(
      'Enter your password',
      name: 'password_hint',
      desc: '',
      args: [],
    );
  }

  /// `Wind`
  String get wind {
    return Intl.message('Wind', name: 'wind', desc: '', args: []);
  }

  /// `Humidity`
  String get humidity {
    return Intl.message('Humidity', name: 'humidity', desc: '', args: []);
  }

  /// `Temperature`
  String get temperature {
    return Intl.message('Temperature', name: 'temperature', desc: '', args: []);
  }

  /// `Light`
  String get light {
    return Intl.message('Light', name: 'light', desc: '', args: []);
  }

  /// `Fan`
  String get fan {
    return Intl.message('Fan', name: 'fan', desc: '', args: []);
  }

  /// `Buzzer`
  String get buzzer {
    return Intl.message('Buzzer', name: 'buzzer', desc: '', args: []);
  }

  /// `Garage`
  String get garage {
    return Intl.message('Garage', name: 'garage', desc: '', args: []);
  }

  /// `Pump`
  String get pump {
    return Intl.message('Pump', name: 'pump', desc: '', args: []);
  }

  /// `Living Room`
  String get living_room {
    return Intl.message('Living Room', name: 'living_room', desc: '', args: []);
  }

  /// `Kitchen`
  String get kitchen {
    return Intl.message('Kitchen', name: 'kitchen', desc: '', args: []);
  }

  /// `Garage Door`
  String get garage_door {
    return Intl.message('Garage Door', name: 'garage_door', desc: '', args: []);
  }

  /// `Garden`
  String get garden {
    return Intl.message('Garden', name: 'garden', desc: '', args: []);
  }

  /// `Window`
  String get window {
    return Intl.message('Window', name: 'window', desc: '', args: []);
  }

  /// `Humidity Sensor`
  String get humidity_sensor {
    return Intl.message(
      'Humidity Sensor',
      name: 'humidity_sensor',
      desc: '',
      args: [],
    );
  }

  /// `Temperature Sensor`
  String get temperature_sensor {
    return Intl.message(
      'Temperature Sensor',
      name: 'temperature_sensor',
      desc: '',
      args: [],
    );
  }

  /// `Light Sensor`
  String get light_sensor {
    return Intl.message(
      'Light Sensor',
      name: 'light_sensor',
      desc: '',
      args: [],
    );
  }

  /// `Soil Moisture Sensor`
  String get soil_moisture_sensor {
    return Intl.message(
      'Soil Moisture Sensor',
      name: 'soil_moisture_sensor',
      desc: '',
      args: [],
    );
  }

  /// `Ultrasonic Sensor`
  String get ultrasonic_sensor {
    return Intl.message(
      'Ultrasonic Sensor',
      name: 'ultrasonic_sensor',
      desc: '',
      args: [],
    );
  }

  /// `Gas Sensor`
  String get gas_sensor {
    return Intl.message('Gas Sensor', name: 'gas_sensor', desc: '', args: []);
  }

  /// `Location`
  String get location {
    return Intl.message('Location', name: 'location', desc: '', args: []);
  }

  /// `Device Name`
  String get device_name {
    return Intl.message('Device Name', name: 'device_name', desc: '', args: []);
  }

  /// `Status`
  String get status {
    return Intl.message('Status', name: 'status', desc: '', args: []);
  }

  /// `Value`
  String get value {
    return Intl.message('Value', name: 'value', desc: '', args: []);
  }

  /// `Warning`
  String get warning {
    return Intl.message('Warning', name: 'warning', desc: '', args: []);
  }

  /// `Normal`
  String get info {
    return Intl.message('Normal', name: 'info', desc: '', args: []);
  }

  /// `Error`
  String get error {
    return Intl.message('Error', name: 'error', desc: '', args: []);
  }

  /// `No data available`
  String get no_data {
    return Intl.message(
      'No data available',
      name: 'no_data',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get loading {
    return Intl.message('Loading...', name: 'loading', desc: '', args: []);
  }

  /// `Sensors`
  String get sensors {
    return Intl.message('Sensors', name: 'sensors', desc: '', args: []);
  }

  /// `Devices`
  String get devices {
    return Intl.message('Devices', name: 'devices', desc: '', args: []);
  }

  /// `Analytics`
  String get analytics {
    return Intl.message('Analytics', name: 'analytics', desc: '', args: []);
  }

  /// `Clouds`
  String get clouds {
    return Intl.message('Clouds', name: 'clouds', desc: '', args: []);
  }

  /// `Rain`
  String get rain {
    return Intl.message('Rain', name: 'rain', desc: '', args: []);
  }

  /// `Clear`
  String get clear {
    return Intl.message('Clear', name: 'clear', desc: '', args: []);
  }

  /// `Snow`
  String get snow {
    return Intl.message('Snow', name: 'snow', desc: '', args: []);
  }

  /// `Thunderstorm`
  String get thunderstorm {
    return Intl.message(
      'Thunderstorm',
      name: 'thunderstorm',
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
