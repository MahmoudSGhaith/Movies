
import 'package:movies/authentication/data/models/login/login_response_model/LoginResponse.dart';

abstract class AuthRepositories {
  Future<LoginResponse> login(
      {required String email, required String password});
}