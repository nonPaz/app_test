// ignore_for_file: constant_identifier_names

enum Flavor{
  DEVELOPMENT,
  BETA,
  PRODUCTION
}

class FlavorValues{
  final String baseURL;
  String? baseURLAPI;

  FlavorValues({
    required this.baseURL
  }){
    baseURLAPI = baseURL;
  }
}

class FlavorConfig{
  final Flavor flavor;
  final FlavorValues values;
  static FlavorConfig? _flavorConfig;

  FlavorConfig({required this.flavor, required this.values}){
    _flavorConfig = FlavorConfig._internal(flavor, values);
  }

  FlavorConfig._internal(this.flavor, this.values);
  static FlavorConfig? get instance {return _flavorConfig;}
}
