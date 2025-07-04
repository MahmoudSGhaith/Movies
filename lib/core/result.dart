sealed class Result<T>{}

class Success<T> extends Result<T>{
  T data;
  Success({required this.data});
}

class ServerError<T> extends Result<T>{
  String status;
  String statusMessage;
  ServerError({required this.status, required this.statusMessage});
}

class GeneralException<T> extends Result<T>{
  Exception exception;
  GeneralException({required this.exception});
}
