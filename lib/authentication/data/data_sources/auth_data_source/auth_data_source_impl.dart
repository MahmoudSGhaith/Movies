import 'package:dio/src/response.dart';
import 'package:movies/authentication/data/data_sources/auth_data_source/auth_data_source.dart';
import 'package:movies/authentication/app_services/network_services.dart';

class AuthDataSourceImpl implements AuthDataSource {
  NetworkServices networkServices;

  AuthDataSourceImpl(this.networkServices);

  @override
  Future<Response> login({required String email, required String password}) {
    return networkServices.dio.post(
      "auth/login",
      data: {"email": email, "password": password},
    );
  }
}
