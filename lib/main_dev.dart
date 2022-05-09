// ignore_for_file: avoid_print

import 'dart:async';

import 'package:app_test/config/flavor_config.dart';
import 'package:app_test/main.dart';
import 'package:flutter/cupertino.dart';

void main(){
  FlavorConfig(
    flavor: Flavor.DEVELOPMENT,
    values: FlavorValues(
      baseURL: 'api1'
    )
  );

  runZonedGuarded(()=> runApp(const MyApp()),
          (error, stackTrace) {
            print('runZonedGuarded: Caught error in my root zone.');
          });
}