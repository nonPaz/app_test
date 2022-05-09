// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter/material.dart';

import 'config/flavor_config.dart';
import 'main.dart';

void main(){
  FlavorConfig(
      flavor: Flavor.PRODUCTION,
      values: FlavorValues(
          baseURL: 'api3'
      )
  );

  runZonedGuarded(()=> runApp(const MyApp()),
          (error, stackTrace) {
            print('runZonedGuarded: Caught error in my root zone.');
      });
}