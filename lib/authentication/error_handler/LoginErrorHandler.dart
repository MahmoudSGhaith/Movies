class LoginErrorHandler {
  LoginErrorHandler({
      this.statusCode, 
      this.message,});

  LoginErrorHandler.fromJson(dynamic json) {
    statusCode = json['statusCode'];
    message = json['message'];
  }
  num? statusCode;
  String? message;

}