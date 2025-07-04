import 'dart:io';

import 'package:flutter/material.dart';
import 'package:movies/core/result.dart';

class ErrorStateWidget extends StatelessWidget {
  final ServerError? serverError;
  final GeneralException? exception;

  const ErrorStateWidget({super.key, this.serverError, this.exception});

  @override
  Widget build(BuildContext context) {
    return Text(extractErrorMsg());
  }

  String extractErrorMsg() {
    String msg = "error";
    if (serverError != null) {
      msg = serverError!.statusMessage;
      return msg;
    }
    // "is" because we compare between objects
    if (exception is SocketException) {
      msg = 'No Internet connection 😑';
      return msg;
    }
    if (exception is HttpException) {
      msg = "Couldn't find the post 😱";
      return msg;
    }
    if (exception is FormatException) {
      msg = "Bad response format 👎";
      return msg;
    }
    return msg;
  }
}
