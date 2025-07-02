import 'package:dio/dio.dart';
import 'package:movies/authentication/app_services/storage_service.dart';
import 'package:movies/authentication/data/data_repositories/auth_repositories.dart';
import 'package:movies/authentication/data/data_sources/auth_data_source/auth_data_source.dart';
import 'package:movies/authentication/data/models/login/login_response_model/LoginResponse.dart';
import 'package:movies/authentication/error_handler/LoginErrorHandler.dart';

class AuthRepositoriesImpl implements AuthRepositories {
  AuthDataSource authDataSource;

  AuthRepositoriesImpl(this.authDataSource);

  @override
  Future<LoginResponse> login({
    required String email,
    required String password,
  }) async {
    try {
      var response = await authDataSource.login(
        email: email,
        password: password,
      );
      if (response.statusCode == 200) {
        LoginResponse data = LoginResponse.fromJson(response.data);
        await StorageService.saveToken(data.data!);
        return data;
      } else {
        var errorMessage = LoginErrorHandler.fromJson(response.data);
        throw errorMessage.message ?? "";
      }
    } on DioException catch (error, s) {
      var errorMessage = LoginErrorHandler.fromJson(error.response?.data);
      throw errorMessage.message ?? "";
    } catch (error, s) {
      print(error);
      print(s);
      rethrow;
    }
  }
}
