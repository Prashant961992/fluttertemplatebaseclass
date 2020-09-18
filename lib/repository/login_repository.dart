import '../index.dart';

class LoginRepository {
  final baseApiProvider = ApiProvider();

  Future<LoginResponse> login(LoginRequest request) async {
    final response = await baseApiProvider.call(
      url: "/api/v1/Auth/login",
      method: HTTPMethod.POST, 
      request: request.toJson()
    );
    return new LoginResponse.fromJson(response);
  }

}
