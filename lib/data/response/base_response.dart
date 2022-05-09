class BaseResponse{
  int? resultCode;
  String? statusMessage;

  BaseResponse.fromJson(Map<String, dynamic> parsedJson){
    resultCode = parsedJson['result_code'];
    statusMessage = parsedJson['status_message'];
  }
}