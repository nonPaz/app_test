// ignore_for_file: avoid_print

import 'dart:async';

import 'package:app_test/config/flavor_config.dart';
import 'package:flutter/material.dart';

import 'main.dart';

void main(){
  FlavorConfig(
      flavor: Flavor.BETA,
      values: FlavorValues(
          baseURL: 'api2'
      )
  );

  runZonedGuarded(()=> runApp(const MyApp()),
          (error, stackTrace) {
        print('runZonedGuarded: Caught error in my root zone.');
      });
}